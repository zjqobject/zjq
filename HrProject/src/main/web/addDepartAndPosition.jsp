<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/24
  Time: 10:27
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
            width:100px;
            height:30px;
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
    <script >
        $().ready(function() {
// 在键盘按下并释放及提交后验证提交表单
            $("#addDepartmentform").validate({
                rules: {
                    de_name: {
                        required: true,
                        remote: {
                            url: "getDepartment",
                            cache:false,
                            data: {
                                de_name:function () {
                                    return $("#de_name").val();
                                }
                            }
                        }
                    }
                },
                messages: {
                    de_name: {
                        required: "请输入部门名",
                        remote:"部门已存在",
                    }
                }
            });
            $("#addpositionform").validate({
                rules: {
                    po_name: {
                        required: true,
                        remote: {
                            url: "getPositionByname",
                            cache:false,
                            data: {
                                po_name:function () {
                                    return $("#po_name").val();
                                }
                            }
                        }
                    }
                },
                messages: {

                    po_name: {
                        required: "请输入职位名",
                        remote:"职位已存在",
                    }
                }
            });

        });

    </script>
</head>
<body>
<div class="head">
    <div class="container">
        <div class="x12">
            <ul class="nav nav-meau nav-inline nav-pills nav-navicon" >
                <li class="onelevelmenu"><a href="showInterviewAll" style="text-decoration: none ">面试信息</a></li>
                <li class="onelevelmenu"><a href="showDepartMent" style="text-decoration: none ">添加部门职位</a></li>
                <li class="onelevelmenu"><a href="getPostionAll" style="text-decoration: none ">发布招聘信息</a></li>
                <li class="onelevelmenu"><a href="getEmployeeAll" style="text-decoration: none ">管理员工</a></li>
                <li class="onelevelmenu"><a href="getdepartmentAll" style="text-decoration: none ">管理部门</a></li>
                <li class="onelevelmenu"><a href="getredicuritAll" style="text-decoration: none ">查看招聘信息</a></li>
            </ul>
        </div>
    </div>
</div>
<div style="width: 960px; height: 800px; background:#fff;margin: auto;position: relative;z-index: 1">
    <div style="width:800px; height:100% ; background-color: #ccffaa;margin: 0 auto" >
            <form action="addDepartment" method="post" id="addDepartmentform">
                    <label >添加部门：</label>
                    <input type="text" name="de_name"id="de_name">
                    <input type="submit" value="确认添加">
            </form>
            <span>${requestScope.addDesuccess}</span>
            <c:if test="${requestScope.departmentList!=null}" var="departmrntFlag">
                <form action="addPosition" method="post" id="addpositionform">
                        <label >添加职位：</label>
                        <select name="po_deid">
                            <c:forEach items="${requestScope.departmentList}" var="i">
                                <option value="${i.de_id}">${i.de_name}</option>
                            </c:forEach>
                         </select>

                       <input type="text" name="po_name" id="po_name">
                        <input type="submit" value="确认添加">
                </form>
                <span>${requestScope.addPoMSg}</span>
            </c:if>
</div>
</div>
</body>
</html>

