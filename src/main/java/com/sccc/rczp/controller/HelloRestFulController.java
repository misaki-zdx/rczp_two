package com.sccc.rczp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HelloRestFulController {
    @RequestMapping(value = "/helloRESTful",method = RequestMethod.GET)
    public String helloWorld(){
        System.out.println("xxxxxx");
        return  "helloRestView";
    }
}
