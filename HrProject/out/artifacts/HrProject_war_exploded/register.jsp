
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="js/jquery-3.2.1.js"/>
    <script type="text/javascript" src="js/jquery-validate.js"/>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#regiserform").validate({
                rules: {
                    username:{
                        required: true,
                        minlength: 2
                    },
                    password:{
                        required: true,
                        minlength: 6,
                        maxlength: 16
                    },
                    repassword:{
                        required: true,
                        equalTo: "#password"
                    },
                    amt: {
                        required: true,
                        amtCheck: true
                    }
                },
                messages:{
                    username:{
                        required: "用户名不能为空",
                        minlength: "用户名的最小长度为2"
                    },
                    password:{
                        required: "密码不能为空",
                        minlength: "密码长度不能少于6个字符",
                        maxlength: "密码长度不能超过16个字符"
                    },
                    repassword:{
                        required: "确认密码不能为空",
                        equalTo: "确认密码和密码不一致"
                    },
                    amt: {
                        required: "金额不能为空"
                    }
                }
            });
        });
        $(function () {
            $("#name").blur(function () {
                $.ajax({
                    type:"post",
                    url:"volidataname",
                    data:{v_name:$("#name").val()},
                success:function (result) {
                        if(result=="false"){
                            $("#error_message").html("该用户已存在");
                            $("#name").val("");
                        }
                        else {
                            $("#error_message").html("用户名可用");
                        }
                    }
                })
            })
        })

    </script>
</head>
<body>
<span style="background: lavender"><a href="index.jsp">返回登陆界面</a></span>
<div id="content2">

    <div class="header">
        <img src="images/logo.png">
    </div>
    <form  action="register" method="post" id="regiserform" onSubmit="return isValid(this);">
        <div class="input-box">
            <label for="username" class="input-label">用户账号:</label>
            <input type="text" name="v_name"  id="username"placeholder="Please enter your acount"
            autocomplete="off" tip="请输入用户名">
        </div>
        <div class="input-box">
            <label for="password" class="input-label">用户账号:</label>
            <input type="password" name="v_pass" id="password" placeholder="Please enter your password" tip="长度为6-16个字符">
        </div>
        <div class="input-box">
            <label for="password" class="input-label">用户账号:</label>
            <input type="password" name="repetpass"  placeholder="Please enter your password again" tip="密码必须一致">
        </div>
    </form>
    <div class="button-box2">
        <button type="submit" value="提交"  form="regiserform" >提交</button>
    </div>
    <div class="button-box2">
        <button type="reset" value="重置"  form="regiserform" >重置</button>
    </div>
    <span style="text-align: center">${message}</span>
</div>
</body>
</html>

