<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/12
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script language="javascript">
        function isValid(form)
        {
            if (form.v_name.value=="")
            {
                alert("用户名不能为空");
                return false;
            }
            else  if (form.v_pass.value=="")
            {
                alert("用户密码不能为空！");
                return false;
            }
            else return true;
        }
    </script>
</head>

<body>
<div id="content">

    <div class="header">
        <img src="images/logo.png">
    </div>
    <form  action="login" method="post" id="loginform" onSubmit="return isValid(this);">
        <div class="input-box">
            <span>账号:</span>
            <input type="text" name="v_name" placeholder="Please enter your acount">
        </div>
        <div class="input-box">
            <span>密码:</span>
            <input type="password" name="v_pass" placeholder="Please enter your password">
        </div>
    </form>
    <div class="remember-box">
        <label>
            <input type="checkbox">&nbsp;记住密码
        </label>
    </div>
    <div class="button-box">
        <button type="submit" value="登录"  form="loginform" >登录</button>
    </div>
    <div class="logon-box">
        <a href="register.jsp">注册</a>
    </div>
</div>
</body>
</html>

