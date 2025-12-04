<?php

namespace App\Filament\Pages\Auth;

use Filament\Http\Responses\Auth\LoginResponse;
use Filament\Forms\Components\Component;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Pages\Auth\Login as BaseLogin;
use Illuminate\Validation\ValidationException;
use Illuminate\Http\Response;

class Login extends BaseLogin
{
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                $this->getUsernameFormComponent(),
                $this->getPasswordFormComponent(),
                $this->getRememberFormComponent(),
            ])
            ->statePath('data');
    }

    protected function getLoginResponse(): LoginResponse|Response
    {
        $user = auth()->user();

        // Jika user adalah guru atau dudi, arahkan ke halaman pilih tahun ajaran
        if ($user->isGuru() || $user->isDudiPembimbing()) {
            return redirect()->route('filament.admin.pages.pilih-tahun-ajaran');
        }

        // Jika bukan, lanjutkan ke dashboard seperti biasa
        return parent::getLoginResponse();
    }

    protected function getUsernameFormComponent(): Component
    {
        return TextInput::make('username')
            ->label('Username')
            ->required()
            ->autocomplete('username')
            ->autofocus()
            ->extraInputAttributes(['tabindex' => 1]);
    }

    protected function getCredentialsFromFormData(array $data): array
    {
        return [
            'username' => $data['username'],
            'password' => $data['password'],
        ];
    }

    protected function throwFailureValidationException(): never
    {
        throw ValidationException::withMessages([
            'data.username' => __('filament-panels::pages/auth/login.messages.failed'),
        ]);
    }
}
