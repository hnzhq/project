package com.zhq.dao.backstage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zhq.model.backstage.Member;

@Mapper
public interface MemberDao {

	// 查询所有用户
	public List<Member> findAll(Member member);

	// 删除用户
	public int deleteByIds(@Param(value = "ids") Integer[] ids);

}
