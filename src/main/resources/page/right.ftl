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
    <title>权限管理</title>
    <script>
        //添加权限
        $(function(){
            $('#add_dialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                title: '添加权限',
                buttons: {
                    '添加': function(){
                        $.ajax({
                            url:"/right/addRight/success",
                            type:"get",
                            data:"q_name="+$("#department").val()+"&q_description="+$("#description").val(),
                            success:function(response){
                                alert("添加成功！");
                                $('#add_dialog').dialog('close');
                            },
                            error:function() {
                                alert("添加失败！");
                            }
                        });
                    },
                    '取消': function(){
                        $('#add_dialog').dialog('close');
                    }
                },
                width: 600,
                height: 200,
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

        //删除权限
        function delRight() {
            $.ajax({
                url:"/right/delRight",
                type:"get",
                data:"id="+$("input[name='r_id']:checked").val(),
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
                delRight();
                return true;
            }else
                return false;
        }
        function refresh() {
            window.location.reload();
        }

        //编辑权限
        $(function(){
            $('#edit_dialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                title: '修改权限',
                buttons: {
                    '修改': function(){
                        $.ajax({
                            url:"/right/editRight",
                            type:"get",
                            data:"id="+$("input[name='r_id']:checked").val()+"&q_name="+$("#right").val()+"&q_description="+$("#r_description").val(),
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
                height: 200,
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
        <tr class="active">
            <th>权限编号</th>
            <th>权限名称</th>
            <th>权限描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list rightList as r>
            <tr class="warning">
                <td><input type="checkbox"name="r_id" value="${r.id!}">${r.id!}</td>
                <td>${r.q_name!}</td>
                <td>${r.q_description!}</td>
                <td><button type="button" class="btn btn-warning btn-edit">编辑</button>
                    <button type="button" class="btn btn-danger" onclick="isSure()">删除</button>
                </td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div id="add_dialog" title="我的对话框" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">权限名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"id="department" placeholder="权限名"name="q_name">
            </div>
        </div>
        <div class="form-group">
            <label for="lastname" class="col-sm-2 control-label">权限描述</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="description" placeholder="权限描述" name="q_description">
            </div>
        </div>
    </form>
</div>
<div id="edit_dialog" title="我的对话框" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">权限名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"id="right" placeholder="权限名"name="q_name">
            </div>
        </div>
        <div class="form-group">
            <label for="lastname" class="col-sm-2 control-label">权限描述</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="r_description" placeholder="权限描述" name="q_description">
            </div>
        </div>
    </form>
</div>
</body>
</html>