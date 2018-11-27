<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  admin: misaki
  Date: 18-11-5
  Time: 上午1:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>详情</title>
</head>
<body>

    <tr align="center">
        <ul>recruitinformation
            <li>：${recruitinformation.rid}</li>
            <li>id：${recruitinformation.eid}</li>
            <li>：${recruitinformation.job}</li>
            <li>：${recruitinformation.path}</li>
            <li>：${recruitinformation.benefit}</li>
            <li>：${recruitinformation.title}</li>
            <li>：${recruitinformation.salarymin}</li>
            <li>：${recruitinformation.salarymax}</li>
            <li>：${recruitinformation.qualifications}</li>
            <li>：${recruitinformation.rtime}</li>
            <li>：${recruitinformation.jobdes}</li>
            <li>
                <ul>enterprise

                            <li>企业id：  ${recruitinformation.enterprise.eid}</li>
                            <li>管理员id：${recruitinformation.enterprise.aid}</li>
                            <li>企业图片：${recruitinformation.enterprise.eimage}</li>
                            <li>企业概要：${recruitinformation.enterprise.aabstract}</li>
                            <li>企业描述：${recruitinformation.enterprise.detailinformation}</li>
                            <li>企业地址：${recruitinformation.enterprise.address}</li>
                            <li>企业邮箱：${recruitinformation.enterprise.email}</li>
                            <li>企业电话：${recruitinformation.enterprise.phonenumber}</li>
                            <li>企业密码：${recruitinformation.enterprise.epassword}</li>
                </ul>

            </li>
        </ul>
    </tr>

</body>
</html>
