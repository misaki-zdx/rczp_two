package com.sccc.rczp.custom;

public class UseMyAnnotation {
    @MyAnnotation(value = "myAnnotation Value", path = "myAnnotation Path")
    public void useAnnotation() {
        System.out.println("used MyAnnotation!");
    }
}
