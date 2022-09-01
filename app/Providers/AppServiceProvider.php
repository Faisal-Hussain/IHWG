<?php

namespace App\Providers;

use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\ServiceProvider;
use Route;
use App\Models\Setting;
use Illuminate\Support\Facades\Blade;
use Illuminate\Pagination\Paginator;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {

        Paginator::useBootstrap();

        Blade::if('routeis', function ($expression) {
            return fnmatch($expression, Route::currentRouteName());
        });


        view()->composer('*', function($view){
            $view->with('setting', Setting::pluck('value', 'key')->toArray());
        });

    }
}
