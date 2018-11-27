package com.sccc.rczp.controller;

import com.sccc.rczp.bean.po.Admin;
import com.sccc.rczp.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/myController")
public class MyController {

    @Autowired
    private AdminMapper adminMapper;

    /*
    @ResponseBody

    @Responsebody 注解表示该方法的返回的结果直接写入 HTTP 响应正文（ResponseBody）中，一般在异步获取数据时使用，通常是在使用 @RequestMapping 后，返回值通常解析为跳转路径，加上 @Responsebody 后返回结果不会被解析为跳转路径，而是直接写入HTTP 响应正文中。
    作用：
    该注解用于将Controller的方法返回的对象，通过适当的HttpMessageConverter转换为指定格式后，写入到Response对象的body数据区。
    使用时机：
    返回的数据不是html标签的页面，而是其他某种格式的数据时（如json、xml等）使用；
*/
    @RequestMapping("/hello")
    @ResponseBody
    public List<Admin> hello() {
        return adminMapper.selectAll();
    }

    @RequestMapping("/parameter/{id}/{name}")
    public void login(@PathVariable int id,@PathVariable String name){
        System.out.println("id:"+id+",name:"+name);
    }

    @RequestMapping("/testParameter")
    public String testParameter(){
        return "test/testParameter";
    }
}
