<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SiswaResource\Pages;
use App\Models\Siswa;
use App\Models\PrakerinSiswa;
use App\Models\Guru;
use App\Imports\SiswaImportCSV;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Auth;

class SiswaResource extends Resource
{
    protected static ?string $model = Siswa::class;
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?string $navigationLabel = 'Data Siswa';
    protected static ?string $pluralModelLabel = 'Data Siswa';
    protected static ?string $modelLabel = 'Siswa';

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        return $user && ($user->isAdmin() || $user->isGuru() || $user->isDudi());
    }

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery();
        $user = Auth::user();

        if ($user->isAdmin()) {
            // Admin bisa lihat semua siswa
            if (!$user->isAdminPusat()) {
                $query->where('sekolah_id', $user->sekolah_id);
            }
            return $query;
        }

        if ($user->isGuru()) {
            // Guru hanya bisa lihat siswa yang dibimbingnya
            return $query->whereHas('prakerinSiswa', function ($q) use ($user) {
                $q->where('guru_id', $user->ref_id);
            });
        }

        if ($user->isDudi()) {
            // Dudi hanya bisa lihat siswa yang prakerin di tempat mereka
            return $query->whereHas('prakerinSiswa', function ($q) use ($user) {
                $q->where('dudi_id', $user->ref_id);
            });
        }

        return $query->whereRaw('1 = 0');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Data Siswa')
                    ->schema([
                        Forms\Components\TextInput::make('nama_siswa')
                            ->label('Nama Siswa')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\TextInput::make('nis')
                            ->label('NIS')
                            ->required()
                            ->unique(ignoreRecord: true)
                            ->maxLength(45),

                        Forms\Components\TextInput::make('tempat_lahir')
                            ->label('Tempat Lahir')
                            ->required()
                            ->maxLength(255),

                        Forms\Components\DatePicker::make('tanggal_lahir')
                            ->label('Tanggal Lahir')
                            ->required()
                            ->native(false),

                        Forms\Components\Select::make('sekolah_id')
                            ->label('Sekolah')
                            ->relationship('sekolah', 'nama_sekolah')
                            ->required()
                            ->disabled(!Auth::user()->isAdminPusat())
                            ->default(Auth::user()->sekolah_id),
                    ])
                    ->columns(2),

                Forms\Components\Section::make('Guru Pembimbing')
                    ->schema([
                        Forms\Components\Repeater::make('guru_pembimbing')
                            ->label('Daftar Guru Pembimbing')
                            ->relationship('prakerinSiswa')
                            ->schema([
                                Forms\Components\Select::make('guru_id')
                                    ->label('Guru Pembimbing')
                                    ->relationship('guru', 'nama_guru')
                                    ->required()
                                    ->searchable()
                                    ->preload(),

                                Forms\Components\Select::make('prakerin_id')
                                    ->label('Program Prakerin')
                                    ->relationship('prakerin', 'nama_prakerin')
                                    ->searchable()
                                    ->preload(),

                                Forms\Components\Select::make('dudi_id')
                                    ->label('DUDI')
                                    ->relationship('dudi', 'nama_dudi')
                                    ->searchable()
                                    ->preload(),

                                Forms\Components\Select::make('dudi_pembimbing_id')
                                    ->label('Pembimbing DUDI')
                                    ->relationship('dudiPembimbing', 'nama_pembimbing')
                                    ->searchable()
                                    ->preload(),
                            ])
                            ->columns(2)
                            ->collapsible()
                            ->cloneable()
                            ->deleteAction(
                                fn(Forms\Components\Actions\Action $action) => $action->requiresConfirmation()
                            ),
                    ])
                    ->visible(Auth::user()->isAdmin()),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_siswa')
                    ->label('Nama Siswa')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('nis')
                    ->label('NIS')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('tempat_lahir')
                    ->label('Tempat Lahir')
                    ->searchable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->date('d/m/Y')
                    ->sortable()
                    ->toggleable(),

                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->searchable()
                    ->visible(Auth::user()?->isAdminPusat()),

                Tables\Columns\TextColumn::make('guru_pembimbing_names')
                    ->label('Guru Pembimbing')
                    ->getStateUsing(function (Siswa $record) {
                        return $record->prakerinSiswa()
                            ->with('guru')
                            ->get()
                            ->pluck('guru.nama_guru')
                            ->unique()
                            ->implode(', ') ?: '-';
                    })
                    ->wrap()
                    ->visible(fn() => Auth::user()->isDudi() || Auth::user()->isAdmin()),

                Tables\Columns\TextColumn::make('dudi_names')
                    ->label('Tempat Prakerin')
                    ->getStateUsing(function (Siswa $record) {
                        return $record->prakerinSiswa()
                            ->with('dudi')
                            ->get()
                            ->pluck('dudi.nama_dudi')
                            ->unique()
                            ->implode(', ') ?: '-';
                    })
                    ->wrap()
                    ->visible(fn() => Auth::user()->isGuru() || Auth::user()->isAdmin()),

                Tables\Columns\TextColumn::make('created_at')
                    ->label('Dibuat')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('sekolah_id')
                    ->label('Sekolah')
                    ->relationship('sekolah', 'nama_sekolah')
                    ->visible(Auth::user()?->isAdminPusat()),

                Tables\Filters\Filter::make('has_guru')
                    ->label('Punya Guru Pembimbing')
                    ->query(fn(Builder $query): Builder => $query->whereHas('prakerinSiswa')),

                Tables\Filters\Filter::make('no_guru')
                    ->label('Belum Ada Guru Pembimbing')
                    ->query(fn(Builder $query): Builder => $query->whereDoesntHave('prakerinSiswa')),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),

                Tables\Actions\EditAction::make()
                    ->visible(fn() => Auth::user()->isAdmin()),

                Tables\Actions\Action::make('assign_guru')
                    ->label('Tetapkan Guru')
                    ->icon('heroicon-o-user-plus')
                    ->color('success')
                    ->visible(fn() => Auth::user()->isAdmin())
                    ->form([
                        Forms\Components\Select::make('guru_id')
                            ->label('Pilih Guru Pembimbing')
                            ->options(function () {
                                $sekolahId = Auth::user()->sekolah_id;
                                return Guru::when($sekolahId, fn($q) => $q->where('sekolah_id', $sekolahId))
                                    ->pluck('nama_guru', 'id');
                            })
                            ->required()
                            ->searchable(),

                        Forms\Components\Select::make('prakerin_id')
                            ->label('Program Prakerin')
                            ->relationship('prakerin', 'nama_prakerin')
                            ->searchable(),

                        Forms\Components\Select::make('dudi_id')
                            ->label('DUDI')
                            ->options(function () {
                                $sekolahId = Auth::user()->sekolah_id;
                                return \App\Models\Dudi::when($sekolahId, fn($q) => $q->where('sekolah_id', $sekolahId))
                                    ->pluck('nama_dudi', 'id');
                            })
                            ->searchable(),
                    ])
                    ->action(function (Siswa $record, array $data) {
                        // Cek apakah sudah ada pembimbing untuk prakerin yang sama
                        $existing = PrakerinSiswa::where('siswa_id', $record->id)
                            ->where('prakerin_id', $data['prakerin_id'] ?? null)
                            ->first();

                        if ($existing) {
                            $existing->update($data);
                        } else {
                            PrakerinSiswa::create([
                                'siswa_id' => $record->id,
                                'guru_id' => $data['guru_id'],
                                'prakerin_id' => $data['prakerin_id'] ?? null,
                                'dudi_id' => $data['dudi_id'] ?? null,
                                'nama_siswa' => $record->nama_siswa,
                                'nis' => $record->nis,
                                'tempat_lahir' => $record->tempat_lahir,
                                'tanggal_lahir' => $record->tanggal_lahir,
                                'alamat' => $record->alamat ?? '',
                                'kontak' => $record->kontak ?? '',
                                'dudi_pembimbing_id' => 1, // Default sementara
                            ]);
                        }

                        Notification::make()
                            ->title('Guru pembimbing berhasil ditetapkan')
                            ->success()
                            ->send();
                    }),

                Tables\Actions\DeleteAction::make()
                    ->visible(fn() => Auth::user()->isAdmin())
                    ->requiresConfirmation(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->visible(fn() => Auth::user()->isAdmin())
                        ->requiresConfirmation(),

                    Tables\Actions\BulkAction::make('bulk_assign_guru')
                        ->label('Tetapkan Guru untuk Semua')
                        ->icon('heroicon-o-user-plus')
                        ->color('success')
                        ->visible(fn() => Auth::user()->isAdmin())
                        ->form([
                            Forms\Components\Select::make('guru_id')
                                ->label('Pilih Guru Pembimbing')
                                ->options(function () {
                                    $sekolahId = Auth::user()->sekolah_id;
                                    return Guru::when($sekolahId, fn($q) => $q->where('sekolah_id', $sekolahId))
                                        ->pluck('nama_guru', 'id');
                                })
                                ->required()
                                ->searchable(),
                        ])
                        ->action(function (array $data, $records) {
                            $count = 0;
                            foreach ($records as $siswa) {
                                $existing = PrakerinSiswa::where('siswa_id', $siswa->id)->first();

                                if (!$existing) {
                                    PrakerinSiswa::create([
                                        'siswa_id' => $siswa->id,
                                        'guru_id' => $data['guru_id'],
                                        'nama_siswa' => $siswa->nama_siswa,
                                        'nis' => $siswa->nis,
                                        'tempat_lahir' => $siswa->tempat_lahir,
                                        'tanggal_lahir' => $siswa->tanggal_lahir,
                                        'alamat' => '',
                                        'kontak' => '',
                                        'dudi_pembimbing_id' => 1, // Default
                                    ]);
                                    $count++;
                                }
                            }

                            Notification::make()
                                ->title("Berhasil menetapkan guru untuk {$count} siswa")
                                ->success()
                                ->send();
                        }),
                ]),
            ])
            ->headerActions([
                Tables\Actions\Action::make('import')
                    ->label('Import CSV')
                    ->icon('heroicon-o-arrow-up-tray')
                    ->visible(fn() => Auth::user()->isAdmin())
                    ->form([
                        Forms\Components\FileUpload::make('file')
                            ->label('File CSV')
                            ->acceptedFileTypes(['text/csv', 'application/csv'])
                            ->required(),
                        Forms\Components\Select::make('sekolah_id')
                            ->label('Sekolah')
                            ->options(\App\Models\Sekolah::pluck('nama_sekolah', 'id'))
                            ->required()
                            ->default(Auth::user()->sekolah_id)
                            ->helperText('Pilih sekolah untuk semua siswa yang akan diimport'),
                    ])
                    ->action(function (array $data) {
                        try {
                            $filePath = storage_path('app/public/' . $data['file']);
                            Excel::import(new SiswaImportCSV($data['sekolah_id']), $filePath);

                            Notification::make()
                                ->title('Import Berhasil!')
                                ->success()
                                ->send();
                        } catch (\Exception $e) {
                            Notification::make()
                                ->title('Import Gagal!')
                                ->body('Error: ' . $e->getMessage())
                                ->danger()
                                ->send();
                        }
                    }),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSiswas::route('/'),
            'create' => Pages\CreateSiswa::route('/create'),
            'view' => Pages\ViewSiswa::route('/{record}'),
            'edit' => Pages\EditSiswa::route('/{record}/edit'),
        ];
    }
}
