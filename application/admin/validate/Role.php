<?php
namespace app\admin\validate;

use app\admin\library\Validate;

class Role extends Validate
{

    protected $rule = [
        'name|用户组名称' => ['require', 'chs', 'length:2,10'],
        'remark|用户组说明' => ['max:255'],
        'rule|用户组权限' => ['array'],
    ];

    protected $scene = [
        'add' => ['name', 'remark', 'rule'],
        'edit' => ['name', 'remark', 'rule'],
    ];

    protected $requireField = [
        'add' => ['name', 'remark', 'rule'],
        'edit' => ['name', 'remark', 'rule'],
    ];
}
