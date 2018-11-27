package com.sccc.rczp.common;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyIntercepter implements HandlerInterceptor {

    private final static Log log =  LogFactory.getLog(MyIntercepter.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        log.info("进入pre"+request.getRequestURI()+"；"+request.getPathInfo()+"；"+request.getContextPath());
        System.out.println("handler:"+handler);
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
        log.info("进入post"+request.getRequestURI()+"；"+request.getPathInfo()+"；"+request.getContextPath());
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        log.info("进入after"+request.getRequestURI()+"；"+request.getPathInfo()+"；"+request.getContextPath());
    }
}
