<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TahunAjaranResource\Pages;
use App\Filament\Resources\TahunAjaranResource\RelationManagers;
use App\Models\tahun_ajaran;
use App\Imports\TahunAjaranImport;
use Filament\Resources\Resource;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Auth;

class TahunAjaranResource extends Resource
{
    
    protected static ?string $model = tahun_ajaran::class;

    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';
    protected static ?string $navigationLabel = 'Data Tahun Ajaran';
    protected static ?string $pluralModelLabel = 'Data Tahun Ajaran';
    protected static ?string $modelLabel = 'Data Tahun Ajaran';

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();

        if ($user->isAdmin()) {
            return true;
        }
        return false;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('tahun_ajaran')
                    ->required(),
                Forms\Components\Select::make('sekolah_id')
                    ->label('Sekolah')
                    ->relationship('sekolah', 'nama_sekolah')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('tahun_ajaran')
                    ->searchable(),
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->searchable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->headerActions([
                Tables\Actions\Action::make('import')
                    ->label('Import Excel')
                    ->icon('heroicon-o-document-arrow-up')
                    ->form([
                        Forms\Components\FileUpload::make('file')
                            ->label('File Excel')
                            ->acceptedFileTypes([
                                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                                'application/vnd.ms-excel'
                            ])
                            ->required()
                            ->columnSpanFull(),
                    ])
                    ->action(function (array $data) {
                        try {
                            $file = storage_path('app/public/' . $data['file']);

                            if (!file_exists($file)) {
                                throw new \Exception('File tidak ditemukan.');
                            }

                            $import = new TahunAjaranImport();
                            Excel::import($import, $file);

                            // Hapus file setelah import
                            unlink($file);

                            if ($import->failures()->count() > 0) {
                                $errors = [];
                                foreach ($import->failures() as $failure) {
                                    $errors[] = "Baris {$failure->row()}: " . implode(', ', $failure->errors());
                                }

                                Notification::make()
                                    ->title('Import Berhasil dengan Peringatan')
                                    ->body('Beberapa data gagal diimport: ' . implode('; ', $errors))
                                    ->warning()
                                    ->send();
                            } else {
                                Notification::make()
                                    ->title('Import Berhasil')
                                    ->body('Data tahun ajaran berhasil diimport.')
                                    ->success()
                                    ->send();
                            }
                        } catch (\Exception $e) {
                            Notification::make()
                                ->title('Import Gagal')
                                ->body('Error: ' . $e->getMessage())
                                ->danger()
                                ->send();
                        }
                    })
                    ->modalWidth('md'),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTahunAjarans::route('/'),
            'create' => Pages\CreateTahunAjaran::route('/create'),
            'edit' => Pages\EditTahunAjaran::route('/{record}/edit'),
        ];
    }
}
