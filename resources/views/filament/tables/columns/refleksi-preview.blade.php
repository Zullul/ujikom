<div class="max-w-md">
    @if($getState())
        <div class="prose prose-sm dark:prose-invert max-w-none">
            <div class="line-clamp-3 text-sm">
                {!! nl2br(e(\Illuminate\Support\Str::limit($getState(), 150))) !!}
            </div>
        </div>
    @else
        <span class="text-gray-400 italic text-sm">Belum mengisi refleksi</span>
    @endif
</div>
