package com.zhq.controller.shop;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhq.model.shop.User;
import com.zhq.service.shop.UserLoginService;
import com.zhq.service.shop.UserRegisterService;

@Controller
@RequestMapping("/shop/")
public class LoginController {

	@Autowired
	private UserLoginService uls;

	// 跳到登录页
	@GetMapping(value = { "login", "login/" })
	public String login() {
		return "shop/login";
	}

	// 用户登录
	@PostMapping(value = { "login", "login/" })
	public String login(User user, Map<String, Object> map, HttpServletRequest request) {
		// 用户点击登录
		boolean passed = uls.checkLogin(user);
		// System.out.println(user.getCaptcha());

		String sessionCode = (String) request.getSession()
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		String checkCode = user.getCaptcha();
		// String isSuccess = "";

		System.out.println("dasdadasdsa");
		System.out.println(user.getUsername());

		System.out.println(user.getPassword());

		if (checkCode != null && checkCode.equals(sessionCode)) {
			if (passed) {
				request.getSession().setAttribute("##current_login_user##", user);

				HttpSession session = request.getSession();
				User users = (User) session.getAttribute("##current_login_user##");
				System.out.println("会话域用户名" + users.getUsername());

				// 根据用户名找到用户的信息
				User userinformation = uls.findAll(user);
				request.getSession().setAttribute("##current_login_userinformation##", userinformation);
				request.getSession().setMaxInactiveInterval(60 * 60);
				System.out.println(userinformation.getUsername());

				return "redirect: index";
			} else {
				map.put("error", "用户名或密码错误");
				return "shop/login";
			}
		} else {
			map.put("error", "验证错误");
			return "shop/login";
		}
	}

	@Autowired
	private UserRegisterService urs;

	// 跳到注册页
	@GetMapping(value = { "register", "register/" })
	public String toregis() {
		return "shop/register";
	}

	// 用户注册
	@PostMapping(value = { "register", "register/" })
	public String addOneUser(User user, Map<String, Object> map, HttpServletRequest request) {

		// System.out.println(user.getCaptcha());
		if (user.getUsername() == null || user.getUsername().trim().length() == 0) {
			map.put("error", "用户名不允许为空");
			return "shop/register";
		}

		String password1 = user.getUsername() + "{" + user.getPassword1() + "}";
		String password2 = user.getUsername() + "{" + user.getPassword2() + "}";
		String md5password1 = DigestUtils.md5DigestAsHex(password1.getBytes());// 更改密码为md5格式
		System.out.println(md5password1);
		// 将生成的密码传递
		user.setPassword1(md5password1);
		String md5password2 = DigestUtils.md5DigestAsHex(password2.getBytes());
		System.out.println(user.getPassword1());
		/*System.out.println(user.getUsername());
		System.out.println(user.getPassword1());
		System.out.println(user.getPassword2());
		System.out.println(user.getEmail());*/
		if (user.getPassword1() == null || user.getPassword1().trim().length() == 0) {
			map.put("error", "密码不允许为空");
			return "shop/register";
		}
		if (!md5password1.equals(md5password2)) {
			map.put("error", "两次密码输入不同");
			return "shop/register";
		}
		if (user.getEmail() == null || user.getEmail().trim().length() == 0) {
			map.put("error", "邮箱不允许为空");
			return "shop/register";
		}
		String sessionCode = (String) request.getSession()
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		String checkCode = user.getCaptcha();
		boolean success = urs.addOneUser(user);
		// System.out.println("123 " + user.getCaptcha());
		// System.out.println("123 " + sessionCode);
		if (checkCode != null && checkCode.equals(sessionCode)) {
			if (success) {
				map.put("successful", "注册成功");
				return "shop/register";

			} else {
				map.put("error", "保存数据失败");
				return "shop/register";
			}
		} else {
			map.put("error", "验证错误");
			return "shop/register";
		}

	}

}
