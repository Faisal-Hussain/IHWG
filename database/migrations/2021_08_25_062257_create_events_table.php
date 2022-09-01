<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');  
            $table->string('title');
            $table->text('description');
            $table->string('thumbnail')->default('uploads/events/default-event.png');
            $table->string('category');
            $table->enum('type', ['virtual', 'in-person', 'other', 'N/A'])->default('virtual');
            $table->string('venue')->nullable();
            $table->string('location')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();
            $table->text('hosts')->nullable();
            $table->string('vendors')->nullable();
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
        Schema::dropIfExists('events');
    }
}
