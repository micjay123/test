<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/my_js/user_operate.js"></script>
    <script type="text/javascript" src="/static/js/my_js/SepPage.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <title>表格处理</title>
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
        <button type="button" class="btn btn-primary" id="btn-add">添加</button>
    </div>
    <table class="table table-hover table-bordered table-striped table-responsive" style="max-height: 500px;max-width: 800px;width: 1000px;">
        <thead>
        <tr class="active">
            <th>员工编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>手机号码</th>
            <th>状态</th>
            <th>状态描述</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list userList as u>
            <tr class="warning">
                <td><input type="checkbox"name="u_id" value="${u.state.u_id!}">${u.state.u_id!}</td>
                <td>${u.name!}</td>
                <td>${u.sex!}</td>
                <td>${u.phone_number!}</td>
                <td>${u.state.s_name!}</td>
                <td>${u.state.s_description!}</td>
                <td><button type="button" class="btn btn-warning btn-edit">编辑</button>
                    <button type="button" class="btn btn-danger" onclick="isSure()">删除</button>
                </td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div id="my_dialog" title="修改员工状态" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">状态</label>
            <div class="col-sm-10">
                <select class="form-control" name="s_name" id="s_name">
                    <option>待审核</option>
                    <option>实习</option>
                    <option>正式员工</option>
                    <option>离职</option>
                    <option>开除</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"id="s_description"name="s_description">
            </div>
        </div>
    </form>
</div>
<div id="add_dialog" title="添加员工状态" hidden>
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-2 control-label">选择员工</label>
            <div class="col-sm-10">
                <select class="form-control" name="name" id="name">
                    <#list userInfo as user>
                    <option value="${user.id}">${user.name}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">状态</label>
            <div class="col-sm-10">
                <select class="form-control" name="s_name" id="ss_name">
                    <option>待审核</option>
                    <option>实习</option>
                    <option>正式员工</option>
                    <option>离职</option>
                    <option>开除</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <input type="text" class="form-control"id="ss_description"name="s_description">
            </div>
        </div>
    </form>
</div>
</body>
</html>