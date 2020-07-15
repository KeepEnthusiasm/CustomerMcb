<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/5/25
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"   isELIgnored="false" %>
<script src="lib/layui/layui.js"></script>
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-body ">
            <blockquote class="layui-elem-quote">欢迎用户:${sessionScope.uname}！当前时间:<span id="time"></span>
            </blockquote>
        </div>
    </div>
</div>
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-header">系统信息</div>
        <div class="layui-card-body ">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>客户信息管理系统版本</th>
                    <td>V1.0.0</td></tr>
                <tr>
                    <th>联系管理员</th>
                    <td>手机：15090227317</td></tr>
                <tr>
                    <th>服务器地址</th>
                    <td>http://localhost:8080/cus_sys_mcb_war/login.jsp</td></tr>
                <tr>
                    <th>操作系统</th>
                    <td>windows10</td></tr>
                <tr>
                    <th>运行环境</th>
                    <td>Apache Tomcat 8.5.45</td></tr>
                <tr>
                    <th>Java版本</th>
                    <td>JDK8</td></tr>
                <tr>
                    <th>MySQL版本</th>
                    <td>5.5.53</td></tr>
                <tr>
                    <th>IntelliJIdea</th>
                    <td>2019.1</td></tr>
                <tr>
                    <th>上传附件限制</th>
                    <td>10M</td></tr>
                <tr>
                    <th>导出数据量限制</th>
                    <td>小于10000条</td></tr>
                <tr>
                    <th>执行时间限制</th>
                    <td>30s</td></tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="layui-col-md12">
    <div class="layui-card">
        <div class="layui-card-header">开发团队</div>
        <div class="layui-card-body ">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>版权所有</th>
                    <td>马常彪
                </tr>
                <tr>
                    <th>开发者</th>
                    <td>马常彪</td></tr>
                <tr>
                    <th>GitHub</th>
                    <td><a>https://github.com/KeepEnthusiasm</a></td></tr>
                <tr>
                    <th>联系作者</th>
                    <td>邮箱：15090227317@163.com</td></tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
    setInterval(function() {
        function getNow(s) {
            return s < 10 ? '0' + s: s;
        }
        var myDate = new Date();
        var year=myDate.getFullYear();        //获取当前年
        var month=myDate.getMonth()+1;   //获取当前月
        var date=myDate.getDate();            //获取当前日
        var h=myDate.getHours();              //获取当前小时数(0-23)
        var m=myDate.getMinutes();          //获取当前分钟数(0-59)
        var s=myDate.getSeconds();
        var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);
        $("#time").html(now);
    }, 1000);
</script>
</html>
