package com.zhq.service.impl.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.shop.UserRegisterDao;
import com.zhq.model.shop.User;
import com.zhq.service.shop.UserRegisterService;

@Service
public class UserRegisterServiceImpl implements UserRegisterService {
	@Autowired
	private UserRegisterDao dao;

	public UserRegisterServiceImpl(UserRegisterDao dao) {
		super();
		this.dao = dao;
	}

	public boolean addOneUser(User user) {
		return dao.addOneUser(user) > 0;
	}

}
