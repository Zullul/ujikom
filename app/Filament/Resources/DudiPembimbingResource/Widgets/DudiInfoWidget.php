<?php

namespace App\Filament\Resources\DudiPembimbingResource\Widgets;

use App\Models\Dudi;
use Filament\Widgets\Widget;

class DudiInfoWidget extends Widget
{
    protected static string $view = 'filament.resources.dudi-pembimbing-resource.widgets.dudi-info-widget';
    
    public ?Dudi $dudi = null;
    
    public function mount(?int $dudiId = null): void
    {
        if ($dudiId) {
            $this->dudi = Dudi::find($dudiId);
        }
    }
}
