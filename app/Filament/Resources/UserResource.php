<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;
use App\Models\Siswa;
use App\Models\Guru;
use App\Models\Sekolah;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Filament\Notifications\Notification;

class UserResource extends Resource
{
    protected static ?string $model = User::class;
    protected static ?string $navigationIcon = 'heroicon-o-users';

    // Method untuk menentukan Grup Navigasi secara dinamis
    public static function getNavigationGroup(): string
    {
        $user = Auth::user();
        if ($user->isSuperAdmin()) {
            return "Manajemen Data";
        }
        return "Pengaturan";
    }

    public static function getNavigationSort(): int
    {
        $user = Auth::user();
        if ($user->isSuperAdmin()) {
            return 3;
        }
        return 1;
    }

    // Method untuk menentukan Ikon Navigasi secara dinamis
    public static function getNavigationIcon(): string
    {
        $user = Auth::user();
        if ($user && $user->isAdminSekolah()) {
            return 'heroicon-o-cog';
        }
        if ($user && $user->isSuperAdmin()) {
            return 'heroicon-o-users';
        }
        return 'heroicon-o-users';
    }

    // Method untuk menentukan Label Navigasi secara dinamis
    public static function getNavigationLabel(): string
    {
        $user = Auth::user();
        if ($user && $user->isSuperAdmin()) {
            return 'Data Akun Sekolah';
        }
        if ($user && $user->isAdminSekolah()) {
            return 'Data Akun Pengguna';
        }
        return 'Data User';
    }

    // Method untuk menampilkan menu ini hanya untuk role tertentu
    public static function canViewAny(): bool
{
    $user = Auth::user();
    return $user->isSuperAdmin() || $user->isAdminSekolah();
}

// Method untuk membatasi create hanya untuk admin sekolah dengan ref_id
    public static function canCreate(): bool
    {
        $user = Auth::user();
        
        // Hanya admin sekolah dengan ref_id (admin utama) yang bisa create
        if ($user->isAdminSekolah() && !is_null($user->ref_id)) {
            return true;
        }
        
        return false;
    }

    // Method untuk memfilter data yang ditampilkan di tabel
    public static function getEloquentQuery(): Builder
    {
        /** @var \App\Models\User $user */
        $user = Auth::user();
        $query = parent::getEloquentQuery();

        if ($user->isSuperAdmin()) {
            return $query->where('role_type', 'admin_sekolah')->whereNotNull('ref_id');
        }

        if ($user->isAdminSekolah()) {
            $query->where('sekolah_id', $user->sekolah_id);

            if (is_null($user->ref_id)) { // Jika dia Humas Biasa
                $query->where(function (Builder $subQuery) use ($user) {
                    $subQuery->where('role_type', '!=', 'admin_sekolah')
                        ->orWhere('id', $user->id);
                });
            }
        }

        return $query;
    }

    // Mendefinisikan form untuk Create dan Edit
    public static function form(Form $form): Form
    {
        $record = $form->getRecord();

        // Form untuk halaman CREATE (membuat humas baru)
        if (!$record) {
            return $form->schema([
                Forms\Components\Repeater::make('users')
                    ->label('Admin Sekolah (Humas)')
                    ->schema([
                        Forms\Components\TextInput::make('name')->required()->label('Nama'),
                        Forms\Components\TextInput::make('username')->required()->label('Username')->unique(ignoreRecord: true),
                        Forms\Components\TextInput::make('email')->required()->email()->label('Email')->unique(ignoreRecord: true),
                        Forms\Components\Hidden::make('sekolah_id')->default(fn() => Auth::user()->sekolah_id),
                        Forms\Components\TextInput::make('password')->required()->minLength(8)->label('Password'),
                    ])
                    ->minItems(1)
                    ->columns(2),
            ]);
        }

        // Form untuk halaman EDIT (mengubah username/password siswa, guru, dll)
        return $form->schema([
            Forms\Components\TextInput::make('name')
                ->label('Nama Lengkap')
                ->disabled()
                ->dehydrated(false),
            Forms\Components\TextInput::make('username')
                ->required()
                ->label('Username')
                ->unique(ignoreRecord: true),
            Forms\Components\TextInput::make('password')
                ->password()
                ->label('Password Baru (Opsional)')
                ->dehydrated(fn($state) => filled($state))
                ->revealable()
                ->helperText('Isi kolom ini hanya jika Anda ingin mengubah password.'),
        ]);
    }

