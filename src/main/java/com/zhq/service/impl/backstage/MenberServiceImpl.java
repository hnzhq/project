package com.zhq.service.impl.backstage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhq.dao.backstage.MemberDao;
import com.zhq.model.backstage.Member;
import com.zhq.service.backstage.MemberService;

@Service
public class MenberServiceImpl implements MemberService {
	@Autowired
	private MemberDao dao;

	// 查找会员
	@Override
	public List<Member> findAll(Member member) {

		return dao.findAll(member);
	}

	@Override
	public int deleteByIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return dao.deleteByIds(ids);
	}

}
