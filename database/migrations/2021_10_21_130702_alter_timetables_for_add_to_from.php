<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterTimetablesForAddToFrom extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('timetables', function (Blueprint $table) {
            $table->time('from')->nullable()->after('is_closed');
            $table->time('to')->nullable()->after('from');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('timetables', function (Blueprint $table) {
            //
        });
    }
}
