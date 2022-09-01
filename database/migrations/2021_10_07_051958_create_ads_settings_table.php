<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAdsSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ads_settings', function (Blueprint $table) {
            $table->id();
            $table->string('url')->nullable();
            $table->string('heading')->nullable();
            $table->string('image')->nullable();
            $table->boolean('status')->default(1)->comment('1:active,0:pause');
            $table->string('homeopath')->nullable();
            $table->string('advocate')->nullable();
            $table->string('user')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ads_settings');
    }
}
