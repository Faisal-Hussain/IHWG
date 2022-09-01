<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateForumsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('forums', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('forum_category_id')->constrained('forum_categories')->onDelete('cascade');
            $table->string('title');
            $table->string('slug');
            $table->string('uuid');
            $table->longText('description');
            $table->bigInteger('views')->default(0);
            $table->enum('status', ['active', 'popular', 'discard', 'spam', 'pending', 'favorite'])->default('active');
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
        Schema::dropIfExists('forums');
    }
}
