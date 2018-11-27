package com.sccc.rczp.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.View;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Component
public class HelloRestView  implements View {
    @Override
    public String getContentType() {
        return "text/html;charset=UTF-8";
    }

    @Override
    public void render(Map<String, ?> map, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        httpServletResponse.setContentType("text/html;charset=utf-8");
        httpServletResponse.getWriter().write("自定义视图显示");
        httpServletResponse.getWriter().flush();
        httpServletResponse.getWriter().close();
    }
}
