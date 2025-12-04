<?php

namespace App\Filament\Resources\KelasResource\Pages;

use App\Filament\Resources\KelasResource;
use App\Models\Kelas;
use App\Models\tahun_ajaran;
use Filament\Actions;
use Filament\Forms\Components\Select;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Support\Facades\DB;

class ListKelas extends ListRecords
{
    protected static string $resource = KelasResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),

            Actions\Action::make('salinKelas')
                ->label('Salin Kelas dari Tahun Ajaran')
                ->icon('heroicon-o-document-duplicate')
                ->color('success')
                ->form([
                    Select::make('sumber_tahun_ajaran_id')
                        ->label('Salin Dari Tahun Ajaran')
                        ->options(tahun_ajaran::pluck('tahun_ajaran', 'id'))
                        ->required(),
                    Select::make('target_tahun_ajaran_id')
                        ->label('Ke Tahun Ajaran Tujuan')
                        ->options(tahun_ajaran::pluck('tahun_ajaran', 'id'))
                        ->required()
                        ->different('sumber_tahun_ajaran_id'),
                ])
                ->action(function (array $data) {
                    $sumberId = $data['sumber_tahun_ajaran_id'];
                    $targetId = $data['target_tahun_ajaran_id'];

                    try {
                        // Ambil kelas dari tahun sumber berdasarkan sekolah_id saja
                        $kelasUntukDisalin = Kelas::where('tahun_ajaran_id', $sumberId)
                            ->where('sekolah_id', auth()->user()->sekolah_id)
                            ->get();

                        if ($kelasUntukDisalin->isEmpty()) {
                            Notification::make()
                                ->title('Tidak Ada Data')
                                ->body('Tidak ada data kelas yang ditemukan pada tahun ajaran sumber.')
                                ->warning()
                                ->send();
                            return;
                        }

                        $disalin = 0;
                        DB::transaction(function () use ($kelasUntukDisalin, $targetId, &$disalin) {
                            foreach ($kelasUntukDisalin as $kelas) {
                                $kelasSudahAda = Kelas::where('tahun_ajaran_id', $targetId)
                                    ->where('nama_kelas', $kelas->nama_kelas)
                                    ->where('sekolah_id', $kelas->sekolah_id)
                                    ->exists();

                                if (!$kelasSudahAda) {
                                    Kelas::create([
                                        'nama_kelas' => $kelas->nama_kelas,
                                        'konsentrasi_keahlian' => $kelas->konsentrasi_keahlian,
                                        'sekolah_id' => $kelas->sekolah_id,
                                        'tahun_ajaran_id' => $targetId,
                                    ]);
                                    $disalin++;
                                }
                            }
                        });

                        if ($disalin > 0) {
                            Notification::make()
                                ->title('Berhasil')
                                ->body("{$disalin} data kelas berhasil disalin ke tahun ajaran tujuan.")
                                ->success()
                                ->send();
                        } else {
                            Notification::make()
                                ->title('Informasi')
                                ->body('Semua data kelas dari tahun sumber sudah ada di tahun target.')
                                ->info()
                                ->send();
                        }
                    } catch (\Exception $e) {
                        Notification::make()
                            ->title('Proses Gagal')
                            ->body('Terjadi kesalahan: ' . $e->getMessage())
                            ->danger()
                            ->send();
                    }
                }),
        ];
    }
}
