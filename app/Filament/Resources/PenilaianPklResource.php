<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PenilaianPklResource\Pages;
use App\Models\PenilaianPkl;
use App\Models\PrakerinSiswa;
use App\Models\TujuanPembelajaran;
use Filament\Forms;
use Filament\Infolists;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Filament\Forms\Set;

class PenilaianPklResource extends Resource
{
    // Model utama adalah PrakerinSiswa
    protected static ?string $model = PrakerinSiswa::class;

    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?string $navigationLabel = 'Penilaian PKL';
    protected static ?string $pluralModelLabel = 'Penilaian PKL';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?int $navigationSort = 4;

    public static function canCreate(): bool
    {
        return false; // Tidak bisa membuat dari sini
    }

    public static function canAccess(): bool
    {
        $user = Auth::user();
        // Bisa diakses oleh Admin, Guru, Dudi Pembimbing, dan Siswa
        return $user->isAdminSekolah() || $user->isGuru() || $user->isDudiPembimbing() || $user->isSiswa();
    }

    // Filter daftar PrakerinSiswa berdasarkan role
    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        // Eager load relasi yang dibutuhkan untuk menghindari N+1
        $prakerinSiswaQuery = PrakerinSiswa::query()->with([
            'siswa.kelas',
            'siswa.sekolah',
            'dudi',
            'penilaianPkl.details.tujuanPembelajaran'
        ]);
        $selectedTahunAjaranId = session('selected_tahun_ajaran_id');

        // Filter berdasarkan tahun ajaran
        if ($selectedTahunAjaranId) {
            $prakerinSiswaQuery->whereHas('prakerin', function (Builder $query) use ($selectedTahunAjaranId) {
                $query->where('tahun_ajaran_id', $selectedTahunAjaranId);
            });
        }

        // Filter berdasarkan role
        if ($user->isAdminSekolah()) {
            $prakerinSiswaQuery->whereHas('siswa', fn($q) => $q->where('sekolah_id', $user->sekolah_id));
        } elseif ($user->isSiswa()) {
            $prakerinSiswaQuery->where('siswa_id', $user->ref_id);
        } elseif ($user->isGuru() || $user->isDudiPembimbing()) {
            $prakerinSiswaQuery->where(
                $user->isGuru() ? 'guru_pembimbing_id' : 'dudi_pembimbing_id',
                $user->ref_id
            );
        }

