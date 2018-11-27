<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Misaki
  Date: 2018/11/12
  Time: 12:59
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- <%@ include file="../common/common.jsp" %> --%>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<html>
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

        img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            position: absolute;
            top: -58px;
            left: 170px;
            display: inline-block;
            border: none;
        }

    </style>
    <script>
        function imgPreview(fileDom) {
            //判断是否支持FileReader
            if (window.FileReader) {
                var reader = new FileReader();
            } else {
                alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
            }
            //获取文件
            var file = fileDom.files[0];
            var imageType = /^image\//;
            //是否是图片
            if (!imageType.test(file.type)) {
                alert("请选择图片！");
                return;
            }
            //读取完成
            reader.onload = function (e) {
                //获取图片dom
                var img = document.getElementById("preview");
                //图片路径设置为读取的图片
                img.src = e.target.result;
            };
            reader.readAsDataURL(file);


            //console.log(tempData);


        }

        function commitData() {
            var val = $('#doc-ta-1').val();

            var tempData = $('#form_add').serialize();
            tempData += "&uabstract=" + val;
            //解决serialize() 乱码
            tempData = decodeURIComponent(tempData, true);
            console.log(tempData);
            var arry_now = now_spilt(tempData);
            console.log(tempData);
            var formData = new FormData();
            var file_jq = $('#input_file')[0].files[0];
            if (file_jq != null) {
                formData.append('file', $('#input_file')[0].files[0]);  //添加图片信息的参数
            }
            for (var i = 0; i < arry_now.length; i++) {
                var detailData = arry_now[i].split("=");
                console.log(detailData);
                formData.append(detailData[0], detailData[1]);
            }
            console.log(formData);

            $.ajax({
                url: 'user/update',
                type: 'POST',
                cache: false, //上传文件不需要缓存
                data: formData,
                processData: false, // 告诉jQuery不要去处理发送的数据
                contentType: false, // 告诉jQuery不要去设置Content-Type请求头
                success: function (data) {
                    /*var rs = eval("("+data+")");
                    if(rs.state==1){
                        tipTopShow('上传成功！');
                    }else{
                        tipTopShow(rs.msg);
                    }*/
                    window.location.href = "user";
                    console.log('success');
                },
                error: function (data) {
                    tipTopShow("上传失败");
                }
            })
        }

        function now_spilt(str) {
            var arry = str.split("&");
            return arry;
        }

        function convertDate1(d) {
            var date = new Date(d);
            //date_value=date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
            var date_value = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
            return date_value;
        }

        $(function () {
            setBirthdayF();
            setOptionF('doc-select-1','ipt-sex');
            setOptionF('doc-select-123','ipt-intention');
        });

        function setBirthdayF() {
            var val = $('#doc-ipt-birthday-hide').val();
            var temp1 = convertDate1(val);
            //console.log(temp1 + ":" + typeof temp1);
            $('#doc-ipt-birthday').attr('value', temp1);
        }

        function setOptionF(id1, id2) {
            var temp1 = '#' + id1;
            var temp2 = '#' + id2;
            var val = $(temp2).val();
            var jq = $(temp1);
            //console.log(jq);
            var jq1 = jq[0].children;
            //console.log(jq1);
            for (var i = 0; i < jq1.length; i++) {
                var value = $(jq1[i]).val();
                if (val == value) {
                    $(jq1[i]).attr('selected', 'selected');
                }
            }
        }

    </script>
</head>
<body>

<div class="content_now">
    <div class="am-u-md-6">
        <form id="form_add" class="am-form am-form-horizontal">
          
                <%--<div class="am-u-sm-9">--%>
                    <%--<!--<img id="preview" />-->--%>
                    <%--<!-- <input type="text" id="imgfield" class="txt" placeholder="预览">-->--%>
                    <%--<label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"--%>
                           <%--for="input_file">头像</label>--%>
                    <%--<img id="preview" src="${users.uimage}"/>--%>
                    <%--<input type="file" name="uImage" id="input_file"--%>
                           <%--accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" onchange="imgPreview(this)">--%>
                <%--</div>--%>
            
            <img id="preview" src="${users.uimage}"/>
            <div class="am-form-group">
                <!--<img id="preview" />-->
                <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                       for="input_file" style="padding-top: 1.6px">头像</label>
                <div class="am-u-sm-9">
                    <!--<img id="preview" />-->
                    <!-- <input type="text" id="imgfield" class="txt" placeholder="预览">-->
                    <input type="file" name="uImage" id="input_file"
                           accept="image/gif,image/jpeg,image/jpg,image/png,image/svg" onchange="imgPreview(this)">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="uname">用户编号</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="uid" name="uid" value="${users.uid}" type="text" readonly="readonly" width="70%">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="uname">管理员编号</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="aid" name="aid" value="${users.aid}" type="text"
                          >
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0"
                           for="uname">姓名</label>
                <div class="am-u-sm-9">
                    <input class="am-u-md-10 form-control" id="uname" name="uname" value="${users.uname}" type="text"
                           placeholder="输入姓名" >
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0" for="doc-select-1">性别</label>
                <div class="am-u-sm-9">
                    <input type="hidden" value="${users.sex}" id="ipt-sex">
                    <select id="doc-select-1" name="sex">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                    <span class="am-form-caret"></span>
                </div>
            </div>


            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0" for="doc-select-1">意向职位</label>
                <div class="am-u-sm-9">
                    <input type="hidden" value="${users.intention}" id="ipt-intention">
                    <select id="doc-select-123" name="intention" >
                        <option value="ui设计师">ui设计师</option>
                        <option value="java工程师">java工程师</option>
                        <option value="前端工程师">前端工程师</option>
                        <option value="交互设计师">交互设计师</option>
                        <option value="算法专家">算法专家</option>
                        <option value="产品经理">产品经理</option>
                        <option value="运维/测试">运维/测试</option>
                        <option value="资深数据开发工程师">资深数据开发工程师</option>
                        <option value="视觉设计师">视觉设计师</option>
                    </select>
                    <span class="am-form-caret"></span>
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0" for="doc-ipt-pwd-1">生日</label>
                <div class="am-u-sm-9">
                    <input type="date" name="birthday" class="am-u-md-10" id="doc-ipt-birthday" placeholder="选择生日"
                           >
                    <input type="hidden" value="${users.birthday}" id="doc-ipt-birthday-hide">
                </div>
            </div>

            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0" for="doc-ipt-pwd-1">密码</label>
                <div class="am-u-sm-9">
                    <input type="password" name="upassword" class="am-u-md-10" id="doc-ipt-pwd-1"
                           value="${users.upassword}" placeholder="设置个密码吧">
                </div>
            </div>


            <div class="am-form-group">
                    <label class="am-u-sm-3 am-form-label am-text-right am-padding-right-0" for="doc-ta-1">描述</label>
                <div class="am-u-sm-9">
                    <textarea class="am-u-md-10 form-control" rows="5" id="doc-ta-1">${users.uabstract}</textarea>
                </div>
            </div>

            <button class="am-btn am-btn-secondary" type="button" onclick="commitData()">修改</button>
        </form>
    </div>
</div>

</body>
</html>