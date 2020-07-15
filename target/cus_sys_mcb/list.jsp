<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/2/9
  Time: 15:31
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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
        *{font-family:微软雅黑}
        label{font-size: 15px;}
        .layui-inline  input,select{width: 120px!important;}
        .layui-inline  .layui-form-label{width: 90px!important;}
    </style>

</head>

<body>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a><br>
</script>
<script type="text/html" id="toolbarDemo">
    <div>
        <form id="selectByCondition" class="layui-form" >
            <div class="layui-row ">
                <div class="layui-inline">
                    <label class="layui-form-label" >姓名</label>
                    <div class="layui-inline " >
                        <input type="text" id="selectCname" placeholder="请输入姓名"   name="cname"  autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label" >年龄</label>
                    <div class="layui-inline " >
                        <input type="text" id="selectCage" placeholder="请输入年龄" name="cage"  autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label" >性别</label>
                    <div class="layui-inline " >
                        <select id="selectCgender"  name="cgender" lay-verify="required" >
                            <option value="">请选择性别</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label" >创建日期</label>
                    <div class="layui-input-inline" >
                        <input type="text" id="selectCcreattimeBegin" placeholder="请输入起始日期"  autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <label>-</label>
                    </div>
                    <div class="layui-input-inline" >
                        <input type="text" id="selectCcreattimeEnd" placeholder="请输入结束日期" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-row">
            <div class="layui-inline ">
                <label class="layui-form-label"  >级别</label>
                <div class="layui-inline" >
                    <select id="selectClevel"  name="clevel" lay-verify="required" >
                        <option value="">请选择级别</option>
                        <option value="普通会员">普通会员</option>
                        <option value="黄金会员">黄金会员</option>
                        <option value="钻石会员">钻石会员</option>
                        <option value="至尊会员">至尊会员</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地址</label>
                <div class="layui-inline ">
                    <input type="text" id="selectCaddress" placeholder="请输入地址"  name="caddress"  autocomplete="off" class="layui-input">
                </div>
            </div>  <div class="layui-inline">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-inline ">
                    <input type="text" id="selectCemail" name="cemail" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline ">
                <label class="layui-form-label"  >联系方式</label>
                <div class="layui-inline " >
                    <input type="text" id="selectCphone"   name="cphone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline layui-show-xs-block">
                <div class="layui-inline " >
                    <button type="button" class="layui-btn layui-btn layui-btn-sm" lay-event="search" style="margin-left:13px ">
                        <i class="layui-icon">&#xe615;</i>
                        查询
                    </button>
                </div>
            </div>
            <div class="layui-inline layui-show-xs-block">
                <div class="layui-inline " >
                    <button type="reset" class="layui-btn layui-btn-primary layui-btn-sm" style="width: 47px;" >
                        <i class="layui-icon">&#xe639;</i>
                    </button>
                </div>
            </div>
            </div>
            <div class="layui-inline layui-show-xs-block">
                <button type="button" class="layui-btn layui-btn layui-btn-sm " onclick="location.reload();">
                    <i class="layui-icon">&#xe669;</i>
                    刷新
                </button>
            </div>
            <div class="layui-inline layui-show-xs-block">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm " lay-event="add">
                    <i class="layui-icon">&#xe654;</i>
                    添加
                </button>
            </div>
            <div class="layui-inline layui-show-xs-block">
                <button type="button" class="layui-btn layui-btn-sm" lay-event="update">
                    <i class="layui-icon">&#xe642;</i>
                    编辑
                </button>
            </div>
            <div class="layui-inline layui-show-xs-block">
                <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delete">
                    <i class="layui-icon">&#xe640;</i>
                    批量删除
                </button>
            </div>
            <div class="layui-inline layui-show-xs-block">
                <button id="upload" type="button" class="layui-btn layui-btn layui-btn-sm" >
                    <i class="layui-icon">&#xe67d;</i>
                    导入数据
                </button>
            </div>
        </form>
    </div>
