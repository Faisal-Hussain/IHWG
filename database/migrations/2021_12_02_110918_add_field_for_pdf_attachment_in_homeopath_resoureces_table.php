<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldForPdfAttachmentInHomeopathResourecesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement('ALTER TABLE `homeopath_resources` ADD `attachment` TEXT NULL DEFAULT NULL AFTER `image`;');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('homeopath_resopurces', function (Blueprint $table) {
            //
        });
    }
}
