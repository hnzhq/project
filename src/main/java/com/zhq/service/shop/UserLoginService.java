package com.zhq.service.shop;

import com.zhq.model.shop.User;

public interface UserLoginService {
	// 点击登录
	public boolean checkLogin(User user);

	// 查找用户资料
	public User findAll(User user);

	// 修改信息
	public User findById(Integer id);

	public boolean edituser(User user);

}
