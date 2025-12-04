<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DudiResource\Pages;
use App\Models\Dudi;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use App\Models\Scopes\TahunAjaranScope;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Tables\Filters\SelectFilter;
// --- TAMBAHAN USE STATEMENTS ---
use App\Models\DudiPembimbing;
use Filament\Tables\Actions\Action;
use Filament\Notifications\Notification;

class DudiResource extends Resource
{
    protected static ?string $model = Dudi::class;
    protected static ?string $navigationIcon = 'heroicon-o-building-office-2';
    protected static ?string $navigationLabel = 'Data Dudi';
    protected static ?string $pluralModelLabel = 'Data Dudi';
    protected static ?string $modelLabel = 'Data Dudi';
    protected static ?string $navigationGroup = 'Manajemen Data';
    protected static ?int $navigationSort = 4;

    public static function getNavigationLabel(): string
    {
        $user = Auth::user();
        if ($user && $user->isDudiPembimbing()) {
            return 'Dudi Saya';
        }
        return 'Data Dudi';
    }
    public static function getPluralModelLabel(): string
    {
        $user = Auth::user();
        if ($user && $user->isDudiPembimbing()) {
            return 'Dudi Saya';
        }
        return 'Data Dudi';
    }

    // UBAH FUNGSI INI
    public static function canViewAny(): bool
    {
        $user = Auth::user();
        // Izinkan Admin Sekolah DAN Dudi Pembimbing
        return $user->isAdminSekolah() || $user->isDudiPembimbing();
    }

