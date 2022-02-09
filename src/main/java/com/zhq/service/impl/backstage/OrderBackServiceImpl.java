package com.zhq.service.impl.backstage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.backstage.OrderBackDao;
import com.zhq.model.shop.Order;
import com.zhq.model.shop.OrderDetails;
import com.zhq.service.backstage.OrderBackService;

@Service
public class OrderBackServiceImpl implements OrderBackService {
	@Autowired
	private OrderBackDao dao;

	@Override
	public List<Order> findAllOrder(Order order) {

		return dao.findAllOrder(order);
	}

	@Override
	public List<OrderDetails> finOrderDetails(OrderDetails orderDetails) {
		// TODO Auto-generated method stub
		return dao.findOrderDetails(orderDetails);
	}

	@Override
	public boolean updateOrder(Order order) {
		// TODO Auto-generated method stub
		return dao.updateOrder(order) > 0;
	}

}
