package com.zhq.dao.shop;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.backstage.Commodity;
import com.zhq.model.shop.Address;
import com.zhq.model.shop.ShopCart;

@Mapper
public interface CommodityDisplayDao {
	// 商品展示

	// 查询商品信息
	public List<Commodity> findCom(Commodity commodity);

	// 找到一个商品信息
	public Commodity findById(Map<String, Object> map);

	// 将一个商品加入购物车
	public int savecart(ShopCart shopcart);

	// 读取购物车信息
	public List<ShopCart> readcart(ShopCart shopcart);

	// 删除一个商品
	public int deleteById(Integer id);

	// 保存一个地址
	public int saveaddress(Address address);

	// 读取地址信息
	public List<Address> readaddress(Address address);

}
