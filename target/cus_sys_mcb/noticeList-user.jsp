<%--
  Created by IntelliJ IDEA.
  User: Tony
  Date: 2020/4/3
  Time: 16:13
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
</script>
<script src="lib/layui/layui.js"></script>
<script src="js/jquery.min.js"></script>
<script>
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function() {
        var laydate = layui.laydate //日期
            , laypage = layui.laypage //分页
            , layer = layui.layer //弹层
            , table = layui.table //表格
            , carousel = layui.carousel //轮播
            , upload = layui.upload //上传
            , element = layui.element //元素操作
            , slider = layui.slider//滑块
        //监听Tab切换
        element.on('tab(demo)', function (data) {
            layer.tips('切换了 ' + data.index + '：' + this.innerHTML, this, {
                tips: 1
            });
        });

        laydate.render({
            elem: '#nottime'
            , position: 'fixed'
            , trigger: 'click'
            , calendar: true //是否开启公历重要节日
            , done: function (value, date, endDate) {
                $("#cusCreattime").attr("value", value);
            }
        });

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            , height: '600px'
            , url: 'selectNoticeList' //数据接口
            , response: {
                dataName: 'noticeList' //规定数据列表的字段名称，默认：data
            }
            , request: {
                pageName: 'pn' //页码的参数名称，默认：page
                , limitName: 'limit' //每页数据量的参数名，默认：limit
            }
            , title: '用户表'
            , page: true //开启分页
            , toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            , toolbar: '#toolbarDemo'
            , totalRow: false //开启合计行
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                , {field: 'nid', title: '序号', width: 85, sort: true, fixed: 'left'}
                , {field: 'ntitle', title: '主题', width: 685}
                , {field: 'nsender', title: '发表人', width: 104, sort: true, totalRow: true}
                , {field: 'ntime', title: '发表时间', width: 120, sort: true}
                , {fixed: 'right', width: 180, align: 'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'search':
                    var ntitle = $(" input[ name='select' ] ").val();

                    table.reload('demo', {
                        url: 'selectByNtitle'
                        , where: {
                            ntitle: ntitle
                        }
                    });
                    break;

            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            var nid = data.nid;
            if (layEvent === 'select') {
                selectNotice(nid);
            }
        })
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
<div id="toolbarDemo" hidden="hidden">
    <form class="layui-form layui-col-space5">
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
