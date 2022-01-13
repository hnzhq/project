package com.zhq.controller.backstage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhq.model.backstage.Admin;
import com.zhq.service.backstage.AdminLoginService;

@Controller
@RequestMapping("/backstage/login")
public class AdminLoginController {
	@Autowired
	private AdminLoginService us;

	// 登录页
	@GetMapping(value = { "", "/" })
	public String login() {
		return "backstage/login";
	}

	@PostMapping(value = { "", "/" })
	public String login(Admin admin, Map<String, Object> map, HttpServletRequest request) {
		boolean passed = us.checkLogin(admin);
		System.out.println(admin.getCaptcha());

		String sessionCode = (String) request.getSession()
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		// System.out.println(sessionCode);
		// System.out.println(admin.getAdminname());
		String checkCode = admin.getCaptcha();
		// String isSuccess = "";
		if (checkCode != null && checkCode.equals(sessionCode)) {
			if (passed) {
				request.getSession().setAttribute("##current_login_admin##", admin);

				return "backstage/index";
			} else {
				map.put("error", "用户名或密码错误");
				return "backstage/login";
			}
		} else {
			map.put("error", "验证错误");
			return "backstage/login";
		}
	}
}
