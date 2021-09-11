<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Resturant extends Model
{
    use HasFactory;

    protected $table = 'resturants';

    protected $fillable = [
        'name',
        'rate',
        'photo',
        'address',
        'latitude',
        'longitude',
        'phone',
        'created_at',
        'updated_at'
    ];
    protected $hidden = ['created_at', 'updated_at'];

    public function resturantCategorie()
    {
        return $this->belongsToMany('App\Models\User\FoodCategorie', 'App\Models\User\ResturantCategorie', 'resturant_id', 'categorie_id');
    }

    public function getPhotoAttribute($value)
    {
        if ($value == null) {
            return '';
        } else {
            return DOMAIN . 'images/resturants/' . $value;
        }
    }
}
