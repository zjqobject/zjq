
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>"/>
    <title>注册</title>

    <script language="javascript">
        function isValid(form)
        {
            if (form.name.value=="")
            {
                alert("用户名不能为空");
                return false;
            }
            if (form.pass.value!=form.pass2.value)
            {
                alert("两次输入的密码不同！");
                return false;
            }
            else  if (form.pass.value=="")
            {
                alert("用户密码不能为空！");
                return false;
            }
            else return true;
        }
    </script>
</head>
<body>
<center>
<h2>用户注册</h2>
    <fieldset>
        <form action="register" method="post" onSubmit="return isValid(this);">
            <table>
                <tr><td>用户名:</td><td><input type="text" name="name" size="20"/></td></tr>
                <tr><td>输入密码:</td><td><input type="password" name="pass" size="20"/></td></tr>
                <tr><td>再次确认密码:</td><td><input type="password"name="pass2" size="20"/></td><tr>
                <tr><td><input type="submit" value="注册"/><td><input type="reset" value="重置"/>
            </table>
        </form>
    </fieldset>
</center>

</body>
</html>

