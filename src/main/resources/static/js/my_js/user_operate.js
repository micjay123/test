function isSure(){
    if(confirm("是否删除？")){
        delUser();
        return true;
    }else
        return false;
}
function delUser() {
    $.ajax({
        url:"/userState/delUserState",
        type:"get",
        data:"u_id="+$("input[name='u_id']:checked").val(),
        success:function(){
            alert("删除成功！");
            refresh();
        },
        error:function() {
            alert("删除失败！");
        }
    });
}
function refresh() {
    window.location.reload();
}

$(function(){
    $('#my_dialog').dialog({  //创建dialog，并设置为非自启动
        autoOpen: false,
        title: '编辑员工状态',
        buttons: {
            '更改': function(){
                $.ajax({
                    url:"/userState/updateUserState",
                    type:"get",
                    data:"u_id="+$("input[name='u_id']:checked").val()+"&s_name="+$("#s_name").val()+"&s_description="+$("#s_description").val(),
                    success:function(){
                        alert("更改成功！");
                        $('#my_dialog').dialog('close');
                        refresh();
                    },
                    error:function() {
                        alert("操作失败！");
                    }
                });
            },
            '取消': function(){
                $('#my_dialog').dialog('close');
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
                return true;
            }
            return false;
        },
    });
    $('.btn-edit').click(function(){   //通过按钮的点击事件打开dialog
        $('#my_dialog').dialog('open');
    });

});

$(function(){
    // var u_id=$("#name").val();
    // var s_name=$("#ss_name").val();
    // var s_description=$("#ss_description").val();
    $('#add_dialog').dialog({  //创建dialog，并设置为非自启动
        autoOpen: false,
        title: '添加员工状态',
        buttons: {
            '添加': function(){
                $.ajax({
                    url:"/userState/addState",
                    type:"get",
                    data:"u_id="+$("#name").val()+"&s_name="+$("#ss_name").val()+"&s_description="+$("#ss_description").val(),
                    success:function(){
                        alert("添加成功！");
                        $('#add_dialog').dialog('close');
                        refresh();
                    },
                    error:function() {
                        alert("操作失败！");
                    }
                });
            },
            '取消': function(){
                $('#add_dialog').dialog('close');
            }
        },
        width: 600,
        height: 300,
        show : 'scale',
        hide : 'clip',
        closeText : '关闭对话框',
        modal: true,
        beforeClose : function(){
            if(confirm("你确定要关闭？")){
                return true;
            }
            return false;
        },
    });
    $('#btn-add').click(function(){   //通过按钮的点击事件打开dialog
        $('#add_dialog').dialog('open');
    });

});
