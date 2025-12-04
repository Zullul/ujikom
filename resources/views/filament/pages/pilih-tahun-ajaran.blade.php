<x-filament-panels::page>
    <style>
        /* Sembunyikan sidebar navigasi */
        aside.filament-sidebar,
        .fi-sidebar,
        nav.fi-sidebar-nav {
            display: none !important;
        }
        
        /* Full width untuk main content */
        .fi-main {
            margin-left: 0 !important;
        }
        
        /* Center content */
        .fi-page-content {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: calc(100vh - 4rem);
        }
        
        /* Geser container ke kanan untuk balance */
        .tahun-ajaran-container {
            margin-right: 5rem;
        }
        
        /* Jarak antara form dan button */
        .button-container {
            margin-top: 3rem !important;
            padding-top: 2rem !important;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
    </style>

    <div class="tahun-ajaran-container w-full max-w-3xl mx-auto px-4">
        <div class="text-center mb-8">
            <div class="mx-auto flex items-center justify-center h-20 w-20 rounded-full bg-primary-100 dark:bg-primary-900 mb-6">
                <svg class="h-12 w-12 text-primary-600 dark:text-primary-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                </svg>
            </div>
            <h2 class="text-3xl font-bold text-gray-900 dark:text-white mb-3">
                Pilih Tahun Ajaran
            </h2>
            <p class="text-base text-gray-600 dark:text-gray-400">
                Silakan pilih tahun ajaran yang akan Anda gunakan
            </p>
        </div>

        <x-filament::card class="p-8">
            <form wire:submit="save">
                {{ $this->form }}

                <div class="button-container flex items-center justify-between gap-4">
                    <x-filament::button
                        type="button"
                        color="gray"
                        tag="a"
                        href="{{ route('filament.admin.auth.logout') }}"
                        onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
                        </svg>
                        Keluar
                    </x-filament::button>
                    
                    <x-filament::button type="submit" size="lg">
                        Lanjutkan
                        <svg class="w-5 h-5 ml-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"/>
                        </svg>
                    </x-filament::button>
                </div>
            </form>
            
            <form id="logout-form" action="{{ route('filament.admin.auth.logout') }}" method="POST" style="display: none; ">
                @csrf
            </form>
        </x-filament::card>
    </div>
</x-filament-panels::page>