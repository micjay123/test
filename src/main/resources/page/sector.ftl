<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>部门管理</title>
    <script type="text/javascript" src="/static/js/jquery/dist/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script>
        //添加部门
        $(function(){
            $('#my_dialog2').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                title: '添加部门',
                buttons: {
                    '添加': function(){
                        $.ajax({
                            url:"/sector/addSector/success",
                            type:"get",
                            data:"sectorName="+$("#department").val()+"&s_description="+$("#description").val(),
                            success:function(response){
                                alert("添加成功！");
                                $('#my_dialog2').dialog('close');
                            },
                            error:function() {
                                alert("添加失败！");
                            }
                        });
                    },
                    '取消': function(){
                        $('#my_dialog2').dialog('close');
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
                $('#my_dialog2').dialog('open');
            });
        });

        //删除部门
        function delSector() {
            $.ajax({
                url:"/sector/delSector",
                type:"get",
                data:"id="+$("input[name='s_id']:checked").val(),
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
                delSector();
                return true;
            }else
                return false;
        }
        function refresh() {
            window.location.reload();
        }

        //编辑部门
        $(function(){
            $('#my_dialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                title: '更改部门',
                buttons: {
                    '修改': function(){
                        $.ajax({
                            url:"/sector/editSector",
                            type:"get",
                            data:"id="+$("input[name='s_id']:checked").val()+"&sectorName="+$("#sector").val()+"&s_description="+$("#s_description").val(),
                            success:function(response){
                                alert("修改成功！！");
                                $('#my_dialog').dialog('close');
                            },
                            error:function() {
                                alert("操作失败！");
                            }
                        });
                    },
                    '取消': function(){
                        $('#my_dialog').dialog('close');
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
                $('#my_dialog').dialog('open');
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
            <th>部门编号</th>
            <th>部门名称</th>
            <th>部门简介</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list sectorList as s>
            <tr class="info">
                <td><input type="checkbox"name="s_id" value="${s.id!}">${s.id!}</td>
                <td>${s.sectorName!}</td>
                <td>${s.s_description!}</td>
                <td><button type="button" class="btn btn-warning btn-edit">编辑</button>
                    <button type="button" class="btn btn-danger" onclick="isSure()">删除</button>
                </td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div id="my_dialog" title="我的对话框" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">部门名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"id="sector" placeholder="部门名"name="sectorName">
            </div>
        </div>
        <div class="form-group">
            <label for="lastname" class="col-sm-2 control-label">部门简介</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="s_description" placeholder="该部门的描述" name="s_description">
            </div>
        </div>
    </form>
</div>
<div id="my_dialog2" title="我的对话框" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label">部门名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"id="department" placeholder="部门名"name="sectorName">
            </div>
        </div>
        <div class="form-group">
            <label for="lastname" class="col-sm-2 control-label">部门简介</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="description" placeholder="该部门的描述" name="s_description">
            </div>
        </div>
    </form>
</div>
</body>
</html>