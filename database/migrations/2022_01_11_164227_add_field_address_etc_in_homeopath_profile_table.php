<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldAddressEtcInHomeopathProfileTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE `homeopath_profiles` ADD `edu_designation` LONGTEXT NULL DEFAULT NULL AFTER `service_time_interval`, ADD `address` TEXT NULL DEFAULT NULL AFTER `edu_designation`;");
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
