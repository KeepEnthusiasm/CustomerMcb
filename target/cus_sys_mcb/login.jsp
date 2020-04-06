<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/2/3
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="lib/layui/css/layui.css">
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <title>登录</title>
    <script>
        <!-- 点击图片更换验证码 -->
        window.onload=function () {
            document.getElementById("img").onclick=function(){
                this.src="checkCode?time="+new Date().getTime();
            }
        };
    </script>
</head>
<body class="login-bg">
<div class="login layui-anim layui-anim-up">
    <div class="message">H公司客户信息管理系统登录</div>
    <div id="darkbannerwrap"></div>
    <form id="loginForm"   method="post" >
        <input id="username" name="uname" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input id="password" name="upassword" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input id="checkCode" name="checkCode" placeholder="验证码"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <table>
        <tr>
            <td width="195px">
                <label  style="font-size: 14px;"><input type="radio" name="user" value="user" checked>用户&nbsp&nbsp&nbsp</label>
                <label style="font-size: 14px;"><input type="radio" name="user" value="admin" >管理员</label>
            </td>
        <td >
            <img class="col-md-offset-9" src="checkCode" id="img"></td>
        </tr>
        </table>
        <hr class="hr15">

        <button onclick="login()" style="width:100%;font-size: 16px;" type="button">登录</button>
        <hr class="hr20" >
        <button id="addBtn" style="width:100%;font-size: 16px;"  data-toggle="modal" onclick="regModel()" type="button">注册</button>
        <hr class="hr20" >
    </form>
</div>
</body>

<script type="text/javascript">
    layui.use([ 'layer'], function(){
        var layer = layui.layer})
</script>
<script type="text/javascript" >
    function regModel() {
        layer.open({
            type: 1
            ,title: ['注册', 'font-size:18px;']
            ,area: ['550px', '340px']
            ,content: $('#resForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            ,btn: ['提交', '返回']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
             regUser();
            }
            ,btn2: function(index, layero){
                window.location.reload();
            }
        });
        $("#rusername").blur(checkUser);
        function checkUser() {
            $.ajax({
                url: "checkUser",
                data: {"resername": $("#rusername").val()},
                success: function (data) {
                    if (data =='0') {
                        $("#resLabel").css({color:"red"})
                        $("#resLabel").html("已使用");
                    }else {
                        $("#resLabel").css({color:"green"})
                        $("#resLabel").text("未使用")
                    }
                }
            });
        }

    }
    function regUser() {
        if ($("#rusername").val()=='') {
            layer.msg("用户名为空，请输入用户名！",{icon:1,time: 1000});
            return;
        }else {
            if ($("#rpassword").val()==''){
                layer.msg("密码为空，请输入密码!",{icon:1,time: 1000});
                return;
            }else{
                if ($("#rphone").val()==''){
                    layer.msg("手机号为空，请输入手机号!",{icon:1,time: 1000});
                    return;
                }else if( $("#resLabel").html()=="已使用"){
                    layer.msg("用户名重复，请重新输入!",{icon:1,time: 1000});
                    return;
                }
                else {
                    $.post("reg",$("#resForm").serialize(),function(data){
                        if(data == "0"){
                            layer.msg("用户注册成功！即将返回登录!",{icon:1,time: 1000});
                            setTimeout( function(){
                                window.location.href="login.jsp";
                            }, 2* 1000 );
                        }else{
                            layer.msg("用户注册失败！!",{icon:1,time: 1000});
                        }
                    });
                }
            }
        }
    }
    function login() {
        if ($("#username").val()=="") {
            layer.msg("用户名为空，请输入用户名！",{icon:1,time: 1000});
        }else {
            if ($("#password").val()==""){
                layer.msg("密码为空，请输入密码!",{icon:1,time: 1000});
            }else{
                if ($("#checkCode").val()==""){
                    layer.msg("验证码为空，请输入验证码!",{icon:1,time: 1000});
                }else {
                    if ($(":radio:checked").val()=='user') {
                        $.post("userLogin",$("#loginForm").serialize(),function(data){
                            if(data == "1"){
                                layer.msg("登录成功！",{icon:1,time: 2000});
                                setTimeout( function(){
                                    window.location.href="system-user.jsp";
                                }, 2* 1000 );
                            }else{
                                if(data == "2"){
                                    layer.msg("用户名或密码错误，请重新输入!",{icon:1,time: 2000});
                                    setTimeout( function(){
                                        window.location.reload()
                                    }, 2* 1000 );
                                }else if(data == "3") {
                                    layer.msg("您的账号未启用，请联系管理员启用!",{icon:1,time: 2000});
                                }else {
                                    layer.msg("验证码错误，请重新输入验证码!",{icon:1,time: 2000});
                                    setTimeout( function(){
                                        window.location.reload()
                                    }, 2* 1000 );
                                }                                }
                        });
                    }else {
                        $.ajax({
                            type:"post",
                            url:"adminLogin",
                            data:{
                                "aname":$("#username").val()
                                ,"apassword":$("#password").val()
                                ,"checkCode":$("#checkCode").val()
                            },
                            success:function(data) {
                                if(data == "1"){
                                    layer.msg("登录成功！",{icon:1,time: 2000});
                                    setTimeout( function(){
                                        window.location.href="system-admin.jsp";
                                    }, 2* 1000 );
                                }else{
                                    if(data == "2"){
                                        layer.msg("用户名或密码错误，请重新输入!",{icon:1,time: 2000});
                                        setTimeout( function(){
                                            window.location.reload()
                                        }, 2* 1000 );
                                    }else {
                                        layer.msg("验证码错误，请重新输入验证码!",{icon:1,time: 2000});
                                        setTimeout( function(){
                                            window.location.reload()
                                        }, 2* 1000 );
                                    }
                                }
                            }
                        });
                    }
                }
            }
        }
    }

</script>
</html>

<form id="resForm"  hidden="hidden" class="layui-form layui-col-md-offset1" style= " font-family: 微软雅黑;font-size: 15px; margin-top: 1.25rem;">
    <input type="hidden" id="ustate" name="ustate" value="1">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input style="width:255px;margin-left: 30px" id="rusername" type="text" placeholder="请输入用户名"  name="uname" class="layui-input"/>
        </div>
        <label id="resLabel" style="float: left; margin-left: 100px; margin-top: 5px;" ></label>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input style="width:255px;" id="rpassword" type="text" placeholder="请输入密码"  name="upassword" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 100px" >联系方式</label>
        <div class="layui-input-block">
            <input style="width:255px;" id="rphone" type="text" placeholder="请输入手机号"  name="uphone" class="layui-input"/>
        </div>
    </div>
</form>