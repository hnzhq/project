package com.zhq.service.impl.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.shop.ClassifyDao;
import com.zhq.model.shop.Classify;
import com.zhq.service.shop.ClassifyService;

@Service
public class ClassifyServiceImpl implements ClassifyService {
	@Autowired
	private ClassifyDao dao;

	@Override
	public List<Classify> findOne() {
		return dao.findOne();
	}

	@Override
	public List<Classify> findTwo() {
		return dao.findTwo();
	}

	@Override
	public List<Classify> findThree() {
		return dao.findThree();
	}

}
