package com.zhq.service.impl.shop;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.zhq.dao.shop.UserLoginDao;
import com.zhq.model.shop.User;
import com.zhq.service.shop.UserLoginService;

@Service
public class UserLoginServiceImpl implements UserLoginService {
	@Autowired
	private UserLoginDao dao;

	@Override
	public boolean checkLogin(User user) {
		User dbUser = dao.findByUsername(user.getUsername());

		System.out.println(user.getUsername());

		if (dbUser == null) {
			return false;
		}

		// 假如说：在数据库中新增用户的时候，密码是：username{password}的md5格式
		String encrypt = user.getUsername() + "{" + user.getPassword() + "}";
		System.out.println(user.getPassword());
		String md5Str = DigestUtils.md5DigestAsHex(encrypt.getBytes());

		if (md5Str.equals(dbUser.getPassword())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User findAll(User user) {
		System.out.println(user.getUsername());
		return dao.findByUsername(user.getUsername());
	}

	// 修改信息
	@Override
	public User findById(Integer id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		return dao.findById(map);
	}

	@Override
	public boolean edituser(User user) {
		return dao.edituser(user) > 0;
	}

}
