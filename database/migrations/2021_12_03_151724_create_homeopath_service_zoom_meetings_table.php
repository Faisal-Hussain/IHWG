<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomeopathServiceZoomMeetingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('homeopath_service_zoom_meetings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('service_id')->constrained('homeopath_services')->onDelete('cascade');
            $table->string('time_slot')->nullable();
            $table->text('joing_url')->nullable();
            $table->text('start_url')->nullable();
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
        Schema::dropIfExists('homeopath_service_zoom_meetings');
    }
}
