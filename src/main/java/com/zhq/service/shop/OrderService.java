package com.zhq.service.shop;

import java.util.List;

import com.zhq.model.shop.Order;
import com.zhq.model.shop.OrderDetails;
import com.zhq.model.shop.ShopCart;

public interface OrderService {
	// 根据商品id查商品信息
	public ShopCart findByproId(ShopCart shopcart);

	// 保存订单
	public boolean saveOrder(Order order);

	// 保存详情
	public boolean saveOrderDetails(OrderDetails orderDetails);

	// 查找订单
	public List<Order> findOrder(Order order);

	// 查找订单详情
	public List<OrderDetails> findOrderDetails(OrderDetails orderDetails);
}
