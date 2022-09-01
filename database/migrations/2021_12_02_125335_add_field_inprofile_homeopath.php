<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldInprofileHomeopath extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::table('homeopath_profiles', function (Blueprint $table) {
        //     $table->string('service_time_interval')->default(15);
        // });
        DB::statement("ALTER TABLE `homeopath_profiles` ADD `service_time_interval` VARCHAR(255) NOT NULL DEFAULT '15' AFTER `service_document_inner`;");
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
