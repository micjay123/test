<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <title>Document</title>
</head>
<body>
<div class="navbar navbar-default"  id="nav">
    <div class="container">
        <div class="navbar-header">
            <a href="#" class="navbar-brand navbar-info">公司管理系统</a>
        </div>
        <ul class="nav navbar-nav">
            <li><a href="/">首页</a></li>
            <li><a href="#">产品</a></li>
            <li><a href="#">公司简介</a></li>
        </ul>
        <form class="navbar-form  navbar-left">
            <div class="form-group">
                <input type="text" class="form-control">
            </div>
            <botton class="btn btn-info">搜搜看</botton>
        </form>
        <ul class="nav navbar-nav navbar-right">
             <#if user??>
        <li style="color: #00CCFF">欢迎，<#if Session.user??>${Session.user.name}</#if></li>
                 <li><a href="/logout">注销</a></li>
             <#else>
            <li><a href="/login">登录</a></li>
            <li><a href="/register">注册</a></li>
             </#if>
        </ul>
    </div>
</div>
</body>
</html>