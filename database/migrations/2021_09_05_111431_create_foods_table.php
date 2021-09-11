<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFoodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('foods', function (Blueprint $table) {
            $table->id();
            $table->string('name',255);
            $table->text('photo')->nullable();
            $table->text('icon')->nullable();
            $table->text('ingredients')->nullable();
            $table->integer('calorie')->nullable();
            $table->integer('cookTime')->nullable();
            // $table->integer('resturant_categorie');
            $table->double('rate')->default(0);
            $table->integer('resturant_id');
            $table->integer('categorie_id');
            $table->integer('price');
            $table->text('description')->nullable();
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
        Schema::dropIfExists('foods');
    }
}
