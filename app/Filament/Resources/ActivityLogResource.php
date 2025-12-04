<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ActivityLogResource\Pages;
use Spatie\Activitylog\Models\Activity; // <-- Gunakan model dari package
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Infolists\Components\Section;

class ActivityLogResource extends Resource
{
    protected static ?string $model = Activity::class; // <-- Gunakan model Activity

    protected static ?string $navigationIcon = 'heroicon-o-clipboard-document-list';
    protected static ?string $navigationLabel = 'Jejak Aktivitas';
    protected static ?string $pluralModelLabel = 'Jejak Aktivitas';
    protected static ?string $modelLabel = 'Log Aktivitas';
    protected static ?string $navigationGroup = 'Pengaturan'; // Atau grup lain yang sesuai
    protected static ?int $navigationSort = 10; // Urutan di navigasi

    // --- Hanya Admin Sekolah yang bisa akses ---
    public static function canAccess(): bool
    {
        return Auth::user()->isAdminSekolah();
    }
    public static function canCreate(): bool
    {
        return false; // Tidak bisa membuat log manual
    }

    // --- Filter log berdasarkan sekolah dan role admin sekolah ---
    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        return parent::getEloquentQuery()
            ->where('causer_type', \App\Models\User::class) // Pastikan penyebabnya adalah User
            ->whereHasMorph('causer', [\App\Models\User::class], function (Builder $query) use ($user) {
                // Filter berdasarkan sekolah_id user yang login
                $query->where('sekolah_id', $user->sekolah_id);
                // Filter hanya user dengan role admin_sekolah
                $query->where('role_type', 'admin_sekolah');
            })
            ->orderBy('created_at', 'desc'); // Urutkan dari terbaru
    }


    // Kita tidak membuat/edit log dari sini
    public static function form(Form $form): Form
    {
        return $form->schema([]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('causer.name')
                    ->label('Pelaku')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('description')
                    ->label('Deskripsi Aksi')
                    ->searchable()
                    ->wrap(), // Agar teks panjang bisa turun baris
                Tables\Columns\TextColumn::make('subject_type')
                    ->label('Objek Data')
                    ->formatStateUsing(fn (string $state): string => class_basename($state)) // Tampilkan nama model saja
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Waktu')
                    ->dateTime('d M Y H:i:s') // Format tanggal dan waktu
                    ->sortable(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('causer')
                    ->label('Pelaku')
                     // Ambil user admin sekolah dari sekolah yang sama
                    ->options(fn() => \App\Models\User::where('sekolah_id', Auth::user()->sekolah_id)
                                        ->where('role_type', 'admin_sekolah')
                                        ->pluck('name', 'id'))
                    ->query(function (Builder $query, array $data): Builder {
                        if (empty($data['value'])) {
                            return $query;
                        }
                        return $query->where('causer_id', $data['value'])
                                     ->where('causer_type', \App\Models\User::class);
                    }),
                Tables\Filters\SelectFilter::make('subject_type')
                    ->label('Objek Data')
                    // Ambil tipe objek yang unik dari log yang sudah difilter
                    ->options(fn() => Activity::query()
                                ->where('causer_type', \App\Models\User::class)
                                ->whereHasMorph('causer', [\App\Models\User::class], fn (Builder $q) => $q->where('sekolah_id', Auth::user()->sekolah_id)->where('role_type', 'admin_sekolah'))
                                ->select('subject_type')
                                ->distinct()
                                ->pluck('subject_type')
                                ->mapWithKeys(fn ($type) => $type ? [ $type => class_basename($type) ] : [] ) // Buat opsi nama model
                    ),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(), // Hanya bisa lihat detail
            ])
            ->bulkActions([]) // Tidak ada bulk action
            ->defaultSort('created_at', 'desc');
    }

    // Definisikan tampilan detail (Infolist)
    public static function infolist(Infolist $infolist): Infolist
    {
         return $infolist
            ->schema([
                Section::make('Detail Log')
                    ->schema([
                        TextEntry::make('causer.name')->label('Pelaku'),
                        TextEntry::make('description')->label('Deskripsi Aksi'),
                        TextEntry::make('subject_type')->label('Objek Data')->formatStateUsing(fn ($state): string => $state ? class_basename($state) : '-'),
                        TextEntry::make('subject_id')->label('ID Objek'),
                        TextEntry::make('created_at')->label('Waktu')->dateTime('d M Y H:i:s'),
                    ])->columns(2),
                // Section::make('Detail Perubahan')
                //     ->schema([
                //          // Menampilkan data lama (jika ada)
                //          TextEntry::make('properties.old')
                //             ->label('Data Lama')
                //             ->visible(fn ($state) => !empty($state))
                //             ->formatStateUsing(function ($state) {
                //                 if (empty($state)) return '-';
                //                 if (is_string($state)) $state = json_decode($state, true);
                //                 if (!is_array($state)) return '-';
                //                 $output = '<ul>';
                //                 foreach ($state as $key => $value) {
                //                     $output .= '<li><strong>' . htmlspecialchars($key) . ':</strong> ' . htmlspecialchars($value ?? '-') . '</li>';
                //                 }
                //                 $output .= '</ul>';
                //                 return $output;
                //             })->html(),
                //         TextEntry::make('properties.attributes')
                //             ->label('Data Baru')
                //              ->visible(fn ($state) => !empty($state))
                //             ->formatStateUsing(function ($state) {
                //                  if (empty($state)) return '-';
                //                 if (is_string($state)) $state = json_decode($state, true);
                //                 if (!is_array($state)) return '-';
                //                 $output = '<ul>';
                //                 foreach ($state as $key => $value) {
                //                     $output .= '<li><strong>' . htmlspecialchars($key) . ':</strong> ' . htmlspecialchars($value ?? '-') . '</li>';
                //                 }
                //                 $output .= '</ul>';
                //                 return $output;
                //             })->html(),
                //     ])->visible(fn ($record) => $record->event === 'updated'), // Hanya tampil jika aksi = updated
            ]);
    }

    // Kita tidak perlu halaman Create dan Edit
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListActivityLogs::route('/'),
            'view' => Pages\ViewActivityLog::route('/{record}'),
        ];
    }
}