<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    use HasFactory;

    protected $table = 'discounts';

    protected $fillable = [
        'id',
        'related_object',
        'type',
        'value',
        'service_id',
        'created_at',
        'updated_at'
    ];

    protected $hidden = ['related_food'];

    public function food(){
        return $this->belongsTo('App\Models\User\Food','related_object','id');
    }

    public function services(){
        return $this->belongsTo('App\Models\User\Service','service_id','id');
    }

    public function getTypeAttribute($value){

        return ($value == 0 ? 'value' : 'percent');

    }
}
