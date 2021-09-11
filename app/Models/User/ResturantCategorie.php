<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResturantCategorie extends Model
{
    use HasFactory;

    protected $table = 'resturant_categories';

    protected $fillable = [
        'resturant_id',
        'categorie_id',
        'created_at',
        'updated_at'
    ];
}
