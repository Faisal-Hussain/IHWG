<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDonationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('donations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->float('price', 8, 2)->nullable()->default(0);
            $table->string('transaction_id')->nullable();
            $table->enum('payment_type', ['one_time', 'monthly', 'other', 'N/A'])->default('one_time');
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
        Schema::dropIfExists('donations');
    }
}
