package com.sccc.rczp.common.aspect;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.springframework.context.annotation.Configuration;

import java.lang.reflect.Method;

/*@Configuration
注解的类有一下要求：
配置类不能是 final 的
配置类不能是本地化的：就是不能将 配置类 定义在 其他类 的方法内部
配置类必须有一个无参构造函数*/
@Configuration
@Aspect
public class ControllerAspect {
    private static final Log log = LogFactory.getLog(ControllerAspect.class);

    //除了返回类型模式（上面代码片断中的ret-type-pattern），名字模式和参数模式以外，
    // 所有的部分都是可选的。返回类型模式决定了方法的返回类型必须依次匹配一个连接点。

    @Pointcut("execution(public * *..*Controller.*(..))") //任意包下 以Controller结尾类的任意公共方法
    public void pointCut() {
    }

    @Pointcut("execution( * com.sccc.rczp.test.AspectTest.*(..))")
    public void pointCut2() {
    }

    @Before("pointCut2()")
    public void controllerAspectBefore(JoinPoint point) {
        Object[] args = point.getArgs();
        System.out.println("AOP Before Advice...");
    }

    @After("pointCut2()")
    public void doAfter(JoinPoint joinPoint) {
        System.out.println("AOP After Advice...");
    }

    @AfterReturning(pointcut = "pointCut2()", returning = "returnVal")
    public void afterReturn(JoinPoint joinPoint, Object returnVal) {
        //现在尝试修改 returnVal  是否会影响 函数返回值  >> 事实不会修改函数的返回值
       // returnVal++;
        System.out.println("AOP AfterReturning Advice:" + returnVal);
    }

    @AfterThrowing(pointcut = "pointCut2()", throwing = "error")
    public void afterThrowing(JoinPoint joinPoint, Throwable error) {
        System.out.println("AOP AfterThrowing Advice..." + error);
        System.out.println("AfterThrowing...");
    }

    //Spring AOP的环绕通知会影响到AfterThrowing通知的运行,不要同时使用!同时使用也没啥意义。
    //同时用时  AfterThrowing 会失效  但如果单独用AfterThrowing 会中断程序的运行 意义何在

    /**
     * 如果around定义了并且before/after也同时定义了
     * around 就会只执行一次
     */
    @Around("pointCut2()")   //@Around 具有返回值
    public Object around(ProceedingJoinPoint pjp) {
        System.out.println("AOP Aronud before...");
        Object proceed = null;
        try {
            //proceed = (int) pjp.proceed();
            proceed = pjp.proceed();

            Signature signature = pjp.getSignature();
            System.out.println(signature);      /*  >>  int com.sccc.rczp.test.AspectTest.f(int) */

            /*//获取代理方法对象
                    String methodName = pjp.getSignature().getName();
                    Method method = pjp.getSignature().getDeclaringType().getMethod(methodName, parameterTypes);*/

           /* //获取实际方法对象,可以获取方法注解等
                     Method realMethod = pjp.getTarget().getClass().getDeclaredMethod(signature.getName(), targetMethod.getParameterTypes());*/

            //proceed 是方法执行之后的返回值  我们可以对其进行任意更改
          /*  proceed = proceed + 5;*/
        } catch (Throwable e) {
            e.printStackTrace();
        }
        System.out.println("AOP Aronud after...");
        return proceed;
    }

}
