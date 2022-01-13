package com.zhq.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.zhq.model.backstage.Admin;

public class Admininterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("##current_login_admin##");
		if (admin == null) {
			response.sendRedirect(request.getContextPath() + "backstage/login");
			return false;
		} else {
			return true;
		}
	}
}
