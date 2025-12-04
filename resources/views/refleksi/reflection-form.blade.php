@extends('layouts.app')

@section('content')
<div class="container">
    <h4>Input Refleksi untuk: {{ $student->name }}</h4>
    <p class="text-muted">Minggu ke-{{ $week_number }} ({{ \Carbon\Carbon::parse($start_date)->format('d M') }} - {{ \Carbon\Carbon::parse($end_date)->format('d M Y') }})</p>

    <div class="row">

        {{-- KOLOM KIRI: DATA PENDUKUNG --}}
        <div class="col-md-5">
            <div class="card mb-3">
                <div class="card-header">Absensi Minggu Ini</div>
                <ul class="list-group list-group-flush">
                    @forelse ($attendances as $attendance)
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        {{ \Carbon\Carbon::parse($attendance->date)->isoFormat('dddd, D MMMM Y') }}
                        <span class="badge bg-success">{{ $attendance->status }}</span> {{-- Ganti bg-success sesuai status --}}
                    </li>
                    @empty
                    <li class="list-group-item">Tidak ada data absensi.</li>
                    @endforelse
                </ul>
            </div>

            <div class="card">
                <div class="card-header">Jurnal Harian</div>
                <div class="card-body">
                    <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#jurnalModal">
                        Lihat Jurnal Harian Siswa
                    </button>
                </div>
            </div>
        </div>

        {{-- KOLOM KANAN: FORM INPUT --}}
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">Formulir Refleksi Mingguan</div>
                <div class="card-body">
                    <form action="{{ route('refleksi.store') }}" method="POST">
                        @csrf
                        {{-- Data tersembunyi yang akan dikirim bersama form --}}
                        <input type="hidden" name="student_id" value="{{ $student->id }}">
                        <input type="hidden" name="week_number" value="{{ $week_number }}">
                        <input type="hidden" name="start_date" value="{{ $start_date }}">
                        <input type="hidden" name="end_date" value="{{ $end_date }}">

                        <div class="mb-3">
                            <label for="reflection_text" class="form-label">Catatan & Evaluasi Pembimbing</label>
                            <textarea class="form-control @error('reflection_text') is-invalid @enderror"
                                id="reflection_text"
                                name="reflection_text"
                                rows="8"
                                required>{{ old('reflection_text', $reflection->reflection_text ?? '') }}</textarea>
                            @error('reflection_text')
                            <div class="invalid-feedback">{{ $message }}</div>
                            @enderror
                        </div>

                        {{-- Opsional: Input Nilai --}}
                        <div class="row">
                            <div class="col">
                                <label for="discipline_score" class="form-label">Nilai Kedisiplinan</label>
                                <input type="number" name="discipline_score" id="discipline_score" class="form-control" min="0" max="100" value="{{ old('discipline_score', $reflection->discipline_score ?? '') }}">
                            </div>
                            <div class="col">
                                <label for="performance_score" class="form-label">Nilai Kinerja</label>
                                <input type="number" name="performance_score" id="performance_score" class="form-control" min="0" max="100" value="{{ old('performance_score', $reflection->performance_score ?? '') }}">
                            </div>
                        </div>

                        <hr>
                        <button type="submit" class="btn btn-success">Simpan Refleksi</button>
                        <a href="{{ route('refleksi.selectStudent', [$week_number, $start_date, $end_date]) }}" class="btn btn-secondary">Batal</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="jurnalModal" tabindex="-1" aria-labelledby="jurnalModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="jurnalModalLabel">Jurnal Harian - {{ $student->name }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                @forelse ($dailyJournals as $journal)
                <div class="mb-3 border-bottom pb-2">
                    <strong>{{ \Carbon\Carbon::parse($journal->date)->isoFormat('dddd, D MMMM Y') }}</strong>
                    <p class="mt-2 mb-0">{!! nl2br(e($journal->activities)) !!}</p> {{-- Menampilkan kegiatan dengan line break --}}
                </div>
                @empty
                <p>Siswa belum mengisi jurnal harian pada minggu ini.</p>
                @endforelse
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>
@endsection