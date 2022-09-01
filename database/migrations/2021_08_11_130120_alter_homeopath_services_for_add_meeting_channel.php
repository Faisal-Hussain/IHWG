<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterHomeopathServicesForAddMeetingChannel extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE `homeopath_services` ADD `meeting_handled_via` VARCHAR(255) NULL AFTER `status`, ADD `meeting_channel` VARCHAR(255) NULL AFTER `meeting_handled_via`, ADD `meeting_channel_id` VARCHAR(255) NULL AFTER `meeting_channel`;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('homeopath_services', function (Blueprint $table) {
            //
        });
    }
}
