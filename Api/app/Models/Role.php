<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = [
        'name', 'slug'
    ];

    protected $hidden = [
        'slug'
    ];

    public function user(){
        return $this->hasMany('App\Models\User');
    }
}
