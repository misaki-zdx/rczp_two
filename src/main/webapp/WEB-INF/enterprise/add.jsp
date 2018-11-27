<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	out.print(basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加管理员</title>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
	<script type="text/javascript" >
        function addSubmit(){
            //console.log("xx");
            $.ajax({
                type: "POST",
                url: "enterprise/addEnterprise",
                data:"eid=&"+$('#addForm').serialize(), //将表单中的数据序列化
                success: function(data) {
                    console.log("success");
                }
            })
        }

	</script>

</head>
<h2>添加企业</h2>
<body>
<form action=""  method="post" id="addForm">
<%--	<span>eid:</span>
	<input type="text" name="eid" placeholder="eid">--%>
	<br/>
	<span>aid:</span>
	<input type="text" name="aid" placeholder="aid">
	<br/>
	<span>图片:</span>
	<input type="text" name="eimage" placeholder="eimage">
	<br/>
	<span>aabstract:</span>
	<input type="text" name="aabstract" placeholder="aabstract">
	<br/>
	<span>其他信息:</span>
	<input type="text" name="detailinformation" placeholder="detailinformation">
	<br/>
	<span>地址:</span>
	<input type="text" name="address" placeholder="address">
	<br/>
	<span>邮箱:</span>
	<input type="text" name="email" placeholder="email">
	<br/>
	<span>电话:</span>
	<input type="text" name="phonenumber" placeholder="phonenumber">
	<br/>
	<span>名字:</span>
	<input type="text" name="ename" placeholder="ename">
	<br/>
	<span>密码:</span>
	<input type="text" name="epassword" placeholder="epassword">
	<br/>
	<input  type="button" value="添加" onclick="addSubmit()">

</form>
</body>
</html>