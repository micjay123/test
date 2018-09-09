<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/static/js/jquery/dist/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <#--<link rel="stylesheet" href="/static/css/bootstrap.css">-->
    <title>登录</title>
</head>
<style>
    body{
        max-width: 400px;
        margin: 0 auto;
        float: none;
        background: #f8f8f8;
    }
    .form-padding{
        padding-top: 50px;
    }
    .btn-place{
        display: block;
        margin: 0 auto;
        min-width: 120px;
        min-height: 30px;
    }
    input:focus{
        background-color: #c8c8c8;
        color: #ddeeee;
    }
</style>
<body>
    <div class="page-header">
        <h1>人事信息管理系统
            <small>用户登录</small>
        </h1>
    </div>
    <font color="red">${success!}</font>
    <form class="container small-container form-padding" method="post" action="/checkLogin">
        <div class="col-xs-10 col-md-4">
            <div class="form-group">
                <label>用户名</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                    <input type="text" class="form-control" placeholder="username" name="username">
                </div>
            </div>
            <div class="form-group">
                <label>密码</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                    <input type="password" class="form-control" placeholder="password" name="password">
                </div>
            </div>
            <div style="color: red">
                ${fail!}
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary btn-place" value="登录">
            </div>
            <div class="form-group">
                <a style="color: #9d9d9d" href="/register">注册</a>
            </div>
        </div>
    </form>
</body>
</html>