<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomeopathHolidaysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('homeopath_holidays', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->on('users')->constrained()->onDelete('cascade');
            $table->date('holiday_from')->nullable();
            $table->date('holiday_to')->nullable();
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
        Schema::dropIfExists('homeopath_holidays');
    }
}
