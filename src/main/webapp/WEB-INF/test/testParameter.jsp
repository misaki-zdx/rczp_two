<%--
  Created by IntelliJ IDEA.
  User: misaki
  Date: 18-11-2
  Time: 上午11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/common.jsp"%>

<html>
<head>
    <title>Title</title>
</head>
<body>

<script>
    var datas =
   $.ajax({
       type: "post",
       contentType : 'application/json',
       dataType:'json',
       data:datas,
       success:function (data) {
           console.log("success")
       },
       error:function () {
           console.log("error")
       }
   })
</script>
</body>
</html>
