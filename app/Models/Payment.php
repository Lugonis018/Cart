<?php

namespace Cart\Models;

use Illuminate\Database\Eloquent\Model;

Class Payment extends Model
{
    protected $fillable = [
        'failed',
        'transaction_id',
    ];
}