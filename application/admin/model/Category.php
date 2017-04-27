<?php
namespace app\admin\model;

use think\Db;
use think\Model;

class Category extends Model
{
    protected $updateTime = 'modify_time';

    /**
     * 分类opteion
     * @method   scopeCategory
     * @DateTime 2017-04-22T14:38:21+0800
     * @param    [type]                   $query [description]
     * @return   [type]                          [description]
     */
    protected function scopeOption($query)
    {
        $query->field('id,parent_id,name,en_name,level');
    }

    /**
     * 分类列表
     * @method   scopeCategory
     * @DateTime 2017-04-22T14:38:21+0800
     * @param    [type]                   $query [description]
     * @return   [type]                          [description]
     */
    protected function scopeList($query)
    {
        $query->field('id,parent_id,name,en_name,level,sort');
    }

    /**
     * 上级分类
     * @method   parent
     * @DateTime 2017-04-01T17:48:29+0800
     * @return   [type]                   [description]
     */
    public function parent()
    {
        return $this->belongsTo('category', 'parent_id', 'id')->field('id,path,level,name');
    }
    /**
     * 子分类
     * @method   childrens
     * @DateTime 2017-04-22T14:39:58+0800
     * @return   [type]                   [description]
     */
    public function childrens()
    {
        return $this->hasMany('category', 'parent_id', 'id');
    }
    /**
     * 分类下的商品
     * 只能用在当前分类商品的查询,子分类下的商品不能用这个
     * @method   goods
     * @DateTime 2017-04-22T14:41:56+0800
     * @return   [type]                   [description]
     */
    public function goods()
    {
        return $this->hasMany('goods', 'category_id', 'id');
    }
    /**
     * 获取上级分类名称
     * @method   getParentNameAttr
     * @DateTime 2017-04-22T14:05:22+0800
     * @param    string                   $value [description]
     * @return   [type]                          [description]
     */
    protected function getParentNameAttr($value, $data)
    {
        $path = str_ireplace(",{$data['id']},", '', $data['path']);

        $ids = explode(',', $path);
        if (empty($ids)) {
            return ['顶级分类'];
        }
        return Db::name('category')->where('id', 'in', $ids)
            ->order('level ASC')->column('name');
    }
}
