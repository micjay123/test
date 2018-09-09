<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/static/js/jquery/dist/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script type="text/javascript" src="/static/js/my_js/SepPage.js"></script>
    <title>部门用户管理</title>
    <script>
        //部门开除
        function dismissUser() {
            $.ajax({
                url:"/user/sector/dismiss",
                type:"get",
                data:"id="+$("input[name='u_id']:checked").val(),
                success:function(){
                    alert("删除成功！");
                    refresh();
                },
                error:function() {
                    alert("删除失败！");
                }
            });
        }
        function isSure(){
            if(confirm("是否删除？")){
                dismissUser();
                return true;
            }else
                return false;
        }
        function refresh() {
            window.location.reload();
        }

        //员工加入部门
        $(function(){
            $('#add_dialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                title: '员工部门添加',
                buttons: {
                    '添加': function(){
                        $.ajax({
                            url:"/user/sector/add",
                            type:"get",
                            data:"id="+$("#username").val()+"&s_id="+$("#s_name").val(),
                            success:function(response){
                                alert("添加成功！");
                                $('#add_dialog').dialog('close');
                            },
                            error:function() {
                                alert("操作失败");
                            }
                        });
                    },
                    '取消': function(){
                        $('#add_dialog').dialog('close');
                    }
                },
                width: 600,
                height: 300,
                show : 'scale',
                hide : 'clip',
                closeText : '关闭对话框',
                modal: true,
                beforeClose : function(){
                    if(confirm("你确定要关闭？")){
                        refresh();
                        return true;
                    }
                    return false;
                },
            });
            $('#btn-add').click(function(){   //通过按钮的点击事件打开dialog
                $('#add_dialog').dialog('open');
            });
        });

        //部门调离
        $(function(){
            $('#edit_dialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                title: '员工部门调离',
                buttons: {
                    '修改': function(){
                        $.ajax({
                            url:"/user/sector/add",
                            type:"get",
                            data:"id="+$("input[name='u_id']:checked").val()+"&s_id="+$('#sn').val(),
                            success:function(response){
                                alert("修改成功！！");
                                $('#edit_dialog').dialog('close');
                            },
                            error:function() {
                                alert("操作失败！");
                            }
                        });
                    },
                    '取消': function(){
                        $('#edit_dialog').dialog('close');
                    }
                },
                width: 600,
                height: 300,
                show : 'scale',
                hide : 'clip',
                closeText : '关闭对话框',
                modal: true,
                beforeClose : function(){
                    if(confirm("你确定要关闭？")){
                        refresh();
                        return true;
                    }
                    return false;
                },
            });
            $('.btn-edit').click(function(){   //通过按钮的点击事件打开dialog
                $('#edit_dialog').dialog('open');
            });
        });
    </script>
</head>
<body>
<div id="header">
    <#include "header.ftl">
</div>
<div class="slider">
    <#include "slider.ftl">
</div>
<div style="position: absolute;top:100px;left:300px;">
    <div style="width: 100px;">
        <button type="button" class="btn btn-success" id="btn-add">添加</button>
    </div>
    <table class="table table-hover table-bordered table-striped table-responsive" style="max-height: 500px;max-width: 800px;width: 1000px;">
        <thead>
        <tr class="active warning">
            <th>员工编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>联系方式</th>
            <th>部门名</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list user4sector as u_sector>
            <tr class="info">
                <td><input type="checkbox"name="u_id" value="${u_sector.user.id!}">${u_sector.user.id!}</td>
                <td>${u_sector.user.name!}</td>
                <td>${u_sector.user.sex!}</td>
                <td>${u_sector.user.phone_number!}</td>
                <td>${u_sector.sectorName!}</td>
                <td><button type="button" class="btn btn-warning btn-edit">部门调迁</button>
                    <button type="button" class="btn btn-danger" onclick="isSure()">部门开除</button>
                </td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div id="add_dialog" title="我的对话框" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">选择员工</label>
            <div class="col-sm-10">
                <select class="form-control" name="username" id="username">
                    <#list username as u>
                        <option value="${u.id}">${u.name}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">加入部门</label>
            <div class="col-sm-10">
                <select class="form-control" name="s_name" id="s_name">
                    <#list sectorName as s>
                        <option value="${s.id}">${s.sectorName}</option>
                    </#list>
                </select>
            </div>
        </div>
    </form>
</div>
<div id="edit_dialog" title="我的对话框" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">调迁部门</label>
            <div class="col-sm-10">
                <select class="form-control" id="sn">
                    <#list sectorName as sn>
                        <option value="${sn.id}">${sn.sectorName}</option>
                    </#list>
                </select>
            </div>
        </div>
    </form>
</div>
</body>
</html>