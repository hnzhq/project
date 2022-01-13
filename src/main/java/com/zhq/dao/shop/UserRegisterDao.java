package com.zhq.dao.shop;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.shop.User;

@Mapper
public interface UserRegisterDao {

	public int addOneUser(User user);
}
