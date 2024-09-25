<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;

    // Los campos que se pueden llenar masivamente
    protected $fillable = ['brand', 'model', 'year', 'price_per_day', 'image_url', 'description'];
}
