<%--
  Created by IntelliJ IDEA.
  User: Misaki
  Date: 2018/11/12
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- <%@ include file="../common/common.jsp" %> --%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="assets/css/amazeui.css"/>
    <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">-->
    <link rel="stylesheet" href="assets/css/core.css"/>
    <link rel="stylesheet" href="assets/css/menu.css"/>
    <link rel="stylesheet" href="assets/css/index.css"/>
    <link rel="stylesheet" href="assets/css/admin.css"/>
    <link rel="stylesheet" href="assets/css/page/typography.css"/>
    <link rel="stylesheet" href="assets/css/page/form.css"/>
    <!--<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.js"></script>-->
    <script type="text/javascript" src="assets/js/jquery-2.1.0.js"></script>
    <script type="text/javascript" src="assets/js/amazeui.min.js"></script>
    <script type="text/javascript" src="assets/js/blockUI.js"></script>
    <style>
        body {
            background-color: white;
        }

        .content_now {
            text-align: center;
            margin-top: 70px;
        }


    </style>
    <script>


        function setBirthdayF() {
            var val = $('#ipt-rtime-hidden').val();
            var temp1 = convertDate1(val);
            console.log(temp1 + ":" + typeof temp1);
            $('#rtime').attr('value', temp1);
        }

        function convertDate1(d) {
            var date = new Date(d);
            //date_value=date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
            var date_value = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
            return date_value;
        }

        function commitData() {

            var tempData = $('#form_add').serialize();
            console.log(tempData);
            //解决serialize() 乱码
            tempData = decodeURIComponent(tempData, true);

            $.ajax({
                url: 'recruit/updateRecruit',
                type: 'POST',
                data: tempData,
                success: function (data) {
                    window.location.href = "recruit";
                    console.log('success');
                },
                error: function (data) {
                    console.log("error");
                }
            })
        }

        $(function () {
            setBirthdayF();
        });

    </script>
</head>
<body>

<div class="content_now">
    <div class="am-u-md-6">
        <form id="form_add" class="am-form am-form-horizontal">


            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="rid">招聘ID</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="rid" name="rid" type="text" value="${recruit.rid}"
                           readonly="readonly" placeholder="招聘ID" style="width: 640px">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="eid">公司ID</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="eid" name="eid" type="text" value="${recruit.eid}"
                           placeholder="输入公司ID" style="width: 640px">
                </div>
            </div>


            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="title">标题</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="title" name="title" value="${recruit.title}" type="title"
                           placeholder="标题" style="width: 640px">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="job">职位</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="job" name="job" type="text" value="${recruit.job}"
                           placeholder="职位" style="width: 640px">
                </div>
            </div>
            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="path">地址</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="path" name="path" type="text" value="${recruit.path}"
                           placeholder="地址" style="width: 640px">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="benefit">福利</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="benefit" name="benefit" type="text"
                           value="${recruit.benefit}" placeholder="福利" style="width: 640px">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="salarymin">最低工资</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="salarymin" name="salarymin" type="text"
                           value="${recruit.salarymin}" placeholder="最低工资" style="width: 640px">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="salarymin">最高工资</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="salarymax" name="salarymax" value="${recruit.salarymax}"
                           type="text" placeholder="最高工资" style="width: 640px">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0" for="qualifications">职位要求</label>
                <div class="am-u-sm-9">
                    <textarea class="am-u-md-10 form-control" rows="5"
                              name="qualifications" id="qualifications" style="width: 640px">${recruit.qualifications}</textarea>
                </div>
            </div>


            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0" for="rtime">发布日期</label>
                <div class="am-u-sm-9">
                    <input type="date" name="rtime" class="am-u-md-10" id="rtime"
                    placeholder="发布日期" style="width: 640px">
            <input type="hidden" id="ipt-rtime-hidden" value="${recruit.rtime}">
                </div>
            </div>


            <button class="am-btn am-btn-secondary" type="button" onclick="commitData()">修改</button>
        </form>
    </div>
</div>

</body>
</html>