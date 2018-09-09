<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <table>
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>手机号码</th>
            <th>当前状态</th>
            <th>状态描述</th>
        </tr><#list userList as u>
            <tr>
                <td>${u.name!}</td>
                <td>${u.sex!}</td>
                <td>${u.phone_number!}</td>
                <td>${u.state.s_name!}</td>
                <td>${u.state.s_description!}</td>
            </tr></#list>
    </table>

</body>
</html>