package com.sccc.rczp.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.sccc.rczp.bean.po.User;

public class LoginIntercpter  implements HandlerInterceptor{
@Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	Object attribute = request.getSession().getAttribute("login");
	if(attribute != null){
		return true;
	}
	response.sendRedirect("/index/login");
	return false;
}
	
}
