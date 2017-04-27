<?php
namespace app\admin\search;

use luffyzhao\helper\Search;

class User extends Search
{
    protected $rules = [
        'index' => [
            'name' => ['whereLike', 'user.name'],
        ],
    ];
}
