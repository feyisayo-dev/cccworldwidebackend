<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class committeepayment extends Model
{
    use HasFactory;
    protected $table ='committeepayment';

    protected $fillable = [
        'committeRefno',
        'committename',
        'UserId',
        'paidfor',
        'paidby',
        'parishcode',
        'parishname',
        'amount',
        'receipt',
        'paymentdate',
        'roleName',
       ];
}
