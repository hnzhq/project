package com.zhq.dao.backstage;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.backstage.Admin;

@Mapper
public interface AdminLoginDao {

	public Admin findByName(String name);
}
