<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/26
  Time: 16:59
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
    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <script type="text/javascript" src="/pintuer2/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/pintuer2/js/pintuer.js"></script>
    <script type="text/javascript" src="/pintuer2/js/respond.js"></script>
    <script type="text/javascript" src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/messages_zh.js"></script>
</head>
<body>
<div class="head">
    <div class="container">
        <div class="x12">
            <ul class="nav nav-meau nav-inline nav-pills nav-navicon" >
                <li class="nav-head">
                    <a href="#" style="text-decoration: none ">
                        <img src="/images/logo1.png">
                    </a>
                </li>
                <li class="onelevelmenu"><a href="showInterviewAll" style="text-decoration: none ">投递信息</a></li>
                <li class="onelevelmenu"><a href="showDepartMent" style="text-decoration: none ">添加部门职位</a></li>
                <li class="onelevelmenu"><a href="showEmployee" style="text-decoration: none ">员工信息状态</a></li>
                <li class="onelevelmenu"><a href="getPositionAll" style="text-decoration: none ">发布招聘信息</a></li>
            </ul>
        </div>
    </div>
</div>
<div style="width: 960px; height: 800px; background:#fff;margin: auto;position: relative;z-index: 1">
    <div style="width:800px; height:100% ; background-color: #ccffaa;margin: 0 auto" >
        <c:if test="${requestScope.positionList!=null}"  var="positionFlag">
            <form action="addRecruit" method="post" id="recuritForm">
          <div style="margin:0 auto"  align="center">
            <table >
                <tr>
                    <td>职位</td>
                    <td>
                        <select name="re_poid" >
                            <c:forEach items="${requestScope.positionList}" var="i">
                                <option value="${i.po_id}">${i.po_name}</option>
                            </c:forEach>
                        </select>

                    </td>
                    <td>年限</td>
                    <td>
                        <input  type="number"name="re_years">
                    </td>
                </tr>
                <tr>
                    <td>工资下限</td>
                    <td>
                        <input  type="number"name="re_salarylow">
                    </td>
                    <td>工资上限</td>
                    <td>
                        <input  type="number"name="re_salarytop">
                    </td>
                </tr>
                <tr>
                    <td>员工福利</td>
                    <td>
                        <input  type="text"name="re_welfare">
                    </td>
                    <td>地址</td>
                    <td>
                        <input  type="text"name="re_address">
                    </td>
                </tr>
                <tr>
                    <td>职位需求</td>
                    <td>
                        <input  type="text"name="re_needs">
                    </td>
                    <td>学历</td>
                    <td>
                        <input  type="text"name="re_education">
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <input  type="submit"value="提交">
                    </td>
                    <td colspan="2">
                        <input  type="reset"name="重置">
                    </td>
                </tr>
            </table>
          </div>
        </form>
        </c:if>
        <h>${requestScope.addREMSG}</h>
    </div>
</div>
</body>
</html>

