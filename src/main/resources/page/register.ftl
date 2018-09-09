<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/static/js/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="/static/js/jquery/jquery.validate.js"></script>
    <script type="text/javascript" src="/static/js/my_js/checkRegister.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <#--<link rel="stylesheet" href="/static/css/bootstrap.css">-->
    <title>注册</title>
</head>
<style>
    .error{
        font-size: 10px;
        color: red;
    }
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
        <small>用户注册</small>
    </h1>
</div>
<form class="container small-container form-padding" id="register" method="post" action="/checkReg">
    <div class="col-xs-10 col-md-4">
        <div class="form-group">
            <label>姓名</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-pencil"></span></span>
                <input type="text" class="form-control" placeholder="your name" name="name">
            </div>
            <div class="error-name"></div>
        </div>
        <div class="form-group">
            <label>性别</label>
            <div class="input-group">
                <div class="radio">
                    <label class="radio-inline">
                        <input type="radio" name="sex"
                               value="男"> 男
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="sex"
                               value="女"> 女
                    </label>
                </div>
            </div>
            <div class="error-sex"></div>
        </div>
        <div class="form-group">
            <label>用户名</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                <input type="text" class="form-control" placeholder="username" name="username">
            </div>
            <div class="error-username"></div>
        </div>
        <div class="form-group">
            <label>密码</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                <input type="password" class="form-control" placeholder="password" name="password" id="password">
            </div>
            <div class="error-password"></div>
        </div>
        <div class="form-group">
            <label>确认密码</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-repeat"></span></span>
                <input type="password" class="form-control" placeholder="password" name="checkPass">
            </div>
            <div class="error-checkPass"></div>
        </div>
        <div class="form-group">
            <label>手机号码</label>
            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-earphone"></span></span>
                <input type="text" class="form-control" placeholder="your phone_number" name="phone_number">
            </div>
            <div class="error-phone"></div>
        </div>
        <div class="form-group">
            <#--<input type="submit" value="注册" class="btn btn-warning btn-place btn-position">-->
            <button class="btn btn-warning btn-place btn-position" onclick="jump()">提交</button>
        </div>
    </div>
</form>
</body>
</html>