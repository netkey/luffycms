<?php
namespace app\admin\validate;

use think\Validate;

class Rule extends Validate
{
    use \app\admin\library\traits\Validate;

    protected $rule = [
        'parent_id|上级菜单' => ['require', 'existPid:rule'],
        'title|菜单标题' => ['require', 'chs', 'length:2,10'],
        'name|url地址' => ['require', 'regex' => '/^[a-zA-Z]{1,20}(\/[a-zA-Z]{1,21})?$/i', 'length:3,21'],
        'icon|菜单图标' => ['max:50'],
        'sort|菜单排序' => ['require', 'number'],
        'islink|是否菜单' => ['accepted'],
        'isadmin|是否管理员' => ['accepted'],
        'isverify|需要验证' => ['accepted'],
    ];

    protected $scene = [
        'add' => ['parent_id', 'title', 'name', 'icon', 'sort', 'islink', 'isadmin', 'isverify'],
        'edit' => ['parent_id', 'title', 'name', 'icon', 'sort', 'islink', 'isadmin', 'isverify'],
    ];
}
