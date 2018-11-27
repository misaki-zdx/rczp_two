package com.sccc.rczp.test;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring.xml")   //会启动spring的所有配置
public class TestAspect {
    @Autowired
    private AspectTest aspectTest;

    @Test
    public void f1() {
        System.out.println(aspectTest.f(2));
        //aspectTest.f2();
        //aspectTest.f3();
    }
}
