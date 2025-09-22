<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;
use App\Models\Siswa;
use App\Models\Guru;
use App\Models\Dudi;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Filament\Notifications\Notification;

class UserResource extends Resource
{
    protected static ?string $model = User::class;
    protected static ?string $navigationIcon = 'heroicon-o-users';
    protected static ?string $navigationLabel = 'Data User';
    protected static ?string $pluralModelLabel = 'Data User';
    protected static ?string $modelLabel = 'Data User';
    protected static ?string $navigationGroup = 'Pengaturan';

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        return $user && $user->isAdmin();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('email')
                    ->email()
                    ->required()
                    ->maxLength(255)
                    ->unique(User::class, 'email', ignoreRecord: true),

                Forms\Components\TextInput::make('username')
                    ->required()
                    ->maxLength(255)
                    ->unique(User::class, 'username', ignoreRecord: true),

                Forms\Components\Select::make('role_type')
                    ->label('Role Type')
                    ->options([
                        'admin_pusat' => 'Admin Pusat',
                        'admin_sekolah' => 'Admin Sekolah',
                        'siswa' => 'Siswa',
                        'guru' => 'Guru',
                        'dudi' => 'Dudi Pembimbing',
                    ])
                    ->required()
                    ->reactive()
                    ->afterStateUpdated(function (callable $set, $state) {
                        $set('ref_id', null);
                        $roleMapping = [
                            'admin_pusat' => 0,
                            'admin_sekolah' => 0,
                            'siswa' => 1,
                            'guru' => 2,
                            'dudi' => 3,
                        ];
                        $set('role_id', $roleMapping[$state] ?? 0);
                    }),

                Forms\Components\Select::make('sekolah_id')
                    ->label('Sekolah')
                    ->relationship('sekolah', 'nama_sekolah')
                    ->visible(fn(callable $get) => !in_array($get('role_type'), ['admin_pusat'])),

                Forms\Components\Select::make('ref_id')
                    ->label(function (callable $get) {
                        $roleType = $get('role_type');
                        return match ($roleType) {
                            'siswa' => 'Pilih Siswa',
                            'guru' => 'Pilih Guru',
                            'dudi' => 'Pilih Dudi',
                            default => 'Reference ID'
                        };
                    })
                    ->options(function (callable $get) {
                        $roleType = $get('role_type');
                        $sekolahId = $get('sekolah_id');

                        return match ($roleType) {
                            'siswa' => Siswa::when($sekolahId, fn($q) => $q->where('sekolah_id', $sekolahId))
                                ->pluck('nama_siswa', 'id')->toArray(),
                            'guru' => Guru::when($sekolahId, fn($q) => $q->where('sekolah_id', $sekolahId))
                                ->pluck('nama_guru', 'id')->toArray(),
                            'dudi' => Dudi::when($sekolahId, fn($q) => $q->where('sekolah_id', $sekolahId))
                                ->pluck('nama_dudi', 'id')->toArray(),
                            default => []
                        };
                    })
                    ->visible(fn(callable $get) => in_array($get('role_type'), ['siswa', 'guru', 'dudi']))
                    ->searchable(),

                Forms\Components\TextInput::make('password')
                    ->password()
                    ->required(fn($context) => $context === 'create')
                    ->maxLength(255)
                    ->dehydrated(fn($state) => filled($state))
                    ->dehydrateStateUsing(fn($state) => Hash::make($state)),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('username')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('email')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('role_type')
                    ->label('Role Type')
                    ->formatStateUsing(fn($state) => [
                        'admin_pusat' => 'Admin Pusat',
                        'admin_sekolah' => 'Admin Sekolah',
                        'siswa' => 'Siswa',
                        'guru' => 'Guru',
                        'dudi' => 'Dudi Pembimbing',
                    ][$state] ?? '-')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'admin_pusat' => 'danger',
                        'admin_sekolah' => 'primary',
                        'siswa' => 'success',
                        'guru' => 'warning',
                        'dudi' => 'info',
                        default => 'gray',
                    }),

                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->searchable(),

                Tables\Columns\TextColumn::make('reference_name')
                    ->label('Reference')
                    ->getStateUsing(function (User $record) {
                        return match ($record->role_type) {
                            'siswa' => Siswa::find($record->ref_id)?->nama_siswa ?? '-',
                            'guru' => Guru::find($record->ref_id)?->nama_guru ?? '-',
                            'dudi' => Dudi::find($record->ref_id)?->nama_dudi ?? '-',
                            default => '-'
                        };
                    }),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('role_type')
                    ->options([
                        'admin_pusat' => 'Admin Pusat',
                        'admin_sekolah' => 'Admin Sekolah',
                        'siswa' => 'Siswa',
                        'guru' => 'Guru',
                        'dudi' => 'Dudi Pembimbing',
                    ]),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
                    ->action(function () {
                        $created = static::autoCreateUsers();

                        Notification::make()
                            ->title('Auto Create Selesai')
                            ->body("Berhasil membuat {$created} user baru")
                            ->success()
                            ->send();
                    })
                    ->requiresConfirmation()
                    ->modalHeading('Auto Create Users')
                    ->modalDescription('Ini akan membuat user otomatis untuk semua siswa, guru, dan dudi yang belum memiliki user account.')
                    ->modalSubmitActionLabel('Ya, Buat User'),
            ]);
    }

    public static function autoCreateUsers(): int
    {
        $created = 0;

        // Auto create untuk siswa
        $siswasWithoutUser = Siswa::whereDoesntHave('user')->get();
        foreach ($siswasWithoutUser as $siswa) {
            User::create([
                'name' => $siswa->nama_siswa,
                'username' => $siswa->nis,
                'email' => $siswa->nis . '@siswa.com',
                'password' => Hash::make($siswa->nis),
                'role_id' => 1,
                'role_type' => 'siswa',
                'ref_id' => $siswa->id,
                'sekolah_id' => $siswa->sekolah_id,
            ]);
            $created++;
        }

        // Auto create untuk guru
        $gurusWithoutUser = Guru::whereDoesntHave('user')->get();
        foreach ($gurusWithoutUser as $guru) {
            User::create([
                'name' => $guru->nama_guru,
                'username' => $guru->nip,
                'email' => $guru->nip . '@guru.com',
                'password' => Hash::make($guru->nip),
                'role_id' => 2,
                'role_type' => 'guru',
                'ref_id' => $guru->id,
                'sekolah_id' => $guru->sekolah_id,
            ]);
            $created++;
        }

        // Auto create untuk dudi
        $dudisWithoutUser = Dudi::whereDoesntHave('user')->get();
        foreach ($dudisWithoutUser as $dudi) {
            $username = 'dudi_' . $dudi->id;
            User::create([
                'name' => $dudi->nama_dudi,
                'username' => $username,
                'email' => $username . '@dudi.com',
                'password' => Hash::make($username),
                'role_id' => 3,
                'role_type' => 'dudi',
                'ref_id' => $dudi->id,
                'sekolah_id' => $dudi->sekolah_id,
            ]);
            $created++;
        }

        return $created;
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'view' => Pages\ViewUser::route('/{record}'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
