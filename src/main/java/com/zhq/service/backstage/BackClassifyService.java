package com.zhq.service.backstage;

import java.util.List;

import com.zhq.model.backstage.BackClassify;

public interface BackClassifyService {
	// 一级目录
	public List<BackClassify> findOne();

	// 二级目录
	public List<BackClassify> findTwo();

	// 三级目录
	public List<BackClassify> findThree();
}
