package com.sccc.rczp.custom;

import org.springframework.core.annotation.AliasFor;

import java.lang.annotation.*;

/**
 * 自定义注解
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface MyAnnotation {

    @AliasFor("path")
    String value() default "String Temp";

    @AliasFor("value")
    String path() default "Path Temp";

}
