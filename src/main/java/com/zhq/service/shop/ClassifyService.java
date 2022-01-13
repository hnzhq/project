package com.zhq.service.shop;

import java.util.List;

import com.zhq.model.shop.Classify;

public interface ClassifyService {
	// 一级目录
	public List<Classify> findOne();

	// 二级目录
	public List<Classify> findTwo();

	// 三级目录
	public List<Classify> findThree();
}
