<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateShopProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('shop_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('shop_category_id')->constrained('shop_categories')->onDelete('cascade');
            $table->foreignId('shop_brand_id')->constrained('shop_brands')->onDelete('cascade');
            $table->foreignId('shop_color_id')->nullable()->constrained('shop_colors')->onDelete('cascade');
            $table->foreignId('shop_variant_id')->nullable()->constrained('shop_variants')->onDelete('cascade');
            $table->string('title');
            $table->string('slug');
            $table->string('uuid');
            $table->text('description');
            $table->float('amount', 8, 2)->nullable()->default(0);
            $table->string('thumbnail')->default('uploads/products/default.png');
            $table->text('tags');
            $table->enum('type', ['Popular', 'New Arrival', 'Best Seller', 'Favorite','Discounted', 'Promoted', 'Top Rated', 'Other'])->default('Other');
            $table->enum('status', ['active', 'inactive', 'pending', 'In Stock', 'Out of Stock', 'N/A'])->default('active');
            $table->bigInteger('stock_quantity')->default(0);
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
        Schema::dropIfExists('shop_products');
    }
}
