<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFiledOfChildServiceDocumentInHomeopathServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE `homeopath_services` ADD `child_service_document` VARCHAR(250) NULL DEFAULT NULL AFTER `meeting_channel_id`;");
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
