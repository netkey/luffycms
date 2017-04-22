<?php
namespace app\admin\search;

use app\admin\library\Search;

class Former extends Search
{
    protected $rules = [
        'index' => [
            'name' => ['whereLike', 'name'],
        ],
    ];
}
