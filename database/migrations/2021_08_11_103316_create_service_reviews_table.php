<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServiceReviewsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('service_reviews', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('homeopath_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('homeopath_service_id')->constrained('homeopath_services')->nullable()->onDelete('cascade');
            $table->text('feedback')->nullable();
            $table->enum('rate', [1, 2, 3, 4, 5])->default(5);
            $table->enum('status', ['pending', 'approved', 'cancelled', 'spam'])->default('approved');
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
        Schema::dropIfExists('service_reviews');
    }
}
