
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
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script>
    <script >
        $().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
            $("#regiserform").validate({
                rules: {
                   v_name: {
                        required: true,
                        remote: {
                            url: "volidataname",
                            cache:false,
                            data: {
                                v_name:function () {
                                    return $("#v_name").val();
                                }
                            }
                        },
                        minlength: 2
                    },
                    v_pass: {
                        required: true,
                        minlength: 5
                    },
                    repetpass: {
                        required: true,
                        minlength: 5,
                        equalTo: "#v_pass"
                    }
                },
                messages: {
                    v_name: {
                        required: "请输入用户名",
                        remote:"用户名已存在",
                        minlength: "用户名必需由两个字母组成"
                    },
                    v_pass: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 5 个字母"
                    },
                    repetpass: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 5 个字母",
                        equalTo: "两次密码输入不一致"
                    },

                }
            });
        });

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
            <label for="v_name" >用户账号:</label>
            <input type="text" name="v_name"  id="v_name"placeholder="Please enter your acount"
            autocomplete="off" tip="请输入用户名">
        </div>
        <div class="input-box">
            <label for="v_pass">输入密码:</label>
            <input type="password" name="v_pass" id="v_pass" placeholder="Please enter your password" tip="长度为6-16个字符">
        </div>
        <div class="input-box">
            <label for="repetpass">再次输入:</label>
            <input type="password" name="repetpass" id="repetpass"  placeholder="Please enter your password again" tip="密码必须一致">
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

