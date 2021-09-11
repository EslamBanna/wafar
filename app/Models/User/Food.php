<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Food extends Model
{
    use HasFactory;

    protected $table = 'foods';

    protected $fillable = [
        'resturant_id',
        'categorie_id',
        'name',
        'photo',
        'rate',
        'icon',
        'ingredients',
        'calorie',
        'cookTime',
        'price',
        'created_at',
        'updated_at'
    ];

    public function categorie()
    {
        return $this->belongsTo('App\Models\User\FoodCategorie', 'categorie_id', 'id');
    }

    public function resturant(){
        return $this->belongsTo('App\Models\User\Resturant','resturant_id','id');
    }

    public function getPhotoAttribute($value)
    {

        if ($value == null) {
            return '';
        } else {
            return DOMAIN . 'images/foods/' . $value;
        }
    }

    public function discount(){
        return $this->hasOne('App\Models\User\Discount','related_object','id');
    }

}
