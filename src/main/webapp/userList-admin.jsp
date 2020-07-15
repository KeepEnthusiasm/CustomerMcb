<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/4/2
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>layui在线调试</title>
    <link rel="stylesheet" href="lib/layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
        *{font-family:微软雅黑}
        label{font-size: 15px;}
    </style>

</head>

<body>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a><br>
</script>

<script src="lib/layui/layui.js"></script>
<script src="js/jquery.min.js"></script>
<script type="text/html" id="openStatus">
    <input lay-event="setOpenStatus" type="checkbox" name="ustate" value="{{d.uid}}" lay-skin="switch"  lay-text="启用|未启用" lay-filter="openStatus" {{ d.ustate == 1 ? 'checked' : '' }}>
</script>
<script>
    layui.use(['laydate','form', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider//滑块
            ,form = layui.form
        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
                tips: 1
            });
        });

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height:'600px'
            ,url: 'selectUserList' //数据接口
            ,response: {
                dataName: 'userList' //规定数据列表的字段名称，默认：data
            }
            ,request: {
                pageName: 'pn' //页码的参数名称，默认：page
                ,limitName: 'limit' //每页数据量的参数名，默认：limit
            }
            ,title: '用户表'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,toolbar: '#toolbarDemo'
            ,totalRow: false //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'uid', title: 'id', width:85, sort: true, fixed: 'left'}
                ,{field: 'uname', title: '用户名', width:220}
                ,{field: 'upassword', title: '密码', width: 240, sort: true, totalRow: true}
                ,{field: 'uphone', title: '联系方式', width:320, sort: true}
                ,{field:'ustate', title: '启用状态',width:120,event: 'setOpenStatus',templet: '#openStatus', unresize: true,align:'center'}
                 ,{fixed: 'right', width: 180, align:'center', toolbar: '#barDemo'}
            ]]
        });
        form.on('switch(openStatus)', function(data){
            if(data.elem.checked == true){

                $.post("changeUstate",{"id":data.value,'ustate':1},function(data){
                    if(data == "0"){
                        layer.msg('已启用',{icon:1,time: 1000});

                    }else{
                        layer.msg('操作失败');
                    }
                });
            }else {

                $.post("changeUstate",{"id":data.value,'ustate':''},function(data){
                    if(data == "0"){
                        layer.msg('已禁用',{icon:1,time: 1000});

                    }else{
                        layer.msg('操作失败');
                    }
                });

            }


        });
        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                //添加客户
                case 'add':
                    addUser();
                    break;

                //删除客户
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        var ids=layui.$.map(data,function(item){
                            return item.uid
                        }).join();
                        layer.confirm('真的删除行吗？', function(index){
                            //向服务端发送删除指令
                            $.post("deletSelectUser",{"ids":ids},function(data){
                                if(data == "0"){
                                    $(".layui-laypage-btn")[0].click();
                                    layer.msg('客户信息删除成功',{icon:1,time: 1000});

                                }else{
                                    layer.msg('客户信息删除失败');
                                }
                            });
                        });
                    }
                    break;
                case 'search':
                    var uname=$(" input[ name='select' ] ").val();

                    table.reload('demo',{
                        url:'selectByUname'
                        ,where:{uname: uname
                        }
                    });
                    break;

            };
        });
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            var uid = data.uid;
            if(layEvent === 'ustate'){

                        } else if(layEvent === 'del'){
                layer.confirm('真的删除行吗？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("deletUser",{"id":uid},function(data){
                        if(data == "0"){
                            layer.msg('用户信息删除成功',{icon:1,time: 1000});
                        }else{
                            layer.msg('用户信息删除失败');
                        }
                    });
                });
            } else if(layEvent === 'edit'){
                updateUser(uid);
            }
        });






    })

</script>
<script>
    // 编辑模态框
    function updateUser(id){
        layer.open({
            type: 1
            ,title: ['编辑信息', 'font-size:18px;']
            ,area: ['550px', '340px']
            ,content: $('#selcetForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            ,btn: ['修改', '返回']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                $.ajax({
                    type:"post",
                    url:"updateUser",
                    data:{
                        "uid":$("#uid").val()
                        ,"uname":$("#uname").val()
                        ,"upassword":$("#upassword").val()
                        ,"uphone":$("#uphone").val()
                    },
                    success:function(data) {
                        if(data == "0"){
                            layer.msg("用户更新成功！",{icon:1,time: 1000});

                        }else{
                            layer.msg("用户更新失败！",{time: 1000});
                        }
                    }
                });
            }
            ,btn2: function(index, layero){
                $(".layui-laypage-btn")[0].click();
                location.reload();
            }
        });
            $.ajax({
                type:"get",
                url:"selectUserById",
                data:{"id":id},
                success:function(data) {
                    $("#uid").val(data.uid);
                    $("#uname").val(data.uname);
                    $("#upassword").val(data.upassword);
                    $("#uphone").val(data.uphone);
            }});
        }

    function addUser() {
        layer.open({
            type: 1
            ,title: ['添加用户', 'font-size:18px;']
            ,area: ['550px', '340px']
            ,content: $('#selcetForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            ,btn: ['添加', '返回']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                $.ajax({
                    type:"post",
                    url:"addUser",
                    data:{
                        "uid":$("#uid").val()
                        ,"uname":$("#uname").val()
                        ,"upassword":$("#upassword").val()
                        ,"uphone":$("#uphone").val()
                        ,"ustate": 1
                    },
                    success:function(data) {
                        if(data == "0"){
                            $(".layui-laypage-btn")[0].click();
                            layer.msg("用户添加成功！",{icon:1,time: 1000});
                        }else{
                            layer.msg("用户添加失败！",{time: 1000});
                        }
                    }
                });
            }
            ,btn2: function(index, layero){
                window.location.reload();
            }
        });
    }
</script>
<script>

</script>
</body>
</html>

<form id="selcetForm"  hidden="hidden" class="layui-form layui-col-md-offset1" style="margin-top: 1.25rem;margin-right: 20px;width: 400px;">
    <input type="hidden" id="uid" name="uid" value="1">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input id="uname" type="text" placeholder="请输入用户名"  name="uname" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input id="upassword" type="text" placeholder="请输入密码"  name="upassword" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" >联系方式</label>
        <div class="layui-input-block">
            <input id="uphone" type="text" placeholder="请输入手机号"  name="uphone" class="layui-input"/>
        </div>
    </div>
</form>

<div id="toolbarDemo" hidden="hidden">
    <form class="layui-form layui-col-space5">
        <div class="layui-inline layui-show-xs-block">
            <button type="button" class="layui-btn layui-btn-normal layui-btn-sm " lay-event="add">
                <i class="layui-icon">&#xe654;</i>
                添加
            </button>
        </div>
        <div class="layui-inline layui-show-xs-block">
            <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delete">
                <i class="layui-icon">&#xe640;</i>
                批量删除
            </button>
        </div>
        <div class="layui-inline layui-show-xs-block">
            <input type="text"  name="select" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-inline layui-show-xs-block">
            <button type="button" class="layui-btn layui-btn layui-btn-sm" lay-event="search">
                <i class="layui-icon">&#xe615;</i>
                查询
            </button>
        </div>
    </form>
</div>