</script>
<script src="lib/layui/layui.js"></script>
<script src="js/jquery.min.js"></script>
<script>
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','form'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider//滑块
            ,form=layui.form

        //执行一个 table 实例
        var tableIns=table.render({
            elem: '#demo'
            ,height:'630px'
            ,url: 'selectListForLayui' //数据接口
            ,response: {
                dataName: 'customerList' //规定数据列表的字段名称，默认：data
            }
            ,request: {
                pageName: 'pn' //页码的参数名称，默认：page
                ,limitName: 'limit', //每页数据量的参数名，默认：limit
            }
            ,title: '用户表'
            ,text: {
                none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
            }
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,toolbar: '#toolbarDemo'
            ,totalRow: false //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'cid', title: 'ID', width:60, sort: true, fixed: 'left'}
                ,{field: 'cname', title: '姓名', width:75}
                ,{field: 'cage', title: '年龄', width: 75, sort: true, totalRow: true}
                ,{field: 'cgender', title: '性别', width:80, sort: true}
                ,{field: 'clevel', title: '级别', width: 90, sort: true, totalRow: true}
                ,{field: 'caddress', title: '地址', width:120}
                ,{field: 'cphone', title: '手机号', width: 130}
                ,{field: 'cemail', title: '邮箱', width: 160}
                ,{field: 'ccreattime', title: '创建日期', width: 110}
                ,{field: 'cbirthday', title: '出生日期', width: 110}
                ,{fixed: 'right', width: 120, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                //添加客户
                case 'add':
                    addModal();
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        var id= checkStatus.data[0].cid;
                        updateModal();
                        editCustomer(id)
                    }
                    break;
                    //删除客户
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                       var ids=layui.$.map(data,function(item){
                            return item.cid
                        }).join();
                        layer.confirm('真的删除行吗？', function(index){
                            //向服务端发送删除指令
                            $.post("deletSelectCustomer",{"ids":ids},function(data){
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
                    var cname=$("#selectCname").val(),
                    cage=$("#selectCage").val(),
                        cgender=$("#selectCgender").val(),
                        clevel=$("#selectClevel").val(),
                        caddress=$("#selectCaddress").val(),
                        cphone=$("#selectCphone").val(),
                        ccreattimeBegin=$("#selectCcreattimeBegin").val(),
                        ccreattimeEnd=$("#selectCcreattimeEnd").val(),
                        cemail=$("#selectCemail").val()
                    tableIns.reload({
                         url: 'selectByConditionForNew'
                        ,where: {
                            cname:cname,
                            cage:cage,
                            cgender:cgender,
                            clevel:clevel,
                            caddress:caddress,
                            cphone:cphone,
                            ccreattimeBegin:ccreattimeBegin,
                            ccreattimeEnd:ccreattimeEnd,
                            cemail:cemail
                          }
                    });
                    $("#selectCname").val(cname);
                    $("#selectCage").val(cage);
                    $("#selectClevel").val(clevel);
                    $("#selectCaddress").val(caddress);
                    $("#selectCphone").val(cphone);
                    $("#selectCcreattimeBegin").val(ccreattimeBegin);
                    $("#selectCcreattimeEnd").val(ccreattimeEnd);
                    $("#selectCemail").val(cemail);
                    $("#selectCgender").val(cgender);

                    laydate.render({
                        elem: '#selectCcreattimeBegin'
                        ,position: 'fixed'
                        ,trigger: 'click'
                        ,calendar: true //是否开启公历重要节日
                        ,done: function(value, date, endDate){
                            $("#selectCcreattimeBegin").attr("value",value);
                        }
                    });
                    laydate.render({
                        elem: '#selectCcreattimeEnd'
                        ,position: 'fixed'
                        ,trigger: 'click'
                        ,calendar: true //是否开启公历重要节日
                        ,done: function(value, date, endDate){
                            $("#selectCcreattimeEnd").attr("value",value);
                        }
                    });
                    break;
            };
        });



        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            var cid = data.cid;
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行吗？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("deletCustomer",{"id":cid},function(data){
                        if(data == "0"){
                            layer.msg('客户信息删除成功',{icon:1,time: 1000});
                        }else{
                            layer.msg('客户信息删除失败');
                        }
                    });
                });
            } else if(layEvent === 'edit'){
                editCustomer(cid);
                updateModal();

            }
        });
        //将日期直接嵌套在指定容器中
        laydate.render({
            elem: '#cusCreattime'
            ,position: 'fixed'
            ,trigger: 'click'
            ,calendar: true //是否开启公历重要节日
            ,done: function(value, date, endDate){
                $("#cusCreattime").attr("value",value);
            }
        });
        laydate.render({
            elem: '#cusBirthday'
            ,position: 'fixed'
            ,trigger: 'click'
            ,calendar: true //是否开启公历重要节日
            ,done: function(value, date, endDate){
                $("#cusBirthday").attr("value",value);
            }
        });
        laydate.render({
            elem: '#selectCcreattimeBegin'
            ,position: 'fixed'
            ,trigger: 'click'
            ,calendar: true //是否开启公历重要节日
            ,done: function(value, date, endDate){
                $("#selectCcreattimeBegin").attr("value",value);
            }
        });
        laydate.render({
            elem: '#selectCcreattimeEnd'
            ,position: 'fixed'
            ,trigger: 'click'
            ,calendar: true //是否开启公历重要节日
            ,done: function(value, date, endDate){
                $("#selectCcreattimeEnd").attr("value",value);
            }
        });

        //分页
        laypage.render({
            elem: 'pageDemo' //分页容器的id
            ,count: 100 //总页数
            ,skin: '#1E9FFF' //自定义选中色值
            //,skip: true //开启跳页
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第'+ obj.curr +'页', {offset: 'b'});
                }
            }
        })
        upload.render({
            elem: '#upload'
            ,url: 'importExcel' //改成您自己的上传接口
            ,accept: 'file' //普通文件
            ,done: function(res){
                layer.msg('上传成功');
                console.log(res)
            }
        });

        //弹出编辑模态框
        function updateModal() {
            layer.open({
                type: 1
                ,title: ['编辑信息', 'font-size:18px;']
                ,area: ['550px', '620px']
                ,content: $('#updateForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                ,btn: ['修改', '返回']
                ,yes: function(index, layero){
                    //按钮【按钮一】的回调
                    updateCustomer()
                }
                ,btn2: function(index, layero){
                    $(".layui-laypage-btn")[0].click();
                    $('#updateForm')[0].reset();
                }
            });
        }
        //弹出添加模态框
        function addModal() {
            layer.open({
                type: 1
                ,title: ['添加信息', 'font-size:18px;']
                ,area: ['550px', '620px']
                ,content: $('#updateForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                ,btn: ['添加', '返回']
                ,yes: function(index, layero){
                    //按钮【按钮一】的回调
                    addCustomer();
                }
                ,btn2: function(index, layero){
                    window.location.reload();
                }
            });

        }
        //回显信息
        function editCustomer(id) {
            $.ajax({
                type:"get",
                url:"updateCustomer",
                data:{"id":id},
                success:function(data) {
                    form.val("updateForm", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                        "cid":data.cid
                        ,"cname": data.cname // "name": "value"
                        ,"cage": data.cage
                        ,"cgender": data.cgender
                        ,"caddress":data.caddress
                        ,"cphone":data.cphone
                        ,"cemail":data.cemail
                        ,"ccreattime":data.ccreattime
                        ,"cbirthday":data.cbirthday
                        ,"clevel":data.clevel
                    });
                }
            });
        }
        //更新信息
        function updateCustomer() {
            $.post("afterUpdateCustomer",$("#updateForm").serialize(),function(data){
                if(data == "0"){
                    layer.msg("客户信息更新成功！",{icon:1,time: 1000});

                }else{
                    layer.msg("客户信息更新失败！",{time: 1000});
                }
            });
        }
        function addCustomer() {
            $.post("addCustomer",$("#updateForm").serialize(),function(data){
                if(data == "0"){
                    layer.msg("客户添加成功！",{icon:1,time: 1000});
                }else{
                    layer.msg("客户添加失败！",{time: 1000});
                }
            });
        }
    });



