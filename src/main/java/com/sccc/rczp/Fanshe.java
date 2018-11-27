package com.sccc.rczp;


import com.sccc.rczp.bean.po.User;
import com.sccc.rczp.common.MyIntercepter;

import java.lang.reflect.Constructor;

public class Fanshe {
    public static void main(String[] args) {
        User user = new User();
        //第一种  通过object的getClass() 方法
        Class<? extends User> aClass = user.getClass();
        //第二种 通过关键字 class
        Class<User> userClass = User.class;
        //通过Class.forName() 获取;参数格式为类的相对路径
        try {
            Class<?> aClass1 = Class.forName("com.sccc.rczp.common.MyIntercepter");
            System.out.println(aClass1.getSimpleName());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            //获取对象的方式 默认
            User user1 = userClass.newInstance();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        Constructor<?>[] constructors = userClass.getConstructors();
        System.out.println(constructors);
    }
}
