<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBadgeRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('badge_requests', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');            
            $table->foreignId('badge_id')->constrained('badges')->onDelete('cascade');            
            $table->text('description')->nullable();
            $table->string('attachement')->nullable();
            $table->enum('status', ['active', 'pending', 'cancelled', 'closed', 'spammed', 'completed',  'not applicable'])->default('pending'); 
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
        Schema::dropIfExists('badge_requests');
    }
}
