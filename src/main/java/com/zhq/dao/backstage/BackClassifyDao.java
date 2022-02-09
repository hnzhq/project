package com.zhq.dao.backstage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zhq.model.backstage.BackClassify;

@Mapper
public interface BackClassifyDao {
//一级目录
	public List<BackClassify> findOne();

//二级目录
	public List<BackClassify> findTwo();

//三级目录
	public List<BackClassify> findThree();

}
