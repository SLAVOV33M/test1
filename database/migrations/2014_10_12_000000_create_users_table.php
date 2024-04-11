<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;

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
            $table->increments('id');
            $table->string('citext')->unique()->nullable();
            $table->string('email')->unique();
            $table->string('name')->unique();
            $table->string('regname')->unique();
            $table->bigInteger('xatid')->unique();
            $table->string('password');
            $table->integer('language_id')->unsigned()->index();
            $table->ipAddress('ip');
            $table->rememberToken();
            $table->timestamps();
            $table->foreign('language_id')->references('id')->on('languages');
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
