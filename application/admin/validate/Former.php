<?php
namespace app\admin\validate;

use luffyzhao\helper\Validate;

class Former extends Validate
{

    protected $rule = [
        'name|模型名称' => ['require', 'chs', 'length:2,5'],
        'spec|规格规格' => ['require', 'array'],
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
