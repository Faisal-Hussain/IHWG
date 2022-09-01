<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AlterSocialPostsForAddGroupId extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('social_posts', function (Blueprint $table) {
            $table->foreignId('user_social_group_id')->nullable()->constrained('user_social_groups')->onDelete('cascade');  
        });
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
