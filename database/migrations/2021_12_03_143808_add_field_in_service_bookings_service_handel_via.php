<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldInServiceBookingsServiceHandelVia extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::table('service_bookings', function (Blueprint $table) {
        //     $table->string('meeting_handel_via')->nullable();
        // });

        DB::statement('ALTER TABLE `service_bookings` ADD `meeting_handel_via` VARCHAR(255) NULL AFTER `updated_at`;');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('service_bookings', function (Blueprint $table) {
            //
        });
    }
}