    public static function canCreate(): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function canEdit($record): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function canDelete($record): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    // UBAH FUNGSI INI
    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        // Izinkan Admin Sekolah DAN Dudi Pembimbing
        return $user->isAdminSekolah() || $user->isDudiPembimbing();
    }

    // --- TAMBAHKAN FUNGSI BARU INI ---
    /**
     * Filter query berdasarkan role
     */
    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        $query = parent::getEloquentQuery();

        if ($user->isDudiPembimbing()) {
            // Temukan dudi_id dari DudiPembimbing
            $dudiPembimbing = DudiPembimbing::find($user->ref_id);
            if ($dudiPembimbing) {
                // Hanya tampilkan DUDI milik pembimbing ini
                return $query->where('id', $dudiPembimbing->dudi_id);
            } else {
                // Jika tidak terhubung, jangan tampilkan apa-apa
                return $query->whereRaw('0 = 1');
            }
        }
        
        // Admin Sekolah hanya bisa lihat data di sekolahnya dan tahun ajaran yang dipilih
        if ($user->isAdminSekolah()) {
            return $query->where('sekolah_id', $user->sekolah_id);
        }
        
        return $query;
    }


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nama_dudi')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('alamat')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('telepon')
                    ->tel()
                    ->maxLength(255),
                Forms\Components\TextInput::make('nama_pimpinan')
                    ->maxLength(255),
                Forms\Components\TextInput::make('instruktur')
                    ->maxLength(255),
            ]);
    }

    // --- GANTI TOTAL FUNGSI table() ---
    public static function table(Table $table): Table
    {
        $user = Auth::user();
        
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_dudi')
                    ->searchable(),
                Tables\Columns\TextColumn::make('alamat')
                    ->searchable()
                    ->visible(fn() => $user->isAdminSekolah()),
                Tables\Columns\TextColumn::make('bidang_usaha')
                    ->searchable()
                    ->visible(fn() => $user->isAdminSekolah()),
                Tables\Columns\TextColumn::make('pimpinan')
                    ->searchable()
                    ->visible(fn() => $user->isAdminSekolah()),
                Tables\Columns\TextColumn::make('instruktur')
                    ->searchable()
                    ->visible(fn() => $user->isAdminSekolah()),
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: false)
                    ->visible(fn() => $user->isAdminSekolah()),
                
                // Tambah kolom status lokasi
                Tables\Columns\IconColumn::make('latitude')
                    ->label('Lokasi')
                    ->icon(fn (?string $state): string =>
                        blank($state) ? 'heroicon-o-x-circle' : 'heroicon-o-check-circle'
                    )
                    ->color(fn (?string $state): string =>
                        blank($state) ? 'danger' : 'success'
                    )
                    ->tooltip(fn (?string $state): string =>
                        blank($state) ? 'Lokasi belum diatur' : 'Lokasi sudah diatur'
                    )
            ])
            ->filters([
                // ... (Filter Anda bisa ditambahkan di sini jika perlu)
            ])
            ->actions([
                // --- AKSI MODAL BARU KITA ---
                Action::make('setLokasi')
                    ->label('Set Lokasi')
                    ->icon('heroicon-o-map-pin')
                    ->modalWidth('4xl') // Buat modal lebih besar untuk peta
                    // Tampil untuk Admin DAN Pembimbing
                    ->visible(fn() => $user->isDudiPembimbing())
                    
                    // Ini mengisi form modal saat dibuka
                    ->fillForm(fn (Dudi $record): array => [
                        'latitude' => $record->latitude,
                        'longitude' => $record->longitude,
                        'radius' => $record->radius ?? 100,
                    ])
                    
                    // Ini adalah form di dalam modal
                    ->form([
                        Forms\Components\TextInput::make('latitude')
                            ->label('Latitude')
                            ->readonly() // Ubah dari disabled ke readonly agar tetap terkirim
                            ->dehydrated() // Pastikan data dikirim saat submit
                            ->live(), // 'live' agar bisa diupdate oleh JS
                        Forms\Components\TextInput::make('longitude')
                            ->label('Longitude')
                            ->readonly() // Ubah dari disabled ke readonly agar tetap terkirim
                            ->dehydrated() // Pastikan data dikirim saat submit
                            ->live(), // 'live' agar bisa diupdate oleh JS
                        Forms\Components\TextInput::make('radius')
                            ->label('Radius Absensi (meter)')
                            ->numeric()
                            ->required()
                            ->default(100)
                            ->minValue(10)
                            ->maxValue(1000)
                            ->suffix('meter')
                            ->helperText('Ubah radius dan peta akan update otomatis.')
                            ->live(onBlur: true)
                            ->afterStateUpdated(fn () => \Filament\Notifications\Notification::make()
                                ->title('Peta diupdate')
                                ->success()
                                ->duration(1000)
                                ->send()
                            ), // Update saat fokus hilang
                        
                        // ===== INI ADALAH PERBAIKAN UTAMA =====
                        // Render Blade view DI DALAM form, bukan di footer
                        Forms\Components\View::make('filament.actions.set-lokasi-action')
                            ->columnSpanFull(), // Buat agar lebarnya penuh
                    ])
                    
                    // HAPUS ->modalContentFooter() DARI SINI
                    
                    // Ini adalah aksi saat tombol "Simpan" modal diklik
                    ->action(function (Dudi $record, array $data): void {
                        try {
                            // Validasi data
                            if (empty($data['latitude']) || empty($data['longitude'])) {
                                Notification::make()
                                    ->title('Lokasi belum diambil')
                                    ->body('Silakan klik tombol "Ambil Lokasi Saat Ini" terlebih dahulu')
                                    ->warning()
                                    ->send();
                                return;
                            }
                            
                            $record->update([
                                'latitude' => $data['latitude'] ?? null,
                                'longitude' => $data['longitude'] ?? null,
                                'radius' => $data['radius'] ?? 100,
                            ]);
                            
                            Notification::make()
                                ->title('Lokasi DUDI berhasil diperbarui.')
                                ->success()
                                ->send();
                        } catch (\Exception $e) {
                            Notification::make()
                                ->title('Gagal menyimpan lokasi')
                                ->body($e->getMessage())
                                ->danger()
                                ->send();
                        }
                    })
                    ->modalCancelAction(false) // Sembunyikan tombol Batal
                    ->modalSubmitActionLabel('Simpan & Tutup'), // Ubah label tombol Simpan

                // --- Aksi bawaan (HANYA UNTUK ADMIN) ---
                Tables\Actions\EditAction::make()
                    ->visible(fn() => $user->isAdminSekolah()),
                Tables\Actions\DeleteAction::make()
                    ->visible(fn() => $user->isAdminSekolah()),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->visible(fn() => $user->isAdminSekolah()),
                ]),
            ]);
    }

    // --- GANTI TOTAL FUNGSI getPages() ---
    public static function getPages(): array
    {
        $user = Auth::user();
        
        // Dudi Pembimbing hanya bisa lihat 'index'
        if ($user && $user->isDudiPembimbing()) {
            return [
                'index' => Pages\ListDudis::route('/'),
            ];
        }

        // Admin Sekolah bisa lihat semua
        return [
            'index' => Pages\ListDudis::route('/'),
            'create' => Pages\CreateDudi::route('/create'),
            'edit' => Pages\EditDudi::route('/{record}/edit'),
        ];
    }
}