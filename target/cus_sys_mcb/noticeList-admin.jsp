<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/3/30
  Time: 16:21
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
    </style>

</head>

<body>

<table class="layui-hide" id="demo" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="select">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a><br>
</script>
<script src="lib/layui/layui.js"></script>
<script src="js/jquery.min.js"></script>
<script>
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider//滑块
        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
                tips: 1
            });
        });

        laydate.render({
            elem: '#nottime'
            ,position: 'fixed'
            ,trigger: 'click'
            ,calendar: true //是否开启公历重要节日
            ,done: function(value, date, endDate){
                $("#cusCreattime").attr("value",value);
            }
        });

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height:'600px'
            ,url: 'selectNoticeList' //数据接口
            ,response: {
                dataName: 'noticeList' //规定数据列表的字段名称，默认：data
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
                ,{field: 'nid', title: '序号', width:85, sort: true, fixed: 'left'}
                ,{field: 'ntitle', title: '主题', width:685}
                ,{field: 'nsender', title: '发表人', width: 104, sort: true, totalRow: true}
                ,{field: 'ntime', title: '发表时间', width:120, sort: true}
                ,{fixed: 'right', width: 180, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                //添加客户
                case 'add':
                    addNotice();
                    break;

                //删除客户
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        var ids=layui.$.map(data,function(item){
                            return item.nid
                        }).join();
                        layer.confirm('真的删除行吗？', function(index){
                            //向服务端发送删除指令
                            $.post("deletSelectNotice",{"ids":ids},function(data){
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
                    var ntitle=$(" input[ name='select' ] ").val();

                    table.reload('demo',{
                        url:'selectByNtitle'
                        ,where:{ntitle: ntitle
                        }
                    });
                    break;

            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            var nid = data.nid;
            if(layEvent === 'select'){
                selectNotice(nid);
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行吗？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.post("deletNotice",{"id":nid},function(data){
                        if(data == "0"){
                            layer.msg('客户信息删除成功',{icon:1,time: 1000});
                        }else{
                            layer.msg('客户信息删除失败');
                        }
                    });
                });
            } else if(layEvent === 'edit'){
                updateNotice(nid);
            }
        });

    })

</script>
<script>
    // 查看模态框
    function selectNotice(id) {
        layer.open({
            type: 1
            ,title: ['公告详情', 'font-size:18px;']
            ,area: ['550px', '620px']
            ,content: $('#selcetTable') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            ,btn: '返回'
            ,btn1: function(index, layero){
                $(".layui-laypage-btn")[0].click();
                layer.close(layer.index);
            }
        });
        $.ajax({
            type:"get",
            url:"selectNoticeById",
            data:{"id":id},
            success:function(data) {
                $("#nid").text(data.nid);
                $("#ntitle").text(data.ntitle);
                $("#ncontent").text(data.ncontent);
                $("#nsender").text(data.nsender);
                $("#ntime").text(data.ntime);
            }
        });
    }
    // 编辑模态框
    function updateNotice(id){
        layer.open({
            type: 1
            ,title: ['编辑公告', 'font-size:18px;']
            ,area: ['820px', '600px']
            ,content: $('#selcetForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            ,btn: ['修改', '返回']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                $.post("updateNotice",$("#selcetForm").serialize(),function(data){
                    if(data == "0"){
                        layer.msg("公告更新成功！",{icon:1,time: 1000});

                    }else{
                        layer.msg("公告更新失败！",{time: 1000});
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
            url:"selectNoticeById",
            data:{"id":id},
            success:function(data) {
                $("#nid").val(data.nid);
                $("#nottitle").val(data.ntitle);
                $("#notcontent").val(data.ncontent);
                $("#notsender").val(data.nsender);
                $("#nottime").val(data.ntime);
            }
        });
    }

    function addNotice() {
        layer.open({
            type: 1
            ,title: ['添加公告', 'font-size:18px;']
            ,area: ['820px', '600px']
            ,content: $('#selcetForm') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            ,btn: ['添加', '返回']
            ,yes: function(index, layero){
                //按钮【按钮一】的回调
                $.post("addNotice",$("#selcetForm").serialize(),function(data){
                    if(data == "0"){
                        layer.msg("公告添加成功！",{icon:1,time: 1000});

                    }else{
                        layer.msg("公告添加失败！",{time: 1000});
                    }
                });
            }
            ,btn2: function(index, layero){
                window.location.reload();
            }
        });
    }
</script>
</body>
</html>
<table hidden="hidden" id="selcetTable" align="center" >
    <tr style="width: 50px">
        <td><br></td>
    </tr>
    <tr style="text-align: center;font-size:xx-large;font-weight:bold;">
        <br>
       <td id="ntitle"></td>
    </tr>
    <tr style="width: 50px">
        <td><hr/></td>
    </tr>
    <tr>
        <td id="ncontent" style="height: auto;width: 500px;text-align: left;"></td>
    </tr>
    <tr style="text-align: right">
        <td id="nsender"></td>
    </tr>
    <tr style="text-align: right">
        <td id="ntime"></td>
    </tr>
</table>

<form id="selcetForm"  hidden="hidden" class="layui-form layui-col-md-offset1" style="margin-top: 1.25rem;margin-right: 20px;width: 400px;">
    <input type="hidden" id="nid" name="nid" value="1">
    <div class="layui-form-item">
        <label class="layui-form-label">标题</label>
        <div class="layui-input-block">
            <input id="nottitle" type="text" placeholder="请输入标题" name="ntitle" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">主题</label>
        <div class="layui-input-block">
            <textarea id="notcontent" type="text" placeholder="请输入主题" style="width: 550px;height: 400px;text-align: left;overflow-wrap:break-word;overflow-y:scroll;" name="ncontent" class="layui-input"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 100px">发表人</label>
        <div class="layui-input-block">
            <input id="notsender" type="text"  placeholder="请输入发表人"  name="nsender" class="layui-input"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 100px">发表时间</label>
        <div class="layui-input-block">
            <input id="nottime" type="text" placeholder="请输入发表时间" name="ntime" class="layui-input"/>
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
            <input type="text"  name="select" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-inline layui-show-xs-block">
            <button type="button" class="layui-btn layui-btn layui-btn-sm" lay-event="search">
                <i class="layui-icon">&#xe615;</i>
                查询
            </button>
        </div>
    </form>
</div>
