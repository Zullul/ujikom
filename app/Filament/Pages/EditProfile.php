<?php

namespace App\Filament\Pages;

use App\Models\User; // <-- 1. Pastikan model User di-import
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class EditProfile extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-user-circle';
    protected static string $view = 'filament.pages.edit-profile';
    protected static ?string $title = 'Edit Profil';
    protected ?string $heading = 'Profil Akun';

    protected static bool $shouldRegisterNavigation = false;

    public ?array $data = [];
    public string $name = '';
    public string $email = '';
    public string $role_type = '';

    public function mount(): void
    {
        // 2. Ambil model User yang lengkap dari database
        $user = User::find(Auth::id());

        // Isi form dengan data yang bisa diedit
        $this->form->fill($user->only(['username']));

        // Isi properti untuk data yang hanya ditampilkan
        $this->name = $user->name;
        $this->email = $user->email;
        $this->role_type = Str::title(str_replace('_', ' ', $user->role_type));
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('username')
                    ->required()
                    ->maxLength(255)
                    ->label('Username')
                    ->live(onBlur: true)
                    ->unique(
                        table: 'users', 
                        column: 'username', 
                        ignorable: fn () => Auth::user()
                    ),

                TextInput::make('password')
                    ->password()
                    ->revealable()
                    ->label('Password Baru')
                    ->dehydrated(fn($state) => filled($state))
                    ->confirmed()
                    ->helperText('Kosongkan jika Anda tidak ingin mengubah password.'),

                TextInput::make('password_confirmation')
                    ->password()
                    ->revealable()
                    ->label('Konfirmasi Password Baru')
                    ->dehydrated(false),
            ])
            ->statePath('data');
    }

    public function save(): void
    {
        try {
            $data = $this->form->getState();
            // 3. Ambil kembali model User yang lengkap untuk proses update
            $user = User::find(Auth::id());

            $updateData = [
                'username' => $data['username'],
            ];

            if (!empty($data['password'])) {
                $updateData['password'] = Hash::make($data['password']);
            }

            // Sekarang method update() pasti akan ditemukan
            $user->update($updateData);

            Notification::make()
                ->title('Profil berhasil disimpan')
                ->body('Username dan password Anda telah diperbarui.')
                ->success()
                ->send();

            // Reset password field setelah berhasil
            $this->data['password'] = '';
            $this->data['password_confirmation'] = '';
            
        } catch (\Exception $e) {
            Notification::make()
                ->title('Gagal menyimpan profil')
                ->body($e->getMessage())
                ->danger()
                ->send();
        }
    }
}
