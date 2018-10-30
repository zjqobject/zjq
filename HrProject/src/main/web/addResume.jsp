<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/22
  Time: 23:32
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
    <title>Title</title>
    <style type="text/css">
        td{
            text-align:center;
            width:80px;
            height:30px;
        }
        input{
            width:98%;
            height:98%;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/pintuer2/css/pintuer.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script type="text/javascript" src="/pintuer2/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/pintuer2/js/pintuer.js"></script>
    <script type="text/javascript" src="/pintuer2/js/respond.js"></script>
</head>
<body >
<div class="head">
    <div class="container">
        <div class="x12">
            <ul class="nav nav-meau nav-inline nav-pills nav-navicon" >
                <li class="nav-head">
                    <a href="#" style="text-decoration: none ">
                        <img src="/images/logo1.png">
                    </a>
                </li>
                <li class="onelevelmenu"><a style="text-decoration: none ">关于公司</a></li>
                <li class="onelevelmenu"><a href="showResumeAll"  style="text-decoration: none ">我的简历</a></li>
                <li class="onelevelmenu"><a href="../../addResume.jsp"  style="text-decoration: none ">填写简历</a></li>
                <li class="onelevelmenu"><a href="showInterview" style="text-decoration: none ">投递信息</a></li>
                <li class="onelevelmenu"><a href="showRecruit?currentPage=1" style="text-decoration: none ">加入我们</a></li>
            </ul>
        </div>
    </div>
</div>
<div style="width: 960px; height: 800px; background:#fff;margin: auto;position: relative;z-index: 1">
    <div style="width:800px; height:100% ; background-color: #ccffaa;margin: 0 auto" >
<form action="addResumes" method="post" id="resumeform">
    <table border="1" align="center">
        <!--第一行-->
        <tr>
            <td>姓名</td>
            <td><input type="text" name="r_name" > </td>
            <td>性别</td>
            <td><input type="text" name="r_sex"></td>
            <td>出生年月</td>
            <td><input type="text" name="r_borndate" ></td>
            <td rowspan="4"><input type="file"></td>
        </tr>
        <!--第二行-->
        <tr>
            <td>民族</td>
            <td><input type="text" name="r_nation" ></td>
            <td>政治面貌</td>
            <td><input type="text"  name="r_politics"></td>
            <td>身高</td>
            <td><input type="number"  step="0.01"  name="r_height"> </td>
        </tr>
        <!--第三行-->
        <tr>
            <td>学制</td>
            <td><input type="text" name="r_edusystem"></td>
            <td>学历</td>
            <td><input type="text" name="r_education" ></td>
            <td>户籍</td>
            <td><input type="text"  name="r_naviteplace"></td>
        </tr>
        <!--第四行-->
        <tr>
            <td>专业</td>
            <td><input type="text"  name="r_specialty"></td>
            <td colspan="2">毕业学校</td>
            <td colspan="2"><input type="text" name="r_college"></td>
        </tr>
        <tr>
            <td colspan="7" ><b>技能、特长或爱好</b> </td>
        </tr>
        <tr>
            <td>外语等级</td>
            <td colspan="2"><input type="text" name="r_englevel"></td>
            <td>计算机</td>
            <td colspan="3"><input type="text" name="r_complevel"></td>
        </tr>
        <tr>
            <td colspan="7" >工作经历</td>
        </tr>
        <tr>
            <td colspan="7" ><input type="text" rows="2" name="r_workexperience"></td>
        </tr>
        <tr>
            <td colspan="7" >教育经历</td>
        </tr>
        <tr>
            <td colspan="7" ><input type="text" rows="2" name="r_educatexp"></input></td>
        </tr>
        <tr>
            <td colspan="7">联系方式</td>
        </tr>
        <tr>
            <td>通信地址</td>
            <td colspan="2"><input type="text" name="r_address"></td>
            <td>联系电话</td>
            <td colspan="3"><input type="text" name="r_phone"></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td colspan="2"><input type="text" name="r_email"></td>
            <td>邮编</td>
            <td colspan="3"><input type="number" name="r_postcode"></td>
        </tr>
        <tr>
            <td colspan="7">自我评价</td>
        </tr>
        <tr>
            <td colspan="7" ><input type="text" rows="5" name="r_evaluate"></td>
        </tr>

    </table>
</form>
<h3 align="center"><button type="submit" form="resumeform">添加简历</button></h3>
</body>
</html>