</script>
</body>
</html>
<form hidden="hidden" class="layui-form layui-col-md-offset1" id="updateForm" lay-filter="updateForm" style="margin-top: 1.25rem;margin-right: 20px;width: 400px;">
    <input type="hidden" id="cusId" name="cid" value="1">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input id="cusName" type="text" name="cname" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input id="cusAge"  type="number" name="cage" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input id="man" type="radio" name="cgender" value="男" title="男">
            <input id="woman" type="radio" name="cgender" value="女" title="女" >
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 100px" >联系方式</label>
        <div class="layui-input-block">
            <input id="cusPhone" type="number" name="cphone" required  lay-verify="required" placeholder="请输入联系方式" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block">
            <input id="cusAddress" type="text" name="caddress" required  lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <input id="cusEmail" type="text" name="cemail" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="on" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 100px">客户级别</label>
        <div class="layui-input-block">
            <select id="checkLevel" name="clevel" lay-verify="required">
                <option value="普通会员">普通会员</option>
                <option value="黄金会员">黄金会员</option>
                <option value="钻石会员">钻石会员</option>
                <option value="至尊会员">至尊会员</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 100px">出生日期</label>
        <div class="layui-input-block">
            <input id="cusBirthday" type="text" name="cbirthday" required  lay-verify="required" placeholder="请输入出生日期" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 100px">创建日期</label>
        <div class="layui-input-block">
            <input id="cusCreattime" type="text" name="ccreattime" required  lay-verify="required" placeholder="请输入创建日期" autocomplete="off" class="layui-input">
        </div>
    </div>
</form>
