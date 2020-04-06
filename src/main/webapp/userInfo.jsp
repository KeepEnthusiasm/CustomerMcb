<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/4/3
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<script src="lib/layui/layui.js"></script>
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    window.onload=function () {
        var username='${sessionScope.uname}';
        $.ajax({
                type:"post",
                url:"selectUser",
                data:{
                "uname": username
            },
            success:function(data) {
            $("#uname").val(username)
            ,$("#uphone").val(data.uphone)
        }
    } )
    }
</script>
<form id="selcetForm"  class="layui-form layui-col-md-offset1" style="margin-top: 1.25rem;margin-right: 20px;width: 400px;" >
    <input type="hidden" id="uid" name="uid" value="1">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input id="uname" readonly="readonly"  type="text" name="uname" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" >联系方式</label>
        <div class="layui-input-block">
            <input id="uphone" type="text"   readonly="readonly"` name="uphone" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-sm" onclick="updateInfo()">
                <i class="layui-icon">&#xe642;</i>
                编辑
            </button>
        </div>
    </div>
</form>
</body>
<script type="text/javascript">
    layui.use([ 'layer'], function(){
        var layer = layui.layer})
</script>
<script type="text/javascript">
    var uname='${sessionScope.uname}';
        function updateInfo(){

            layer.open({
                type: 1
                ,title: ['输入密码', 'font-size:18px;']
                ,area: ['550px', '340px']
                ,content: $('#password') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                ,btn: ['提交', '返回']
                ,yes: function(index, layero){
                    //按钮【按钮一】的回调
                    $.ajax({
                        type:"post",
                        url:"password",
                        data:{
                            "uname":uname
                            ,"upassword":$("#upassword").val()
                        },
                        success:function(data) {
                            if(data == "0"){
                                layer.msg("密码正确！请修改信息",{icon:1,time: 1000});
                                setTimeout( function(){
                                    layer.close(index);
                                    updatePassword();
                                }, 2* 1000 );
                            }else{
                                layer.msg("密码错误！请重新输入",{time: 1000});
                            }
                        }
                    });
                }
                ,btn2: function(index, layero){
                    layer.close(index);
                }
            });
            $("#username").val(uname)
        }
    function updatePassword(){
        layer.open({
            type: 1
            ,title: ['修改密码', 'font-size:18px;']
            ,area: ['550px', '340px']
            ,content: $('#updatePassword') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            ,btn: ['修改', '返回']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                $.ajax({
                    type:"post",
                    url:"updateMyUser",
                    data:{
                        "uname":uname
                        ,"upassword":$("#user_password").val()
                        ,"uphone":$("#user_phone").val()
                    },
                    success:function(data) {
                        if(data == "0"){
                            layer.msg("修改成功！",{icon:1,time: 1000});

                        }else{
                            layer.msg("修改失败！",{time: 1000});
                        }
                    }
                });
            }
            ,btn2: function(index, layero){
                window.location.reload();
            }
        });
        $.ajax({
            type:"post",
            url:"selectUser",
            data:{
                "uname":uname
            },
            success:function(data) {
                $("#user_name").val(uname)
                ,$("#user_password").val(data.upassword)
                ,$("#user_phone").val(data.uphone)
            }
        } )
    }
</script>
</html>
<form id="password" hidden="hidden"  class="layui-form layui-col-md-offset1" style="margin-top: 1.25rem;margin-right: 20px;width: 400px;">
    <input type="hidden" id="uid" name="uid" value="1">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input id="username" readonly="readonly"  type="text" name="username" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input id="upassword" type="text" name="upassword" class="layui-input"/>
        </div>
    </div>
</form>
<form id="updatePassword" hidden="hidden"  class="layui-form layui-col-md-offset1" style="margin-top: 1.25rem;margin-right: 20px;width: 400px;">
    <input type="hidden" id="uid" name="uid" value="1">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input id="user_name" readonly="readonly"  type="text" name="username" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input id="user_password" type="text" placeholder="请输入密码" name="upassword" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系方式</label>
        <div class="layui-input-block">
            <input id="user_phone" type="text" name="uphone" placeholder="请输入手机号" class="layui-input"/>
        </div>
    </div>
</form>