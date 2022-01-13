package com.zhq.dao.shop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.shop.Classify;

@Mapper
public interface ClassifyDao {
//一级目录
	public List<Classify> findOne();

//二级目录
	public List<Classify> findTwo();

//三级目录
	public List<Classify> findThree();

}
