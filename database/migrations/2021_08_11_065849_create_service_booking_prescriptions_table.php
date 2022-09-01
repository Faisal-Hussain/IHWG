<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServiceBookingPrescriptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('service_booking_prescriptions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('service_booking_id')->constrained('service_bookings')->onDelete('cascade');
            $table->text('prescription');
            $table->string('attachement')->nullable();
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
        Schema::dropIfExists('service_booking_prescriptions');
    }
}
