<%--
  Created by IntelliJ IDEA.
  User: Misaki
  Date: 2018/11/15
  Time: 0:59
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
    <script src="https://cdn.bootcss.com/echarts/4.2.0-rc.2/echarts-en.common.js"></script>
    <script src="assets/js/jquery-2.1.0.js"></script>
    <style>
        #main {
            width: 600px;
            height: 400px;
        }
    </style>
</head>
<body>

<%--<div id="main"></div>--%>
<div class="am-u-md-6">
    <!-- 大数据面积图  -->
    <div class="card-box">
        <div id="pie3" style="width: 600px;height: 400px;"></div>
    </div>
</div>

<div class="am-u-md-6">
    <!-- 面积图  -->
    <div class="card-box">
        <div id="columnar" style="width: 600px;height: 400px;"></div>
    </div>
</div>

<script type="text/javascript">

    /*    // 绘制图表
        echarts.init(document.getElementById('main')).setOption({
            series: {
                type: 'pie',
                data: [
                    {name: 'A', value: 1212},
                    {name: 'B', value: 2323},
                    {name: 'C', value: 1919}
                ]
            }
        });*/

    /*----------------------柱状图-----------------------*/
    //折柱混合
    <%--  (function(){

        var columnar = echarts.init(document.getElementById("columnar"));
        var dataypes = new Array();
            columnar.setOption(option).done(function (data) {
                $.each(data,function (i,x) {
                    dataypes.push(x.intention)
                })
            });

        var option = {

            title : {
                text: "各部门男女年龄分布统计",
                x: "left"
            },

            tooltip: {
                trigger: 'axis'
            },
            toolbox: {
                feature: {
                    saveAsImage: {show: true}
                }
            },
            legend: {
                data:['男','女']
            },
            xAxis: [
                {
                    type: 'category',
                    data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '数量',
                    min: 0,
                    max: 100,
                    interval: 20,
                    axisLabel: {
                        formatter: '{value} 人'
                    }
                }],
            series: [
                {
                    name:'男',
                    type:'bar',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                },
                {
                    name:'女',
                    type:'bar',
                    data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                }/*,
                {
                    name:'平均温度',
                    type:'line',
                    yAxisIndex: 1,
                    data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3, 23.4, 23.0, 16.5, 12.0, 6.2]
                }*/
            ]
        };

        columnar4.setOption(option);
    })();
--%>


    //饼状图
    $(function () {
        var pie3 = echarts.init(document.getElementById("pie3"));
        //构造适合此方法的参数
        $.get('user/test').done(function (data) {
            //console.log(data)
            var dataType = new Array();
            $.each(data, function (i, x) {
                //console.log(i,x)
                dataType.push(x.name);
            });


            pie3.setOption({
                title: {
                    text: '用户意向职位统计',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data:dataType/* [data[0].intention, data[1].intention, data[2].intention, data[3].intention, data[4].intention]*/
                },
                series: [
                    {
                        name: '详细数据',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data:data/* [
                            {value: data[0].COUNT, name: data[0].intention},
                            {value: data[1].COUNT, name: data[1].intention},
                            {value: data[2].COUNT, name: data[2].intention},
                            {value: data[3].COUNT, name: data[3].intention},
                            {value: data[4].COUNT, name: data[4].intention}
                        ]*/,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            })
        })

    })

</script>
</body>
</html>
