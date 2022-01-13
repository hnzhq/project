package com.zhq.service.impl.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.shop.CommodityDisplayDao;
import com.zhq.model.backstage.Commodity;
import com.zhq.model.shop.Address;
import com.zhq.model.shop.ShopCart;
import com.zhq.service.shop.CommodityDisplayService;

@Service
public class CommodityDisolayServiceImpl implements CommodityDisplayService {
	@Autowired
	private CommodityDisplayDao dao;

	/**
	 * 查找商品信息
	 */
	@Override
	public List<Commodity> findCom(Commodity commodity) {
		return dao.findCom(commodity);
	}

	// 查找商品（id）
	@Override
	public Commodity findById(Integer id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return dao.findById(map);
	}

	// 保存购物车
	@Override
	public boolean savecart(ShopCart shopcart) {

		return dao.savecart(shopcart) > 0;
	}

	// 读取购物车数据库
	@Override
	public List<ShopCart> readcart(ShopCart shopcart) {
		return dao.readcart(shopcart);
	}

	// 删除购物车商品
	@Override
	public int deleteById(Integer id) {
		return dao.deleteById(id);
	}

	// 添加收货地址
	@Override
	public boolean saveaddress(Address address) {
		return dao.saveaddress(address) > 0;
	}

	// 读取地址
	@Override
	public List<Address> readaddress(Address address) {
		return dao.readaddress(address);
	}

}
