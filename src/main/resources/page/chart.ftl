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
    <title>图表分析</title>
</head>
<script>
    $(document).ready(function(){
        $("#sexBtn").click(function(){
            $("#sector").hide(1000);
            $("#leave").hide(1000);
            $("#sex").show(1000);
        });
        $("#sectorBtn").click(function(){
            $("#sex").hide(1000);
            $("#leave").hide(1000);
            $("#sector").show(1000);
        });
        $("#leaveBtn").click(function(){
            $("#sex").hide(1000);
            $("#sector").hide(1000);
            $("#leave").show(1000);
        });
    });
</script>
<body>
<div id="header">
    <#include "header.ftl">
</div>
<div class="slider">
    <#include "slider.ftl">
</div>
<div id="sex" style="position: absolute;top:120px;left:300px;display: none">
    <table class="table table-hover table-bordered table-striped table-responsive" style="max-height: 500px;max-width: 800px;width: 1000px;">
        <caption style="text-align: center;color: #337ab7"><h3 class="warning">员工性别统计</h3></caption>
        <thead>
        <tr class="active">
            <th>性别</th>
            <th>人数</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list userList as u>
            <tr class="info">
                <td>${u.sex!}</td>
                <td>${u.amount!}</td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div id="sector" style="position: absolute;top:120px;left:300px;display: none">
    <table class="table table-hover table-bordered table-striped table-responsive" style="max-height: 500px;max-width: 800px;width: 1000px;">
        <caption style="text-align: center;color: #337ab7"><h3 class="warning">部门人数统计</h3></caption>
        <thead>
        <tr class="active">
            <th>部门名称</th>
            <th>人数</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list sectorList as s>
            <tr class="success">
                <td>${s.sectorName!}</td>
                <td>${s.amount!}</td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div id="leave" style="position: absolute;top:120px;left:300px;display: none">
    <table class="table table-hover table-bordered table-striped table-responsive" style="max-height: 500px;max-width: 800px;width: 1000px;">
        <caption style="text-align: center;color: #337ab7"><h3 class="warning">离职员工查看</h3></caption>
        <thead>
        <tr class="active">
            <th>姓名</th>
            <th>联系方式</th>
            <th>离职理由</th>
            <th>备注</th>
            <th>申请时间</th>
        </tr>
        </thead>
        <tbody>
        </tr><#list leaveList as l>
            <tr class="warning">
                <td>${l.user.name!}</td>
                <td>${l.user.phone_number!}</td>
                <td>${l.reason!}</td>
                <td>${l.description!}</td>
                <td>${l.leave_date?string('yyyy-MM-dd hh:mm:ss')}</td>
            </tr></#list>
        </tbody>
    </table>
</div>
<div style="position: fixed;top: 100px;left: 300px;">
    <button id="sexBtn" class="btn btn-primary">员工性别统计</button>
    <button id="sectorBtn" class="btn bg-info">部门人数统计</button>
    <button id="leaveBtn" class="btn bg-success">查看离职人员</button>
</div>
</body>
</html>