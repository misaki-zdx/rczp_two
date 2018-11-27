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
    <title>修改管理员</title>
    <base href="<%=basePath%>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.6.min.js"></script>
    <script type="text/javascript" >
        function updete(){
            //console.log("xx");
            $.ajax({
                type: "POST",
                url: "recruit/update",
                data:admins= $('#updateForm').serialize(), //将表单中的数据序列化
                success: function(data) {
                    console.log("success");
                }
            })
        }

    </script>
    <style type="text/css">
    </style>
<body>


<form action="" method="post" id="updateForm">
    <span>简历id:</span>
    <input type="text" name="rid" placeholder="简历id" readonly="readonly" value="${recruit.rid}">
    <br/>
    <span>公司id:</span>
    <input type="text" name="eid" placeholder="公司id" value="${recruit.eid}">
    <br/>
    <span>工作:</span>
    <input type="text" name="job" placeholder="工作" value="${recruit.job}">
    <br/>
    <span>地址:</span>
    <input type="text" name="path" placeholder="地址" value="${recruit.path}">
    <br/>
    <span>福利:</span>
    <input type="text" name="benefit" placeholder="福利" value="${recruit.benefit}">
    <br/>
    <span>标题:</span>
    <input type="text" name="title" placeholder="标题" value="${recruit.title}">
    <br/>
    <span>最低工资:</span>
    <input type="text" name="salarymin" placeholder="最低工资" value="${recruit.salarymin}">
    <br/>
    <span>最高工资:</span>
    <input type="text" name="salarymax" placeholder="最高工资" value="${recruit.salarymax}">
    <br/>
    <span>详细介绍:</span>
    <input type="text" name="jobdes" placeholder="详细介绍" value="${recruit.jobdes}">
    <br/>
    <span>资格:</span>
    <input type="text" name="qualifications" placeholder="资格" value="${recruit.qualifications}">
    <br/>
    <span>发布时间:</span>
    <input type="text" name="rtime" placeholder="发布时间" value="${recruit.rtime}">
    <br/>
    <input  type="button" value="修改" onclick="updete()"/>
</form>

</body>

</html>
