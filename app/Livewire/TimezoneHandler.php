<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\Attributes\On;

class TimezoneHandler extends Component
{
    #[On('setTimezone')]
    public function setTimezone(string $timezone)
    {
        session(['user_timezone' => $timezone]);
    }

    public function render()
    {
        // Komponen ini tidak perlu menampilkan apa-apa
        return <<<'HTML'
        <div>
            {{-- This component handles timezone detection in the background. --}}
        </div>
        HTML;
    }
}
