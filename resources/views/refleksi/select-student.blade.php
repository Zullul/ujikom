@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">

            {{-- Menampilkan notifikasi sukses --}}
            @if (session('success'))
            <div class="alert alert-success" role="alert">
                {{ session('success') }}
            </div>
            @endif

            <div class="card">
                <div class="card-header">
                    Langkah 2: Pilih Siswa (Minggu ke-{{ $week_number }})
                </div>

                <div class="card-body">
                    @if($students->isEmpty())
                    <p class="text-center">Tidak ada data siswa yang dibimbing.</p>
                    @else
                    <div class="list-group">
                        @foreach ($students as $student)
                        <a href="{{ route('refleksi.showReflectionForm', ['week_number' => $week_number, 'start_date' => $start_date, 'end_date' => $end_date, 'student' => $student->id]) }}"
                            class="list-group-item list-group-item-action">
                            {{ $student->name }}
                        </a>
                        @endforeach
                    </div>
                    @endif
                </div>
                <div class="card-footer">
                    <a href="{{ route('refleksi.selectWeek') }}" class="btn btn-secondary btn-sm">&larr; Kembali ke Pilih Minggu</a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection