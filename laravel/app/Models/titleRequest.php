<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class titleRequest extends Model
{

    use HasFactory;
    protected $table = 'title_requests';
    protected $fillable = [
        'UserId',
        'Applied_title',
        'Status',
        'date',
    ];
}
