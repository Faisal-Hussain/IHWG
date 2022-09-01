<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServiceBookingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('service_bookings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('homeopath_service_id')->constrained('homeopath_services')->onDelete('cascade');
            $table->string('date');
            $table->string('time_slot');
            $table->string('illness')->nullable();
            $table->string('allergies')->nullable();
            $table->string('concern')->nullable();
            $table->float('price', 8, 2)->nullable()->default(0);
            $table->string('transaction_id')->nullable();
            $table->enum('payment_method', ['stripe', 'paypal', 'offline', 'pay-later', 'other'])->default('other');
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
        Schema::dropIfExists('service_bookings');
    }
}
