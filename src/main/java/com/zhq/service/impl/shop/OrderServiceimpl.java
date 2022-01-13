
package com.zhq.service.impl.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.shop.OrderDao;
import com.zhq.model.shop.Order;
import com.zhq.model.shop.OrderDetails;
import com.zhq.model.shop.ShopCart;
import com.zhq.service.shop.OrderService;

@Service
public class OrderServiceimpl implements OrderService {
	@Autowired
	private OrderDao dao;

	// 商品ID查信息
	@Override
	public ShopCart findByproId(ShopCart shopcart) {

		return dao.findByproId(shopcart);
	}

	// 写订单
	@Override
	public boolean saveOrder(Order order) {
		// TODO Auto-generated method stub
		return dao.saveOrder(order) > 0;
	}

	// 写订单详情
	@Override
	public boolean saveOrderDetails(OrderDetails orderDetails) {
		// TODO Auto-generated method stub
		return dao.saveOrderdetails(orderDetails) > 0;
	}

	// 查找订单
	@Override
	public List<Order> findOrder(Order order) {
		// TODO Auto-generated method stub
		return dao.findOrder(order);
	}

	// 查找订单详情
	@Override
	public List<OrderDetails> findOrderDetails(OrderDetails orderDetails) {
		// TODO Auto-generated method stub
		return dao.findOrderDetails(orderDetails);
	}

}
