<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/5/25
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="lib/layui/layui.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/echarts.min.js"></script>
<script src="js/walden.js"></script>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<link rel="stylesheet" href="css/xadmin.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-sm6 layui-col-md6">
            <div id="clevelCouns" style="width: 600px;height:350px;"></div>
        </div>
        <div class="layui-col-sm6 layui-col-md6">
            <div id="cgenderCouns" style="width: 600px;height:350px;"></div>
        </div>
        <div class="layui-col-sm6 layui-col-md6 col-md-offset-6">
            <div id="cageCouns" style="width: 1000px;height:300px;"></div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var cgenderoption;
    var cgenderChart
    $(function(){
        //性别饼状图
        $.ajax({
        type:"post",
        url:"selectCgenderCounts",
        success:
            function(data) {
                cgenderChart = echarts.init(document.getElementById('cgenderCouns'),'walden');
                cgenderoption  = {
                    title: {
                        text: '性别占比',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{a} <br/>{b} : {c} ({d}%)'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['女', '男']
                    },
                    series: [
                        {
                            name: '性别',
                            type: 'pie',
                            radius: '55%',
                            center: ['50%', '60%'],
                            data: [
                                {value: data.woman , name: '女'},
                                {value: data.man , name: '男'}

                            ],
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };
                cgenderChart.setOption(cgenderoption);
            }
         });
        //会员类型饼状图
        var clevelChart;
         var cleveloption;
        $.ajax({
            type:"post",
            url:"selectClevelCounts",
            success:
                function(data) {
                    clevelChart = echarts.init(document.getElementById('clevelCouns'), 'walden');
                     cleveloption  = {
                        title: {
                            text: '会员类型',
                            left: 'center'
                        },
                        tooltip: {
                            trigger: 'item',
                            formatter: '{a} <br/>{b} : {c} ({d}%)'
                        },
                        legend: {
                            orient: 'vertical',
                            left: 'left',
                            data: ['普通会员', '黄金会员', '钻石会员', '至尊会员']
                        },
                        series: [
                            {
                                name: '会员类型',
                                type: 'pie',
                                radius: '55%',
                                center: ['50%', '60%'],
                                data: [
                                    {value: data.黄金会员 , name: '普通会员'},
                                    {value: data.黄金会员, name: '黄金会员'},
                                    {value: data.钻石会员, name: '钻石会员'},
                                    {value: data.至尊会员, name: '至尊会员'}
                                ],
                                emphasis: {
                                    itemStyle: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    };
                    clevelChart.setOption(cleveloption);
                }
        });
    });
    // -----------------------饼图---------------

    var cageChart = echarts.init(document.getElementById('cageCouns'), 'walden');
    cageoption = {
        title: {
            text: '年龄趋势',
            left: 'center'
        },
        xAxis: {
            type: 'category',
            data: ['20-25', '25-30', '30-35', '35-40', '40-45', '45-50', '50以上']
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [20, 50, 150, 30, 50, 20, 10],
            type: 'bar'
        }]
    };
    cageChart.setOption(cageoption);
</script>
</html>
