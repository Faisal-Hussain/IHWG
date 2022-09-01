<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterHomeopathProfilesForAddServiceDocument extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('homeopath_profiles', function (Blueprint $table) {
            DB::statement('ALTER TABLE `homeopath_profiles` ADD `service_document` VARCHAR(255) NOT NULL DEFAULT "uploads/documents/form.pdf" AFTER `focuses`;');
        });
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
