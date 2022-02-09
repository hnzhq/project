package com.zhq.service.impl.backstage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.backstage.BackClassifyDao;
import com.zhq.model.backstage.BackClassify;
import com.zhq.service.backstage.BackClassifyService;

@Service
public class BackClassifyServiceImpl implements BackClassifyService {
	@Autowired
	private BackClassifyDao dao;

	@Override
	public List<BackClassify> findOne() {
		return dao.findOne();
	}

	@Override
	public List<BackClassify> findTwo() {
		return dao.findTwo();
	}

	@Override
	public List<BackClassify> findThree() {
		return dao.findThree();
	}

}
