$(function(){
    $("#register").validate({
            errorPlacement: function(error, element) {
                if(element.attr("name")=="username"){
                    error.appendTo(".error-username");
                }
                if(element.attr("name")=="name"){
                    error.appendTo(".error-name");
                }
                if(element.attr("name")=="phone_number"){
                    error.appendTo(".error-phone");
                }
                if(element.attr("name")=="password"){
                    error.appendTo(".error-password");
                }
                if(element.attr("name")=="checkPass"){
                    error.appendTo(".error-checkPass");
                }
                if(element.attr("name")=="sex"){
                    error.appendTo(".error-sex");
                }
            },
        rules: {
            name: {
                required: true,
                rangelength:[2,12]
            },
            username: {
                required: true,
                checkUser: true
            },
            sex:{
                required: true,
            },
            password: {
                required: true,
                rangelength: [6,100],
                checkPsw: true
            },
            checkPass: {
                required: true,
                equalTo: "#password"
            },
            phone_number: {
                required: true,
                checkPhone: true
            }
        },
        messages: {
            name: {
                required: "请输入您的名字！",
                rangelength:"名字长度2-12字符！"
            },
            sex: {
                required: "请选择性别！",
            },
            username: {
                required: "请输入用户名",
            },
            password: {
                required: "请输入密码",
                rangelength:"密码长度应大于6个字符！"
            },
            checkPass: {
                required: "请输入密码",
                equalTo: "两次密码输入不一致"
            },
            phone_number:{
                required: "请输入您的手机号！"
            }
        }
    })
});


$.validator.addMethod("checkPsw",function(value,element,params){
    var checkPsw = /^[a-zA-Z0-9]/;
    return this.optional(element)||(checkPsw.test(value));
},"*密码格式错误(必须字母和数字)");
$.validator.addMethod("checkPhone",function(value,element,params){
    var checkPhone = /^[1]{1}[3,4,5,8]{1}[0-9]{9}$/;
    return this.optional(element)||(checkPhone.test(value));
},"*请输入正确的手机号码！");
$.validator.addMethod("checkUser",function(value,element,params){
    var checkUser = /^\w{6,15}$/;
    return this.optional(element)||(checkUser.test(value));
},"*用户名格式有误(必须字母、数字、或下划线组合，长度6-15)！");

function jump() {
    var ret = $("#register").valid();
    if(ret){
        alert("注册成功！即将跳转到登录界面！");
    }else {
        alert("请正确填写表单！");
        $("#register").validate().resetForm();
    }
}