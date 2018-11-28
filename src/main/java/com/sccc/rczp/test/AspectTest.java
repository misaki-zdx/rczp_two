package com.sccc.rczp.test;

import org.springframework.stereotype.Component;

@Component
public class AspectTest {

    public int f(int x) {
        return x + 3;
    }

    public void f2() {
        System.out.println(3 / 0);
    }

    public void f3() {
        System.out.println("aspect EnumTest");
    }

}
