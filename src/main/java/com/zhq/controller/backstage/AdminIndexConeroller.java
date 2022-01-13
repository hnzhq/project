package com.zhq.controller.backstage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/backstage/")
public class AdminIndexConeroller {

	@GetMapping(value = { "index", "index/" })
	public String login() {
		return "backstage/index";
	}

	// 首页
	@GetMapping(value = { "home", "home/" })
	public String tohome() {
		return "backstage/home";
	}

	// 个人资料
	@GetMapping(value = { "admin_info", "admin_info/" })
	public String toinfo() {
		return "backstage/admin_info";
	}

}
