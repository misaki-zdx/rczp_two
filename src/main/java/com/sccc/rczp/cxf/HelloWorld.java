package com.sccc.rczp.cxf;

import javax.jws.WebService;

/**
 * 暴露在外面的接口需要@webservice注解
 */
@WebService
public interface HelloWorld {
     String say(String str);
}
