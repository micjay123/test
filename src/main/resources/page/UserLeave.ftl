<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/static/js/jquery/dist/jquery.min.js"></script>
    <title>Document</title>
</head>
<script>
    function addLeave() {
        $.ajax({
            url:"/userLeave/addLeave",
            data:"u_id="+$('#uid').val()+"&reason="+$('#reason').val()+"&description="+$('#description').val(),
            success:function(){
                alert("提交成功！");
                refresh();
            },
            error:function() {
                alert("您已经提交过申请，请勿重复提交！");
            }
        });
    }
    function refresh() {
        window.location.reload();
    }
</script>
<body>
    <div id="header">
        <#include "header.ftl">
    </div>
    <div class="slider">
        <#include "slider.ftl">
    </div>
    <div style="position: absolute;left: 200px;top: 60px;background-color: #f8f8f8;width: 100%;height: 100%">
        <div class="page-header" style="padding-left: 200px">
            <h1>人事信息管理系统
                <small>离职申请</small>
            </h1>
        </div>
        <div style="position: absolute;top: 100px;left: 200px;width: 500px;height: 400px;padding-top: 50px">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">申请人</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" value="<#if Session.user??>${Session.user.name}</#if>" disabled>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">离职理由</label>
                    <div class="col-sm-8">
                        <select class="form-control" name="reason" id="reason">
                            <option>薪水太低</option>
                            <option>公司内部矛盾</option>
                            <option>缺少升职机会</option>
                            <option>个人原因（身体、家庭等原因）</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">详细说明</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="description" name="description">
                    </div>
                </div>
                <div style="display: none">
                    <input type="text" hidden id="uid" value="${uid!}">
                </div>
                <div class="form-group" style="position: absolute;left: 200px;top: 200px;">
                   <button class="btn btn-danger" onclick="addLeave()">提交申请</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>