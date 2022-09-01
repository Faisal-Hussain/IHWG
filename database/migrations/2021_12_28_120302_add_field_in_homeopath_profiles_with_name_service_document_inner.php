<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldInHomeopathProfilesWithNameServiceDocumentInner extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE `homeopath_profiles` ADD `service_document_inner` VARCHAR(250) NULL DEFAULT NULL AFTER `service_document`;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('homeopath_profiles', function (Blueprint $table) {
            //
        });
    }
}
