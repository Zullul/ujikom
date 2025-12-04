<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\Attributes\On;

class TimezoneHandler extends Component
{
    #[On('setTimezone')]
    public function setTimezone(string $timezone)
    {
        // Simpan timezone yang dikirim dari browser ke session
        session(['user_timezone' => $timezone]);
    }

    public function render()
    {
        // Komponen ini tidak perlu menampilkan HTML apa pun
        return <<<'HTML'
        <div>
            {{-- Timezone handler running in the background --}}
        </div>
        HTML;
    }
}
