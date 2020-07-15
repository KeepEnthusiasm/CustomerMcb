<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/5/25
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
<body >
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">数据统计</div>
                <div class="layui-card-body ">
                    <ul class="layui-row layui-col-space10 layui-this x-admin-carousel x-admin-backlog">
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>客户总数</h3>
                                <p>
                                    <cite id="customerCounts"></cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>公告总数</h3>
                                <p>
                                    <cite id="noticeCounts"></cite></p>
                            </a>
                        </li>
                        <li class="layui-col-md4 layui-col-xs6">
                            <a href="javascript:;" class="x-admin-backlog-body">
                                <h3>用户总数</h3>
                                <p>
                                    <cite id="userCounts"></cite></p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">新增客户
                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">日</span></div>
                <div class="layui-card-body  ">
                    <cite id="cusDayConuts" style="font-size: 30px;font-style: normal;"></cite>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">新增客户
                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">周</span></div>
                <div class="layui-card-body  ">
                    <cite id="cusWeekConuts" style="font-size: 30px;font-style: normal;"></cite>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">新增客户
                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">月</span></div>
                <div class="layui-card-body  ">
                    <cite id="cusMonthConuts" style="font-size: 30px;font-style: normal;"></cite>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md3">
            <div class="layui-card">
                <div class="layui-card-header">新增客户
                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">年</span></div>
                <div class="layui-card-body  ">
                    <cite id="cusYearConuts" style="font-size: 30px;font-style: normal;"></cite>
                </div>
            </div>
        </div>
        <div class="layui-col-sm6 layui-col-md6">
            <div id="weekCounts" style="width: 600px;height:390px;"></div>
        </div>
        <div class="layui-col-sm6 layui-col-md6">
            <div id="monthCounts" style="width: 600px;height:390px;"></div>
        </div>
        <div class="layui-col-sm6 layui-col-md12">
            <div id="yearCounts" style="width: 1200px;height:390px;"></div>
        </div>

</div>
</div>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->


<script type="text/javascript">
    var weekmyChart;
    var weekoption;
    $.ajax({
        type:"post",
        url:"selectWeekEveryDayCounts",
        success:
            function(data) {
                weekmyChart = echarts.init(document.getElementById('weekCounts'),'walden');
                weekoption = {
                    title: {
                        text: '过去一周新增统计'
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            label: {
                                backgroundColor: '#6a7985'
                            }
                        }
                    },
                    legend: {
                        data: ['普通会员', '黄金会员', '钻石会员', '至尊会员']
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: ['一', '二', '三', '四', '五', '六', '七']
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
                            name: '普通会员',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {},
                            data: [data.normalDay1, data.normalDay2, data.normalDay3, data.normalDay4, data.normalDay5, data.normalDay6, data.normalDay7]
                        },
                        {
                            name: '黄金会员',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {},
                            data: [data.goldDay1, data.goldDay2, data.goldDay3, data.goldDay4, data.goldDay5, data.goldDay6, data.goldDay7]
                        },
                        {
                            name: '钻石会员',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {},
                            data: [data.diamondDay1, data.diamondDay2, data.diamondDay3, data.diamondDay4, data.diamondDay5, data.diamondDay6, data.diamondDay7]
                        },
                        {
                            name: '至尊会员',
                            type: 'line',
                            stack: '总量',
                            areaStyle: {},
                            data: [data.topDay1, data.topDay2, data.topDay3, data.topDay4, data.topDay5, data.topDay6, data.topDay7]
                        },
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                weekmyChart.setOption(weekoption);

        }
    });
    // 基于准备好的dom，初始化echarts实例


    // 指定图表的配置项和数据

    var monthmyChart = echarts.init(document.getElementById('monthCounts'),'walden');
    var monthoption = {
        title: {
            text: '月新增统计'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['普通会员', '黄金会员', '钻石会员', '至尊会员']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['0', '6', '12', '18', '24', '30']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name: '普通会员',
                type: 'line',
                stack: '总量',
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '黄金会员',
                type: 'line',
                stack: '总量',
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '钻石会员',
                type: 'line',
                stack: '总量',
                data: [150, 232, 201, 154, 190, 330, 410]
            },
            {
                name: '至尊会员',
                type: 'line',
                stack: '总量',
                data: [320, 332, 301, 334, 390, 330, 320]
            }
        ]
    };
    monthmyChart.setOption(monthoption);
</script>
<script>
    $.ajax({
        type:"post",
        url:"selectDataCounts",
        success:
            function(data) {
                $("#customerCounts").html(data.customerCounts),
                    $("#noticeCounts").html(data.noticeCounts),
                    $("#userCounts").html(data.userCounts),
                    $("#cusDayConuts").html(data.cusDayConuts),
                    $("#cusWeekConuts").html(data.cusWeekConuts),
                    $("#cusMonthConuts").html(data.cusMonthConuts),
                    $("#cusYearConuts").html(data.cusYearConuts)
            }
    });
</script>
</body>
</html>
