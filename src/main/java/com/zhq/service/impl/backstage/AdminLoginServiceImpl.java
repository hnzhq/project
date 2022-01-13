package com.zhq.service.impl.backstage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.zhq.dao.backstage.AdminLoginDao;
import com.zhq.model.backstage.Admin;
import com.zhq.service.backstage.AdminLoginService;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	@Autowired
	private AdminLoginDao dao;

	@Override
	public boolean checkLogin(Admin admin) {
		Admin dbAdmin = dao.findByName(admin.getAdminname());

		System.out.println(admin.getAdminname());

		if (dbAdmin == null) {
			return false;
		}

		// 假如说：在数据库中新增用户的时候，密码是：username{password}的md5格式
		String encrypt = admin.getAdminname() + "{" + admin.getPassword() + "}";
		System.out.println(admin.getPassword());
		String md5Str = DigestUtils.md5DigestAsHex(encrypt.getBytes());

		if (md5Str.equals(dbAdmin.getPassword())) {
			return true;
		} else {
			return false;
		}
	}

}
