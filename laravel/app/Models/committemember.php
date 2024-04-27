<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class committemember extends Model
{
    use HasFactory;
    protected $table ='committemember';

    protected $fillable = [
        'committeRefno',
        'committeName',
        'memberId',
        'memberName',
        'memberRole',
        'roleId',
        'roleName',
        'title',
        'gender',
       ];



        //belong to
    public function committee()
    {
        return $this->belongsTo(committee::class, 'committeRefno', 'committeRefno');
    }
}
