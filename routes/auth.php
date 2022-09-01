<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\RegisteredUserController;
use App\Http\Controllers\Auth\VerifyEmailController;
use Illuminate\Support\Facades\Route;

Route::get('/register/users', [RegisteredUserController::class, 'create'])
                ->middleware('guest')
                ->name('register');

Route::get('/end/user/register', function(){
    return view('auth.register_end_user');
})->middleware('guest')->name('end.user.register');

Route::get('/homeopath/register', function(){
    return view('auth.register_homeopath');
})->middleware('guest')->name('register.homeopath');




Route::post('/register/users', [RegisteredUserController::class, 'store'])
                ->middleware('guest')->name('register');

Route::get('/login', [AuthenticatedSessionController::class, 'create'])
                ->middleware('guest')
                ->name('login');

Route::post('/login', [AuthenticatedSessionController::class, 'store'])
                ->middleware('guest');

Route::get('/forgot-password', [PasswordResetLinkController::class, 'create'])
                ->middleware('guest')
                ->name('password.request');

Route::post('/forgot-password', [PasswordResetLinkController::class, 'store'])
                ->middleware('guest')
                ->name('password.email');

Route::get('/reset-password/{token}', [NewPasswordController::class, 'create'])
                
                ->name('password.reset');

Route::post('/reset-password', [NewPasswordController::class, 'store'])
                
                ->name('password.update');

Route::get('/verify-email', [EmailVerificationPromptController::class, '__invoke'])
                ->middleware('auth')
                ->name('verification.notice');

Route::get('/verify-email/{id}/{hash}', [VerifyEmailController::class, '__invoke'])
                ->middleware(['auth', 'signed', 'throttle:6,1'])
                ->name('verification.verify');

Route::post('/email/verification-notification', [EmailVerificationNotificationController::class, 'store'])
                ->middleware(['auth', 'throttle:6,1'])
                ->name('verification.send');

Route::get('/confirm-password', [ConfirmablePasswordController::class, 'show'])
                ->middleware('auth')
                ->name('password.confirm');

Route::post('/confirm-password', [ConfirmablePasswordController::class, 'store'])
                ->middleware('auth');

// Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
//                 ->middleware('auth')
//                 ->name('logout');


Route::get('/logout', function(){
        Auth::logout();
        Session::forget('modalAdvocateSlideshow');

        return redirect()->route('index');
})->middleware('auth')->name('logout');




Route::post('/user-register', [RegisteredUserController::class, 'userRegister'])
                ->middleware('guest')
                ->name('user.register');