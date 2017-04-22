<?php
/**
 * 商品模型
 */
namespace app\admin\controller;

use app\admin\library\Controller;
use app\admin\model\Former as FormerModel;
use think\Exception;

class Former extends Controller
{
    /**
     * 商品模型
     * @method   index
     * @DateTime 2017-03-31T13:36:08+0800
     * @return   [type]                   [description]
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $former = new FormerModel();
            $list = $this->search($former)->paginate();
            $this->result($list->toArray(), 1);
        }
        return $this->fetch();
    }
    /**
     * 添加商品模型
     * @method   add
     * @DateTime 2017-03-31T16:39:49+0800
     * @param    string                   $value [description]
     */
    public function add()
    {
        if ($this->request->isAjax()) {
            try {
                $former = new FormerModel();
                $this->save($former);
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }
            $this->success('添加商品模型[id:' . $former->id . ']', 'former/index');
        }
        return $this->fetch();
    }
    /**
     * 修改商品模型
     * @method   edit
     * @DateTime 2017-04-01T16:14:17+0800
     * @param    [type]                   $id [description]
     * @return   [type]                       [description]
     */
    public function edit($id)
    {
        $former = FormerModel::get($id);
        if (empty($former)) {
            $this->error('商品模型不存在！');
        }
        if ($this->request->isAjax()) {
            try {
                $this->save($former, [], 'edit');
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }
            $this->success('修改商品模型[id:' . $id . ']', 'former/index');
        }
        $this->assign('former', $former);
        return $this->fetch();
    }
    /**
     * 删除商品模型
     * @method   destroy
     * @DateTime 2017-04-22T11:29:19+0800
     * @param    [type]                   $id [description]
     * @return   [type]                       [description]
     */
    public function destroy($id)
    {
        $former = FormerModel::get($id);
        if (empty($former)) {
            $this->error('商品模型不存在！');
        }
        try {
            $this->delete($former);
        } catch (Exception $e) {
            $this->error($e->getMessage());
        }
        $this->success('删除商品模型[id:' . $id . ']', 'former/index');
    }

}
