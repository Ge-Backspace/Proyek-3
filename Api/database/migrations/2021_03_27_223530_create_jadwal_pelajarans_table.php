<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJadwalPelajaransTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('jadwal_pelajarans', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('pelajaran_id')->unsigned();
            $table->integer('kelas_id')->unsigned();
            $table->integer('semester_id')->unsigned();
            $table->time('schedule');
            $table->date('date');
            $table->timestamps();

            $table->foreign('pelajaran_id')->references('id')->on('pelajarans');
            $table->foreign('kelas_id')->references('id')->on('kelas');
            $table->foreign('semester_id')->references('id')->on('semesters');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('jadwal_pelajarans');
    }
}
