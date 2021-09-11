<?php

namespace App\Models\User;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;
    protected $table = 'services';

    protected $fillable = [
        'ar_name',
        'en_name',
        'photo',
        'created_at',
        'updated_at'
    ];

    public function getPhotoAttribute($value)
    {
        if ($value == null) {
            return '';
        } else {
            return DOMAIN . 'images/services/' . $value;
        }
    }
}
