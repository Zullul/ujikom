{{-- File ini akan menampilkan daftar siswa dalam format tabel di dalam modal --}}
<div class="p-4">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3">No</th>
                <th scope="col" class="px-6 py-3">Nama Siswa</th>
                <th scope="col" class="px-6 py-3">NIS</th>
                <th scope="col" class="px-6 py-3">Kelas</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($students as $student)
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                <td class="px-6 py-4">{{ $loop->iteration }}</td>
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                    {{ $student->siswa->nama_siswa }}
                </th>
                <td class="px-6 py-4">{{ $student->siswa->nis }}</td>
                <td class="px-6 py-4">{{ $student->siswa->kelas->nama_kelas }}</td>
            </tr>
            @empty
            <tr>
                <td colspan="4" class="text-center py-4">Tidak ada data siswa.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>