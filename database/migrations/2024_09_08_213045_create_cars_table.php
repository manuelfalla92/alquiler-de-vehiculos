<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCarsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('cars', function (Blueprint $table) {
            $table->id();
            $table->string('brand'); // Marca del coche
            $table->string('model'); // Modelo del coche
            $table->integer('year'); // Año del coche
            $table->decimal('price_per_day', 8, 2); // Precio por día
            $table->string('image_url')->nullable(); // URL de la imagen
            $table->text('description')->nullable(); // Descripción
            $table->timestamps(); // Incluye created_at y updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('cars');
    }
}
