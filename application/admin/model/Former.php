<?php
namespace app\admin\model;

use think\Model;

class Former extends Model
{
    protected $updateTime = 'modify_time';

    protected $type = [
        'spec' => 'array',
    ];
}
