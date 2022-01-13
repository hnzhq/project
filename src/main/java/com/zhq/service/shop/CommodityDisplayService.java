package com.zhq.service.shop;

import java.util.List;

import com.zhq.model.backstage.Commodity;
import com.zhq.model.shop.Address;
import com.zhq.model.shop.ShopCart;

public interface CommodityDisplayService {
	/**
	 * 展示商品
	 */
	public List<Commodity> findCom(Commodity commodity);

	public Commodity findById(Integer id);

	// 保存购物车
	public boolean savecart(ShopCart shopcart);

	// 读取购物车信息
	public List<ShopCart> readcart(ShopCart shopcart);

	// 删除购物车商品
	public int deleteById(Integer id);

	// 保存一个地址
	public boolean saveaddress(Address address);

	// 读取地址信息
	public List<Address> readaddress(Address address);
}
