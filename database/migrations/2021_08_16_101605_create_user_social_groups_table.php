<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserSocialGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_social_groups', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');            
            $table->text('title'); 
            $table->text('slug'); 
            $table->text('description'); 
            $table->string('avatar')->default('uploads/groups/default-group.png');
            $table->string('cover')->default('uploads/groups/default-cover.png');
            $table->enum('type', ['public', 'private', 'protected', 'other'])->default('public');
            $table->enum('status', ['active', 'inactive', 'pending', 'closed', 'paused', 'N/A'])->default('active');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_social_groups');
    }
}
