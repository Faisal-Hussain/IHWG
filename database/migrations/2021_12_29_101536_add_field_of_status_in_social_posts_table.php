<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddFieldOfStatusInSocialPostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("ALTER TABLE `social_posts` ADD `status` VARCHAR(250) NOT NULL DEFAULT 'Public' AFTER `user_social_group_id`;");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('social_posts', function (Blueprint $table) {
            //
        });
    }
}
