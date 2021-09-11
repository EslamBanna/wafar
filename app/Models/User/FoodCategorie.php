<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoodCategorie extends Model
{
    use HasFactory;

    protected $table = 'food_categories';

    protected $fillable = [
        'name',
        'photo',
        'created_at',
        'updated_at'
    ];

    protected $hidden = ['pivot', 'created_at','updated_at'];


    public function foods(){
        return $this->hasMany('App\Models\User\Food','categorie_id','id');
    }

    public function getPhotoAttribute($value){
        if($value == null){
            return '';
        }else{
            return DOMAIN.'images/categories/'.$value;
        }
    }
}
