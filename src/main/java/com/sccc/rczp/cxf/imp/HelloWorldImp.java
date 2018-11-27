package com.sccc.rczp.cxf.imp;


import com.sccc.rczp.cxf.HelloWorld;
import org.springframework.stereotype.Component;



@Component("HelloWorld")
public class HelloWorldImp implements HelloWorld {
    @Override
    public String say(String str) {
        return "Hello"+str;
    }
}
