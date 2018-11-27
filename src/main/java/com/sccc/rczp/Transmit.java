package com.sccc.rczp;

import com.sccc.rczp.bean.po.User;

public class Transmit {

    public void swap(int a,int b){
        int temp;
        temp = a;
        a = b;
        b= temp;
    }

    public void f(User user){
        user.a += 1;
    }

    public static void main(String[] args) {
        Transmit transmit = new Transmit();
       int a = 1;
       int b = 2;
        User user = new User();
        transmit.swap(a,b);
        transmit.f(user);
        System.out.println("a:"+a+";b:"+b+";user:"+user.a);
        /***********************
         *  >> a:1;b:2;user:5  *
         ************************/
    }

}
