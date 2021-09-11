<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->string("id",40)->primary();
            $table->string('name',255);
            // $table->string('email',50)->unique();
            $table->string('email',50);
            $table->string('phone',20);
            $table->text('photo')->nullable();
            $table->text('address')->nullable();
            $table->text('latitude')->nullable();
            $table->text('longitude')->nullable();
            $table->string('preferdLang',10)->default('en');
            $table->boolean('isVerified')->default(0);
            // $table->timestamps();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
