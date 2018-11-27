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
<c:forEach var="admin" items="${admins}">
    <tr align="center">
        <ul>
            <li>管理员编号：${admin.aid}</li>
            <li>管理员姓名：${admin.aname}</li>
            <li>管理员密码：${admin.password}</li>
        <li>users
            <ul>
                <c:forEach var="user" items="${admin.users}">

                    <li>用户id：${user.uid}</li>
                    <li>管理员id：${user.aid}</li>
                    <li>用户生日：${user.birthday}</li>
                    <li>用户性别：${user.sex}</li>
                    <li>用户意向：${user.intention}</li>
                    <li>用户姓名：${user.uname}</li>
                    <li>用户照片：${user.uimage}</li>
                    <li>用户自我描述：${user.uabstract}</li>
                    <li>用户密码：${user.upassword}</li>

                </c:forEach>
            </ul>
        </li>
            <li>enterprises
                <ul>
                    <c:forEach var="enterprise" items="${admin.enterprises}">

                        <li>企业id：${enterprise.eid}</li>
                        <li>管理员id：${enterprise.aid}</li>
                        <li>企业图片：${enterprise.eimage}</li>
                        <li>企业概要：${enterprise.aabstract}</li>
                        <li>企业描述：${enterprise.detailinformation}</li>
                        <li>企业地址：${enterprise.address}</li>
                        <li>企业邮箱：${enterprise.email}</li>
                        <li>企业电话：${enterprise.phonenumber}</li>
                        <li>企业密码：${enterprise.epassword}</li>

                    </c:forEach>
                </ul>
            </li>
        </ul>
    </tr>
</c:forEach>
</body>
</html>
