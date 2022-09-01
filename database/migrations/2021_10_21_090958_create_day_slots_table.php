<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDaySlotsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('day_slots', function (Blueprint $table) {
            $table->id();
            $table->foreignId('timetable_id')->on('timetables')->constrained()->onDelete('cascade');
            $table->foreignId('user_id')->on('users')->constrained()->onDelete('cascade');
            $table->string('specific_day')->nullable();
            $table->string('from')->nullable();
            $table->string('to')->nullable();
            $table->boolean('is_closed')->default(0);
            $table->enum('slot_type', ['0', '1', '2'])->default('0')->comment('0 All Day, 1 Specific Day, 2 Closed Day');
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
        Schema::dropIfExists('day_slots');
    }
}
