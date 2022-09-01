<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldInHomeopathServices extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE `homeopath_profiles` ADD `service_profile_img` VARCHAR(250) NULL DEFAULT NULL AFTER `user_id`;");
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
