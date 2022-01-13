package com.zhq.dao.backstage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zhq.model.backstage.Commodity;

@Mapper
public interface CommodityDao {
	/**
	 * 查询列表
	 * 
	 * @param commodity
	 * @return
	 */
	public List<Commodity> findAll(Commodity commodity);

	/**
	 * 添加
	 */
	public int save(Commodity commodity);

	/**
	 * 删除
	 */
	// @Param是地处Dao层，是为了传递多个参数，解决的是可读性和直观性；
	public int deleteByIds(@Param(value = "ids") Integer[] ids);

	/**
	 * 修改
	 */
	// 查询要修改的数据信息
	public Commodity findById(Map<String, Object> map);

	public int update(Commodity commodity);

}
