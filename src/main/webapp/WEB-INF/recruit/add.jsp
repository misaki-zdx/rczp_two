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
<title>添加recruit</title>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
	<script type="text/javascript" >
        function addSubmit(){
            $.ajax({
                type: "POST",
                url: "recruit/addRecruit",
                data:'rid=&'+$('#addForm').serialize(),//将表单中的数据序列化
                success: function(data) {
                    console.log("success");
                }
            })
        }

	</script>

</head>
<body>
<h2>添加简历</h2>
<form action=""  method="post" id="addForm">
	<span>公司id:</span>
	<input type="text" name="eid" placeholder="公司id">
	<br/>
	<span>工作:</span>
	<input type="text" name="job" placeholder="工作">
	<br/>
	<span>地址:</span>
	<input type="text" name="path" placeholder="地址">
	<br/>
	<span>福利:</span>
	<input type="text" name="benefit" placeholder="福利">
	<br/>
	<span>标题:</span>
	<input type="text" name="title" placeholder="标题">
	<br/>
	<span>最低工资:</span>
	<input type="text" name="salarymin" placeholder="最低工资">
	<br/>
	<span>最高工资:</span>
	<input type="text" name="salarymax" placeholder="最高工资">
	<br/>
	<span>详细介绍:</span>
	<input type="text" name="jobdes" placeholder="详细介绍">
	<br/>
	<span>资格:</span>
	<input type="text" name="qualifications" placeholder="资格">
	<br/>
	<span>发布时间:</span>
	<input type="date" name="rtime1" placeholder="发布时间">
	<br/>
	<input  type="button" value="添加" onclick="addSubmit()">

</form>
</body>
</html>