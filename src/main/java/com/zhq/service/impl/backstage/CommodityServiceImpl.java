package com.zhq.service.impl.backstage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.backstage.CommodityDao;
import com.zhq.model.backstage.Commodity;
import com.zhq.service.backstage.CommodityService;

@Service
public class CommodityServiceImpl implements CommodityService {
	@Autowired
	private CommodityDao dao;

	@Override
	public List<Commodity> findAll(Commodity commodity) {

		return dao.findAll(commodity);
	}

	// 保存
	public boolean save(Commodity commodity) {
		return dao.save(commodity) > 0;
	}

	// 删除
	public int deleteByIds(Integer[] ids) {
		return dao.deleteByIds(ids);
	}

	// 修改商品信息
	public Commodity findById(Integer id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return dao.findById(map);
	}

	public boolean update(Commodity commodity) {
		return dao.update(commodity) > 0;
	}

}
