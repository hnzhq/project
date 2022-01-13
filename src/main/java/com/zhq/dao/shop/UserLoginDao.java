package com.zhq.dao.shop;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.shop.User;

@Mapper
public interface UserLoginDao {
	// 用户名查信息
	public User findByUsername(String username);

	// 更改用户信息
	public User findById(Map<String, Object> map);

	public int edituser(User user);

}
