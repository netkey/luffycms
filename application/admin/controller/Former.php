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
                $data = $this->request->post('data/a');
                $data['spec'] = $this->item($data['spec']);
                $this->save($former, [], 'add', $data);
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
                $data = $this->request->post('data/a');
                $data['spec'] = $this->item($data['spec']);
                $this->save($former, [], 'edit', $data);
            } catch (Exception $e) {
                $this->error($e->getMessage());
            }
            $this->success('修改商品模型[id:' . $id . ']', 'former/index');
        }
        $this->assign('former', $former);
        return $this->fetch();
    }

    /**
     * spec数组重组
     * @method   item
     * @DateTime 2017-04-28T16:57:17+0800
     * @param    [type]                   $specs [description]
     * @return   [type]                          [description]
     */
    protected function item($specs)
    {
        $array = [];
        foreach ($specs['name'] as $key => $value) {
            $array[$key] = [
                'name' => $specs['name'][$key],
                'spec' => $specs['spec'][$key],
            ];
        }
        return $array;
    }

    /**
     * iframe选择商品模型
     * @method   iframe
     * @DateTime 2017-04-28T11:36:11+0800
     * @return   [type]                   [description]
     */
    public function iframe($id)
    {
        $params = $this->request->get('params');

        if (!empty($params)) {
            $this->assign('params', json_decode($params, true));
        }
        $this->assign('former', FormerModel::get($id));
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
