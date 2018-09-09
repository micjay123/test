<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script type="text/javascript" src="/static/js/jquery/dist/jquery.min.js"></script>
    <title>json 解析</title>
</head>
<script>
    $.ajax({
        url: "/sector/getcount",//json文件位置
        type: "post",//请求方式为get
        data:{

        },
        success: function(data) {//请求成功完成后要执行的方法
            //each循环 使用$.each方法遍历返回的数据date
            var f = $.parseJSON(data);
            var name = [],amount = [];
            for (var i = 0; i < f.length; i++) {
                name.push(f[i].sectorName);
                amount.push(f[i].amount);
            }
            alert(name+amount);
        },

        error: function () {
            alert("error");
        }

    })
    // alert("hello")
</script>
<body>
$END$
</body>
</html>