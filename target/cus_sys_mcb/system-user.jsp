<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/4/3
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>H公司客户信息管理系统</title>
    <link rel="stylesheet" href="lib/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">H公司客户信息管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">首页</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.uname}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="login.jsp">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a  href="javascript:Iframe('list.jsp');">客户信息</a>
                </li>
                <li class="layui-nav-item" >
                    <a href="javascript:Iframe('noticeList-user.jsp');" >公司公告</a>
                </li>
                <li class="layui-nav-item"><a href="javascript:Iframe('userInfo.jsp');">我的信息</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <iframe id="myIframe" src='list.jsp' width="100%" height="650px" frameborder="0" scrolling="no" ></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script src="lib/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element','layer', function(){
        var element = layui.element;
        var layer = layui.layer;

    });
    function Iframe(src) {
        // $("#myIframe").attr("src","noticeList-admin.jsp");
        document.getElementById("myIframe").src=src;
    }
</script>
</body>
</html>