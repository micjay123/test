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
    <title>Document</title>
    <script>
        function refresh() {
            window.location.reload();
        }

        //编辑权限
        $(function(){
            $('#edit_dialog').dialog({  //创建dialog，并设置为非自启动
                autoOpen: false,
                title: '修改职位',
                buttons: {
                    '修改': function(){
                        $.ajax({
                            url:"/user/role/editRole",
                            type:"get",
                            data:"id="+$("input[name='u_id']:checked").val()+"&r_id="+$("#userRole").val(),
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
    <table class="table table-hover table-bordered table-striped table-responsive" style="max-height: 500px;max-width: 800px;width: 1000px;">
        <thead>
        <tr class="active warning">
            <th>员工编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>联系方式</th>
            <th>职位</th>
            <th>权利</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list userRole as u>
            <tr class="info">
                <td><input type="checkbox"name="u_id" value="${u.id!}">${u.id!}</td>
                <td>${u.name!}</td>
                <td>${u.sex!}</td>
                <td>${u.phone_number!}</td>
                <td>${u.role.r_name!}</td>
                <td>${u.right.q_name!}</td>
                <td><button type="button" class="btn btn-primary btn-edit">职位升降</button></td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div id="edit_dialog" title="我的对话框" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">选择职位</label>
            <div class="col-sm-10">
                <select class="form-control" id="userRole">
                    <#list roleName as rn>
                        <option value="${rn.id}">${rn.r_name}</option>
                    </#list>
                </select>
            </div>
        </div>
    </form>
</div>
</body>
</html>