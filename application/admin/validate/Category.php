<?php
namespace app\admin\validate;

use luffyzhao\helper\Validate;

class Category extends Validate
{

    protected $rule = [
        'parent_id' => ['require', 'existPid:category,id'],
        'name|分类名称' => ['require', 'chsAlpha', 'length:2,5'],
        'en_name|英文名称' => ['require', 'alpha', 'length:2,200'],
        'sort|英文名称' => ['require', 'number', 'max:999'],
    ];

    protected $scene = [
        'add' => ['name', 'en_name', 'sort', 'parent_id'],
        'edit' => ['name', 'en_name', 'sort'],
    ];

    protected $requireField = [
        'add' => ['parent_id', 'name', 'en_name', 'sort', 'title', 'keywords', 'description'],
        'edit' => ['name', 'en_name', 'sort', 'title', 'keywords', 'description'],
    ];
}
