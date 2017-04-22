<?php
/**
 * 商品分类
 */
namespace app\admin\controller;

use app\admin\library\Controller;
use app\admin\model\Category as CategoryModel;
use think\Exception;
use think\exception\PDOException;

class Category extends Controller
{
    /**
     * 商品分类
     * @method   index
     * @DateTime 2017-03-31T13:36:08+0800
     * @return   [type]                   [description]
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $list = CategoryModel::scope('list')->all();
            $this->result(treeSort($list), 1);
        }
        return $this->fetch();
    }
    /**
     * 添加商品分类
     * @method   add
     * @DateTime 2017-03-31T16:39:49+0800
     * @param    string                   $value [description]
     */
    public function add()
    {
        if ($this->request->isAjax()) {
            try {
                $category = new CategoryModel();
                $this->save($category);
                if ($category['parent_id'] != 0) {
                    $parent = $category->parent;
                } else {
                    $parent = [
                        'level' => 0,
                        'path' => '',
                    ];
                }
                // 重新计算level和分类路径
                $category->level = $parent['level'] + 1;
                $category->path = $parent['path'] . $category['id'] . ',';
                $category->save();
            } catch (Exception $e) {
                $this->error($e->getMessage());
            } catch (PDOException $e) {
                $this->error('添加商品分类失败!');
            }
            $this->success('添加商品分类[id:' . $category->id . ']', 'category/index');
        }
        $list = CategoryModel::scope('option')->all();
        $this->assign('list', treeSort($list));
        return $this->fetch();
    }
    /**
     * 修改商品分类
     * @method   edit
     * @DateTime 2017-04-01T16:14:17+0800
     * @param    [type]                   $id [description]
     * @return   [type]                       [description]
     */
    public function edit($id)
    {
        $category = CategoryModel::get($id);
        if (empty($category)) {
            $this->error('商品分类不存在！');
        }
        if ($this->request->isAjax()) {
            try {
                $this->save($category, [], 'edit');
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }
            $this->success('修改商品分类[id:' . $id . ']', 'category/index');
        }
        $this->assign('category', $category);
        return $this->fetch();
    }
    /**
     * 删除商品分类
     * @method   destroy
     * @DateTime 2017-04-22T11:29:19+0800
     * @param    [type]                   $id [description]
     * @return   [type]                       [description]
     */
    public function destroy($id)
    {
        $category = CategoryModel::get($id);
        if (empty($category)) {
            $this->error('商品分类不存在！');
        }
        try {
            $this->delete($category);
        } catch (Exception $e) {
            $this->error($e->getMessage());
        }
        $this->success('删除商品分类[id:' . $id . ']', 'category/index');
    }

}
