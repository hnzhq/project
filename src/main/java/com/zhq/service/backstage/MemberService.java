package com.zhq.service.backstage;

import java.util.List;

import com.zhq.model.backstage.Member;

public interface MemberService {

	// 查询所有会员
	public List<Member> findAll(Member member);

	// 删除用户
	public int deleteByIds(Integer[] ids);

}
