package com.zhq.dao.backstage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.shop.Order;
import com.zhq.model.shop.OrderDetails;

@Mapper
public interface OrderBackDao {
	// 查询所有订单
	public List<Order> findAllOrder(Order order);

	// 订单编号查详情
	public List<OrderDetails> findOrderDetails(OrderDetails orderDetails);

	// 后台修改订单（发货，快递公司）
	public int updateOrder(Order order);

}
