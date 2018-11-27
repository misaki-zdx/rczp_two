<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
    <script type="text/javascript" >
        function updete(){
            //console.log("xx");
            $.ajax({
                type: "POST",
                url: "/enterprise/update",
                data:$('#updateForm').serialize(), //将表单中的数据序列化
                success: function(data) {
                    console.log("success");
                }
            })
        }
    </script>
<head>
    <meta charset="UTF-8">
    <title>修改企业</title>
</head>
<body>
</div>
<form action="" method="post" id="updateForm">
<div><span>eid:</span><span><input type="text" name="eid" value="${enterprises.eid}" readonly="readonly"></span></div>
<div><span>aid:</span><span><input type="text" name="aid" value="${enterprises.aid}"></span></div>
<div><span>图片:</span><span><input type="text" name="eimage" value="${enterprises.eimage}"></span></div>
<div><span>aabstract:</span><span><input type="text" name="aabstract" value="${enterprises.aabstract}"></span></div>
<div><span>其他:</span><span><input type="text" name="detailinformation" value="${enterprises.detailinformation}"></span></div>
<div><span>地址:</span><span><input type="text" name="address" value="${enterprises.address}"></span></div>
<div><span>邮箱:</span><span><input type="text" name="email" value="${enterprises.email}"></span></div>
<div><span>号码:</span><span><input type="text" name="phonenumber" value="${enterprises.phonenumber}"></span></div>
<div><span>名字:</span><span><input type="text" name="ename" value="${enterprises.ename}"></span></div>
<div><span>密码:</span><span><input type="text" name="epassword" value="${enterprises.epassword}"></span></div>
    <input  type="button" value="修改" onclick="updete()">
</form>
</div>
</body>






</html>
