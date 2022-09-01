<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateArticlesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('articles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->string('title');
            $table->string('slug');
            $table->string('uuid');
            $table->string('category');
            $table->text('summary');
            $table->longText('body');
            $table->longText('keywords');
            $table->string('featured_image')->default('uploads/articles/default-article.png');
            $table->enum('status', ['published', 'unpublished', 'discard', 'spam', 'pending', 'favorite'])->default('published');
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
        Schema::dropIfExists('articles');
    }
}
