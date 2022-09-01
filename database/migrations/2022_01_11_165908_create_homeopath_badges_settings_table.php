<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomeopathBadgesSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('homeopath_badges_settings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('homeopath_id')->constrained('homeopath_profiles')->onDelete('cascade');
            $table->string('badge_id')->nullable();
            $table->string('badge_name')->nullable();
            $table->string('status')->default(true);
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
        Schema::dropIfExists('homeopath_badges_settings');
    }
}
