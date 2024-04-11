<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Migrations\Migration;

class CreateBotsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bots', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('creator_user_id')->index();
            $table->unsignedInteger('bot_status_id')->nullable();
            $table->unsignedInteger('server_id')->nullable()->index();
            $table->unsignedInteger('language_id')->unsigned()->index();
            $table->bigInteger('premium')->default(1);
            $table->bigInteger('chatid')->unique();
            $table->string('chatname')->unique();
            $table->integer('chatpw')->nullable();
            $table->string('nickname')->default('Bot(glow#000080#c0ccd4)(hat#Eb)');
            $table->string('avatar')->default('123')->nullable();
            $table->string('homepage')->default('xatbot.fr')->nullable();
            $table->string('status')->default('xatbot.fr#000080#c0ccd4')->nullable();
            $table->string('pcback')->nullable();
            $table->string('autowelcome')->default('Hello!');
            $table->string('toggleautowelcome')->default('pm');
            $table->string('ticklemessage')->nullable();
            $table->string('customcommand')->default('!');
            $table->integer('maxkick')->default('3');
            $table->integer('maxkickban')->default('1');
            $table->integer('maxflood')->default('10');
            $table->integer('maxchar')->default('10');
            $table->integer('maxsmilies')->default('10');
            $table->string('automember')->default('off');
            $table->string('automessage')->nullable();
            $table->integer('automessagetime')->default('30');
            $table->boolean('autorestart')->default('1');
            $table->boolean('gameban_unban')->default('1');
            $table->jsonb('powersdisabled')->nullable();
            $table->boolean('togglemoderation')->default('1');
            $table->bigInteger('premiumfreeze')->default(1);
            $table->timestamps();
            $table->foreign('bot_status_id')->references('id')->on('bot_statuses')->onUpdate('cascade')->onDelete('set null');
            $table->foreign('creator_user_id')->references('id')->on('users');
            $table->foreign('server_id')->references('id')->on('servers');
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
        Schema::drop('bots');
    }
}
