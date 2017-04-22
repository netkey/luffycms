<?php
namespace app\admin\validate;

use app\admin\library\Validate;

class Former extends Validate
{

    protected $rule = [
        'name|模型名称' => ['require', 'chs', 'length:2,5'],
        'spec|模型规格' => ['require', 'chsAlphaNumComma', 'length:2,200'],
    ];

    protected $scene = [
        'add' => ['name', 'spec'],
        'edit' => ['name', 'spec'],
    ];

    protected $requireField = [
        'add' => ['name', 'spec'],
        'edit' => ['name', 'spec'],
    ];
}
