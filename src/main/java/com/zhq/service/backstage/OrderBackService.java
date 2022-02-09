package com.zhq.service.backstage;

import java.util.List;

import com.zhq.model.shop.Order;
import com.zhq.model.shop.OrderDetails;

public interface OrderBackService {
	// 查找所有订单
	public List<Order> findAllOrder(Order order);

	// 订单号查详情
	public List<OrderDetails> finOrderDetails(OrderDetails orderDetails);

	// 后台修改订单（发货，快递公司）
	public boolean updateOrder(Order order);
}
