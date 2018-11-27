package com.sccc.rczp.common.aspect;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 拦截异常的一种全局方式。可以在需要处理异常的类中添加@ExceptionHandler注解进行处理本方法 本类的相关异常
 */
@RestControllerAdvice
public class ControllerAdvice {

    private static final String VIEW1= "error";
    private static final String VIEW2= "404";

    private static final Log log = LogFactory.getLog(ControllerAdvice.class);

    //404会被tomcat拦截  不会走到这里，需要在web.xml中配置
    @ExceptionHandler(value = NoSuchMethodException.class)
    public ModelAndView noMethod(NoSuchMethodException e, HttpServletRequest request, HttpServletResponse response){
        log.error(e.getMessage());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("exception",e);
        modelAndView.addObject("url", request.getRequestURI());
        modelAndView.setViewName(VIEW2);
        return modelAndView;
    }


    @ExceptionHandler(value = Exception.class)
    public ModelAndView errorHandler(Exception e, HttpServletRequest req) {
        log.error(e.getMessage());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("exception", e);
        modelAndView.addObject("url", req.getRequestURI());
        //modelAndView.setViewName("redirect:/user");
        modelAndView.setViewName(VIEW1);
        System.out.println("这是exception拦截类");
        return modelAndView;
    }
}
