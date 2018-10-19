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
</head>
<style>
    body{
        background-image: url("../web/images/bcg.jpg");
        background-size: cover;
    }

    #content{
        background-color: rgba(255, 255, 255, 0.95);
        width: 420px;
        height: 300px;
        border: 1px solid #000000;
        border-radius: 6px;
        padding: 10px;
        margin-top: 15%;
        margin-left: auto;
        margin-right: auto;
        display: block;
    }
    .login-header{
        text-align:center;
        width: 100%;
        height: 48px;
        margin-bottom: 20px;
        border-bottom: 1px solid #dcdcdc;
    }

    .login-header img{
        width: 120px;
        margin-left: auto;
        margin-right: auto;
        display: block;
    }

    .login-input-box{
        margin-top: 12px;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
        display: inline-block;
    }

    .login-input-box input{
        width: 340px;
        height: 32px;
        margin-left: 18px;
        border: 1px solid #dcdcdc;
        border-radius: 4px;
        padding-left: 42px;
    }

    .login-input-box input:hover{
        border: 1px solid #ff7d0a;
    }

    .login-input-box input:after{
        border: 1px solid #ff7d0a;
    }

    .login-input-box .icon{
        width: 24px;
        height: 24px;
        margin: 6px 4px 6px 24px;
        background-color: #ff7d0a;
        display: inline-block;
        position: absolute;
        border-right: 1px solid #dcdcdc;
    }


    .remember-box{
        width: auto;
        height: auto;
        margin-left: 18px;
        margin-top: 12px;
        font-size: 12px;
        color: #6a6765;
    }

    .login-button-box{
        margin-top: 12px;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
        display: inline-block;
    }

    .login-button-box button{
        background-color: #ff7d0a;
        color: #ffffff;
        font-size: 16px;
        width: 386px;
        height: 40px;
        margin-left: 18px;
        border: 1px solid #ff7d0a;
        border-radius: 4px;
    }

    .login-button-box button:hover{
        background-color: #ee7204;
    }

    .login-button-box button:active{
        background-color: #ee7204;
    }

    .logon-box{
        margin-top: 20px;
        text-align: center;
    }

    .logon-box a{
        margin: 30px;
        color: #4a4744;
        font-size: 13px;
        text-decoration: none;
    }

    .logon-box a:hover{
        color: #ff7d0a;
    }

    .logon-box a:active {
        color: #ee7204;
    }
</style>
<body>
<div id="content">

    <div class="login-header">
        游客登录
    </div>
    <form  action="login" method="post">
        <div class="login-input-box">
            <span>账号:</span>
            <input type="text" placeholder="Please enter your acount">
        </div>
        <div class="login-input-box">
            <span>密码:</span>
            <input type="password" placeholder="Please enter your password">
        </div>
    </form>
    <div class="remember-box">
        <label>
            <input type="checkbox">&nbsp;记住密码
        </label>
    </div>
    <div class="login-button-box">
       <button> <input type="submit" value="登录" ></button>
    </div>
    <div class="logon-box">
        <a href="register.jsp">注册</a>
    </div>
</div>
</body>
</html>

