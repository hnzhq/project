package com.zhq.service.backstage;

import java.util.List;

import com.zhq.model.backstage.Commodity;

public interface CommodityService {
	public List<Commodity> findAll(Commodity commodity);

	// 添加商品
	public boolean save(Commodity commodity);

	// 删除商品
	public int deleteByIds(Integer[] ids);

	// 修改商品信息
	public Commodity findById(Integer id);

	public boolean update(Commodity commodity);
}