    // Mendefinisikan tampilan tabel
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')->searchable(),
                Tables\Columns\TextColumn::make('username')->searchable(),
                Tables\Columns\TextColumn::make('email')->searchable(),
                Tables\Columns\TextColumn::make('role_type')->label('Role')->badge(),
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')->label('Sekolah')->visible(fn() => Auth::user()->isSuperAdmin()),
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->visible(function (Model $record): bool {
                        $user = Auth::user();
                        
                        // Admin sekolah dengan ref_id tidak null bisa edit dirinya sendiri dan humas lain
                        if ($user->isAdminSekolah() && !is_null($user->ref_id)) {
                            return true;
                        }
                        
                        // User tidak bisa edit dirinya sendiri (kecuali admin sekolah dengan ref_id tidak null)
                        if ($record->id === $user->id) return false;
                        
                        // Humas biasa (ref_id null) tidak bisa edit admin sekolah
                        if ($user->isAdminSekolah() && is_null($user->ref_id)) {
                            return $record->role_type !== 'admin_sekolah';
                        }
                        
                        return true;
                    }),
                Tables\Actions\DeleteAction::make()
                    ->visible(function (Model $record): bool {
                        $user = Auth::user();
                        if ($record->id === $user->id) return false;
                        if ($user->isSuperAdmin()) return true;

                        if ($user->isAdminSekolah()) {
                            if (!is_null($user->ref_id)) return true; // Admin utama
                            if (is_null($user->ref_id)) { // Humas biasa
                                return $record->role_type !== 'admin_sekolah';
                            }
                        }
                        return false;
                    }),
                Tables\Actions\ViewAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->headerActions([
                Tables\Actions\Action::make('auto_create_users')
                    ->label('Auto Create Users')
                    ->icon('heroicon-o-user-plus')
                    ->color('success')
                    ->visible(fn() => Auth::user()->isAdminSekolah())
                    ->action(function () {
                        set_time_limit(0);
                        $createdCount = self::autoCreateUsers();
                        if ($createdCount > -1) { // Hanya tampilkan notif jika proses tidak di-cancel
                            Notification::make()
                                ->title('Proses Selesai')
                                ->body("Berhasil membuat {$createdCount} user baru.")
                                ->success()
                                ->send();
                        }
                    })
                    ->requiresConfirmation(),
            ]);
    }

    // Fungsi untuk membuat user secara otomatis
    public static function autoCreateUsers(): int
    {
        $user = Auth::user();
        if (!$user || !$user->sekolah_id) {
            Notification::make()->title('Aksi Gagal')->body('Anda tidak terasosiasi dengan sekolah.')->danger()->send();
            return -1;
        }

        $sekolah = Sekolah::find($user->sekolah_id);
        if (!$sekolah) {
            Notification::make()->title('Sekolah Tidak Ditemukan')->body('Data sekolah tidak valid.')->danger()->send();
            return -1;
        }

        $jumlahUserSaatIni = User::where('sekolah_id', $sekolah->id)->count();
        $sisaKuota = $sekolah->batas_akun - $jumlahUserSaatIni;

        if ($sisaKuota <= 0) {
            Notification::make()->title('Kuota Akun Habis')->body('Kuota akun telah terpenuhi. Hubungi Super Admin.')->warning()->send();
            return 0;
        }

        $created = 0;
        $siswas = Siswa::where('sekolah_id', $sekolah->id)->whereDoesntHave('user')->get();
        foreach ($siswas as $siswa) {
            if ($created >= $sisaKuota) break;
            User::create([
                'name' => $siswa->nama_siswa,
                'username' => $siswa->nis,
                'email' => $siswa->nis . '@jurnalpkl.id',
                'password' => Hash::make($siswa->nis),
                'role_type' => 'siswa',
                'role_id' => 1,
                'ref_id' => $siswa->id,
                'sekolah_id' => $siswa->sekolah_id,
            ]);
            $created++;
        }

        $gurus = Guru::where('sekolah_id', $sekolah->id)->whereDoesntHave('user')->get();
        foreach ($gurus as $guru) {
            if ($created >= $sisaKuota) break;
            User::create([
                'name' => $guru->nama_guru,
                'username' => $guru->nip,
                'email' => $guru->nip . '@jurnalpkl.id',
                'password' => Hash::make($guru->nip),
                'role_type' => 'guru',
                'role_id' => 2,
                'ref_id' => $guru->id,
                'sekolah_id' => $guru->sekolah_id,
            ]);
            $created++;
        }

        if ($created < ($siswas->count() + $gurus->count()) && $created > 0) {
            Notification::make()->title('Kuota Terbatas')->body("Hanya {$created} akun berhasil dibuat karena mencapai batas kuota.")->warning()->send();
        }

        return $created;
    }

    // Mendefinisikan halaman yang terkait dengan resource ini
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
            'view' => Pages\ViewUser::route('/{record}'),
        ];
    }
}
