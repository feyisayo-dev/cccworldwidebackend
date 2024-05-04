<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class committememberpayment extends Model
{
    protected $table ='committememberpayment';

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
