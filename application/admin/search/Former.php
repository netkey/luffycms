<?php
namespace app\admin\search;

use luffyzhao\helper\Search;

class Former extends Search
{
    protected $rules = [
        'index' => [
            'name' => ['whereLike', 'name'],
        ],
    ];
}