        return $prakerinSiswaQuery;
    }


    // Definisi tabel (daftar siswa)
    public static function table(Table $table): Table
    {
        $user = Auth::user();
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('siswa.nama_siswa')->label('Siswa')->searchable()->sortable(),
                // Kolom skor dan grade hanya terlihat oleh selain siswa
                Tables\Columns\TextColumn::make('penilaianPkl.skor_guru')->label('Skor Guru')->numeric()->visible(fn() => !$user->isSiswa()),
                Tables\Columns\BadgeColumn::make('penilaianPkl.grade_guru')->label('Grade Guru')->colors(['success' => 'A', 'primary' => 'B', 'warning' => 'C', 'danger' => fn($state) => in_array($state, ['D', 'E']),])->visible(fn() => !$user->isSiswa()),
                Tables\Columns\TextColumn::make('penilaianPkl.skor_dudi')->label('Skor DUDI')->numeric()->visible(fn() => !$user->isSiswa()),
                Tables\Columns\BadgeColumn::make('penilaianPkl.grade_dudi')->label('Grade DUDI')->colors(['success' => 'A', 'primary' => 'B', 'warning' => 'C', 'danger' => fn($state) => in_array($state, ['D', 'E']),])->visible(fn() => !$user->isSiswa()),
                // Kolom nilai akhir hanya terlihat oleh siswa
                Tables\Columns\TextColumn::make('penilaianPkl.nilai_akhir')->label('Nilai Akhir')->numeric(decimalPlaces: 2)->visible(fn() => $user->isSiswa()),
                Tables\Columns\BadgeColumn::make('penilaianPkl.grade_akhir')->label('Grade Akhir')->colors(['success' => 'A', 'primary' => 'B', 'warning' => 'C', 'danger' => fn($state) => in_array($state, ['D', 'E']),])->visible(fn() => $user->isSiswa()),
            ])
            ->actions([
                // Aksi untuk memberi/edit penilaian (hanya Guru/Dudi Pembimbing)
                Tables\Actions\Action::make('beri_penilaian')
                    ->label('Beri/Edit Penilaian')
                    ->icon('heroicon-o-pencil-square')
                    ->fillForm(function (PrakerinSiswa $record) { // Mengambil data skor yang ada
                        $penilaianPkl = $record->penilaianPkl()->with('details')->first();
                        $scores = [];
                        if ($penilaianPkl) {
                            $details = $penilaianPkl->details;
                            foreach ($details as $detail) {
                                $skor = Auth::user()->isGuru() ? $detail->skor_guru : $detail->skor_dudi;
                                $scores[$detail->tujuan_pembelajaran_id] = $skor;
                            }
                        }
                        return ['scores' => $scores];
                    })
                    ->form(function () { // Mendefinisikan form penilaian
                        $tujuanPembelajarans = TujuanPembelajaran::where('sekolah_id', Auth::user()->sekolah_id)->get();

                        if ($tujuanPembelajarans->isEmpty()) {
                            return [ Forms\Components\Placeholder::make('no_criteria')->label('Tidak Ada Kriteria Penilaian')->content('Admin sekolah belum menambahkan data Tujuan Pembelajaran.'), ];
                        }

                        $schema = [];
                        foreach ($tujuanPembelajarans as $tujuan) {
                            // Membersihkan teks kriteria dari nomor dan tag HTML
                            $cleanedText = strip_tags($tujuan->deskripsi);
                            $decodedText = html_entity_decode($cleanedText, ENT_QUOTES | ENT_HTML5, 'UTF-8');
                            $finalText = preg_replace('/^[\P{L}]+/u', '', $decodedText);

                            // Input skor dengan label kriteria
                            $schema[] = Forms\Components\TextInput::make('scores.' . $tujuan->id)
                                ->label($finalText) // Label kriteria ditampilkan di atas input
                                ->integer()
                                ->required()
                                ->minValue(0)
                                ->maxValue(100)
                                ->live(onBlur: true)
                                ->afterStateUpdated(function (Set $set, $state) {
                                    if ($state === null || !is_numeric($state)) return;
                                    $value = (int) $state;
                                    if ($value > 100) $set('state', 100);
                                    elseif ($value < 0) $set('state', 0);
                                });
                        }
                        return $schema;
                    })
                    ->action(function (PrakerinSiswa $record, array $data) use ($user) { // Aksi saat tombol Simpan ditekan
                        self::simpanPenilaian($record, $data, $user);
                    })
                    ->visible(fn() => $user->isGuru() || $user->isDudiPembimbing()), // Hanya terlihat Guru/Dudi Pembimbing

                // Aksi untuk melihat detail penilaian
                Tables\Actions\ViewAction::make('view_penilaian')
                    // Arahkan ke record PenilaianPkl, BUKAN PrakerinSiswa
                    ->url(fn(PrakerinSiswa $record): ?string => $record->penilaianPkl ? static::getUrl('view', ['record' => $record->penilaianPkl->id]) : null)
                    ->label('Lihat Detail')->icon('heroicon-o-eye')
                    ->visible(fn(PrakerinSiswa $record) => $record->penilaianPkl != null), // Hanya terlihat jika sudah ada penilaian
            ]);
    }

    // Fungsi untuk menyimpan data penilaian
    public static function simpanPenilaian(PrakerinSiswa $record, array $data, $user)
    {
        DB::transaction(function () use ($record, $data, $user) {
            // Ambil atau buat record PenilaianPkl baru
            $penilaianPkl = $record->penilaianPkl()->firstOrCreate(['prakerin_siswa_id' => $record->id]);
            $totalSkor = 0;
            $skorField = $user->isGuru() ? 'skor_guru' : 'skor_dudi'; // Tentukan kolom skor berdasarkan role

            $allScores = $data['scores'] ?? [];
            if (empty($allScores)) return; // Keluar jika tidak ada skor

            // Simpan detail skor per kriteria
            foreach ($allScores as $tujuanId => $skor) {
                $skorValid = max(0, min(100, (int)$skor)); // Pastikan skor antara 0-100
                if (!is_numeric($skor)) continue; // Lewati jika bukan angka

                $penilaianPkl->details()->updateOrCreate(
                    ['penilaian_pkl_id' => $penilaianPkl->id, 'tujuan_pembelajaran_id' => $tujuanId], // Kunci pencarian
                    [$skorField => $skorValid] // Data yang diupdate/dibuat
                );
                $totalSkor += $skorValid;
            }

            // Hitung rata-rata dan tentukan grade
            $rataRata = count($allScores) > 0 ? $totalSkor / count($allScores) : 0;
            $grade = match (true) { $rataRata >= 90 => 'A', $rataRata >= 80 => 'B', $rataRata >= 70 => 'C', $rataRata >= 60 => 'D', default => 'E', };

            // Update skor rata-rata dan grade di tabel utama PenilaianPkl
            if ($user->isGuru()) {
                $penilaianPkl->skor_guru = $rataRata;
                $penilaianPkl->grade_guru = $grade;
                $penilaianPkl->dinilai_oleh_guru_id = $user->id; // Simpan ID penilai
                $penilaianPkl->tanggal_dinilai_guru = now(); // Simpan tanggal penilaian
            } else { // Dudi Pembimbing
                $penilaianPkl->skor_dudi = $rataRata;
                $penilaianPkl->grade_dudi = $grade;
                $penilaianPkl->dinilai_oleh_dudi_id = $user->id;
                $penilaianPkl->tanggal_dinilai_dudi = now();
            }
            $penilaianPkl->save(); // Simpan perubahan
        });
        Notification::make()->title('Berhasil')->body('Penilaian telah disimpan.')->success()->send(); // Tampilkan notifikasi
    }


    // Definisi tampilan detail (Infolist)
    public static function infolist(Infolist $infolist): Infolist
    {
        $user = Auth::user();
        // Pastikan record yang diambil adalah PenilaianPkl
        $penilaianRecord = \App\Models\PenilaianPkl::with(['prakerinSiswa.siswa', 'prakerinSiswa.dudi', 'details.tujuanPembelajaran'])
                            ->find($infolist->getRecord()->id);

        return $infolist
            ->record($penilaianRecord) // Set record yang benar
            ->schema([
                // Section Informasi Umum (Siswa & Tempat PKL)
                Infolists\Components\Section::make('Informasi Umum')
                    ->schema([
                        Infolists\Components\TextEntry::make('prakerinSiswa.siswa.nama_siswa')->label('Siswa'),
                        Infolists\Components\TextEntry::make('prakerinSiswa.dudi.nama_dudi')->label('Tempat Prakerin'),
                    ]),

                // Section Hasil Akhir (untuk Siswa & Admin Sekolah)
                Infolists\Components\Section::make('Hasil Akhir Penilaian')
                    ->visible(fn() => $user->isSiswa() || $user->isAdminSekolah()) // Tampil untuk Siswa ATAU Admin
                    ->schema([
                        Infolists\Components\TextEntry::make('nilai_akhir')->label('Nilai Rata-Rata Akhir')->numeric(decimalPlaces: 2),
                        Infolists\Components\TextEntry::make('grade_akhir')->label('Grade Akhir')->badge()->color(fn($state) => match ($state) { 'A' => 'success', 'B' => 'primary', 'C' => 'warning', 'D', 'E' => 'danger', default => 'gray' }),
                        // Tampilkan narasi kesimpulan (disesuaikan untuk Admin)
                        Infolists\Components\TextEntry::make('keterangan_siswa')
                            ->label('Ringkasan Penilaian')
                            ->html()
                            ->formatStateUsing(fn ($record) => $user->isAdminSekolah()
                                ? $record->getKeteranganSiswaAttribute($record->prakerinSiswa->siswa->nama_siswa) // Jika admin, kirim nama
                                : $record->keterangan_siswa // Jika siswa, panggil biasa
                            )
                            ->columnSpanFull(),
                    ])->columns(2),

                // Section Hasil Akhir (untuk Guru & Dudi Pembimbing)
                Infolists\Components\Section::make('Hasil Akhir Penilaian')
                    ->visible(fn() => !($user->isSiswa() || $user->isAdminSekolah())) // Tampil jika BUKAN Siswa DAN BUKAN Admin
                    ->schema([
                        Infolists\Components\TextEntry::make('nilai_akhir')->label('Nilai Rata-Rata Akhir')->numeric(decimalPlaces: 2),
                        Infolists\Components\TextEntry::make('grade_akhir')->label('Grade Akhir')->badge()->color(fn($state) => match ($state) { 'A' => 'success', 'B' => 'primary', 'C' => 'warning', 'D', 'E' => 'danger', default => 'gray' }),
                    ])->columns(2),

                // Section Rincian Penilaian Guru (untuk Guru, Dudi Pembimbing, & Admin)
                Infolists\Components\Section::make('Rincian Penilaian Guru Pembimbing')
                     // Tampil jika ada skor guru DAN (user adalah Admin ATAU BUKAN Siswa)
                    ->visible(fn($record) => !is_null($record->skor_guru) && ($user->isAdminSekolah() || !$user->isSiswa()) )
                    ->schema([
                        // Tampilkan Rata-rata, Grade, Tanggal
                        Infolists\Components\Grid::make(2)->schema([
                            Infolists\Components\TextEntry::make('skor_guru')->label("Nilai Rata-Rata"),
                            Infolists\Components\TextEntry::make('grade_guru')->label('Grade'),
                            Infolists\Components\TextEntry::make('tanggal_dinilai_guru')->dateTime()->label('Tanggal Dinilai'),
                        ]),
                        // Tampilkan detail skor per kriteria menggunakan RepeatableEntry
                        RepeatableEntry::make('details')
                            ->label('Detail Penilaian')
                            ->schema([
                                // Kolom Kriteria
                                TextEntry::make('tujuanPembelajaran.deskripsi')->label('Kriteria')->html()->formatStateUsing(function ($state) { $cleaned = strip_tags($state ?? ''); $decoded = html_entity_decode($cleaned, ENT_QUOTES | ENT_HTML5, 'UTF-8'); return preg_replace('/^[\P{L}]+/u', '', $decoded); })->columnSpan(2),
                                // Kolom Skor Guru
                                TextEntry::make('skor_guru')->label('Skor')->numeric()->columnSpan(1),
                            ])
                            ->columns(3)->grid(1)->hidden(fn ($record) => $record->details->whereNotNull('skor_guru')->isEmpty()) // Sembunyikan jika tidak ada skor guru
                    ])
                    ->collapsible(), // Bisa diciutkan

                // Section Rincian Penilaian DUDI (untuk Guru, Dudi Pembimbing, & Admin)
                Infolists\Components\Section::make('Rincian Penilaian Pembimbing DUDI')
                    // Tampil jika ada skor dudi DAN (user adalah Admin ATAU BUKAN Siswa)
                    ->visible(fn($record) => !is_null($record->skor_dudi) && ($user->isAdminSekolah() || !$user->isSiswa()) )
                    ->schema([
                        // Tampilkan Rata-rata, Grade, Tanggal
                         Infolists\Components\Grid::make(2)->schema([
                            Infolists\Components\TextEntry::make('skor_dudi')->label("Nilai Rata-Rata"),
                            Infolists\Components\TextEntry::make('grade_dudi')->label('Grade'),
                            Infolists\Components\TextEntry::make('tanggal_dinilai_dudi')->dateTime()->label('Tanggal Dinilai'),
                         ]),
                        // Tampilkan detail skor per kriteria menggunakan RepeatableEntry
                        RepeatableEntry::make('details')
                            ->label('Detail Penilaian')
                            ->schema([
                                // Kolom Kriteria
                                TextEntry::make('tujuanPembelajaran.deskripsi')->label('Kriteria')->html()->formatStateUsing(function ($state) { $cleaned = strip_tags($state ?? ''); $decoded = html_entity_decode($cleaned, ENT_QUOTES | ENT_HTML5, 'UTF-8'); return preg_replace('/^[\P{L}]+/u', '', $decoded); })->columnSpan(2),
                                // Kolom Skor DUDI
                                TextEntry::make('skor_dudi')->label('Skor')->numeric()->columnSpan(1),
                            ])
                            ->columns(3)->grid(1)->hidden(fn ($record) => $record->details->whereNotNull('skor_dudi')->isEmpty()) // Sembunyikan jika tidak ada skor dudi
                    ])
                    ->collapsible(), // Bisa diciutkan
            ]);
    }

    // Definisi halaman (routes)
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPenilaianPkls::route('/'), // Halaman daftar
            'view' => Pages\ViewPenilaianPkl::route('/{record}'), // Halaman detail (menggunakan ID PenilaianPkl)
            // Halaman edit dan create tidak diperlukan lagi di sini
        ];
    }
}