<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomeopathServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('homeopath_services', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('service_theme_id')->constrained('service_themes')->onDelete('cascade');
            $table->text('title'); 
            $table->text('duration'); 
            $table->text('thumbnail');
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
        Schema::dropIfExists('homeopath_services');
    }
}
