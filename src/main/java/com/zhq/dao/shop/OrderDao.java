package com.zhq.dao.shop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.shop.Order;
import com.zhq.model.shop.OrderDetails;
import com.zhq.model.shop.ShopCart;

@Mapper
public interface OrderDao {
	// 根据商品id查商品信息
	public ShopCart findByproId(ShopCart shopcart);

	// 写入一个订单
	public int saveOrder(Order order);

	// 写入详情表
	public int saveOrderdetails(OrderDetails orderDetails);

	// 查找订单
	public List<Order> findOrder(Order order);

	// 查找订单详细信息
	public List<OrderDetails> findOrderDetails(OrderDetails orderDetails);

}
