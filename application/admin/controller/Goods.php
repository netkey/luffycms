<?php
/**
 * 商品模型
 */
namespace app\admin\controller;

use app\admin\library\Controller;
use app\admin\model\Category as CategoryModel;
use app\admin\model\Goods as GoodsModel;

class Goods extends Controller
{
    /**
     * 商品
     * @method   index
     * @DateTime 2017-03-31T13:36:08+0800
     * @return   [type]                   [description]
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $goods = new GoodsModel();
            $list = $this->search($goods)->paginate();
            $this->result($list->toArray(), 1);
        }
        return $this->fetch();
    }
    /**
     * 添加商品
     * @method   add
     * @DateTime 2017-03-31T16:39:49+0800
     * @param    string                   $value [description]
     */
    public function add()
    {
        $categoryList = CategoryModel::scope('option')->all();
        $this->assign('categoryList', treeSort($categoryList));
        return $this->fetch();
    }
    /**
     * 修改商品
     * @method   edit
     * @DateTime 2017-04-01T16:14:17+0800
     * @param    [type]                   $id [description]
     * @return   [type]                       [description]
     */
    public function edit($id)
    {

    }
    /**
     * 删除商品
     * @method   destroy
     * @DateTime 2017-04-22T11:29:19+0800
     * @param    [type]                   $id [description]
     * @return   [type]                       [description]
     */
    public function destroy($id)
    {

    }

}
