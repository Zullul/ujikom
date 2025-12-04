@extends('layouts.app') {{-- Sesuaikan dengan layout utama Anda --}}

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Langkah 1: Pilih Minggu untuk Refleksi</div>

                <div class="card-body">
                    @if(empty($weeks))
                    <p class="text-center">Belum ada data minggu yang bisa direfleksi.</p>
                    @else
                    <div class="list-group">
                        @foreach ($weeks as $week)
                        <a href="{{ route('refleksi.selectStudent', ['week_number' => $week['number'], 'start_date' => $week['start_date'], 'end_date' => $week['end_date']]) }}"
                            class="list-group-item list-group-item-action">
                            {{ $week['label'] }}
                        </a>
                        @endforeach
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection