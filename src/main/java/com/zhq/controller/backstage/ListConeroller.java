package com.zhq.controller.backstage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhq.model.backstage.Member;
import com.zhq.service.backstage.MemberService;

@Controller
@RequestMapping("/backstage/")
public class ListConeroller {
	@Autowired
	private MemberService ms;

	// 跳到用户信息
	@GetMapping(value = { "user_list", "user_list/" })
	public String toUserList(Member member, Map<String, Object> map) {
		List<Member> members = ms.findAll(member);

		map.put("members", members);
		return "backstage/user_list";
	}

	// 删除用户
	@PostMapping(value = "/deleteusers", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map<String, Object> delete(Integer[] ids) {
		// System.out.println(Arrays.toString(ids));
		Map<String, Object> resp = new HashMap<>();
		int rows = ms.deleteByIds(ids);
		if (rows > 0) {
			resp.put("success", true);
			resp.put("rows", rows);
		} else {
			resp.put("success", false);
			resp.put("error", "删除数据时异常");
		}
		return resp;
	}

}
