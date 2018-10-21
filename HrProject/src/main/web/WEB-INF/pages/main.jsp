<%@ page import="com.jun.model.Recruit" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/20
  Time: 0:03
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
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <link rel="stylesheet" type="text/css" href="/css/pintuer.css">
    <script type="text/javascript" src="/js/respond.js"></script>
    <script type="text/javascript" src="/js/pintuer.js"></script>
    <script type="text/javascript" src="/js/jquery-1.11.1.js"></script>
</head>
<body >
<div class="head">
<div class="container">
    <div class="x12">
        <ul>
            <li class="nav-head"><a href="#" style="text-decoration: none ">
                <img src="/images/logo1.png">
            </a></li>
            <li class="onelevelmenu"><a href="#" style="text-decoration: none ">关于公司</a></li>
            <li class="onelevelmenu"><a href="#" style="text-decoration: none ">产品与应用</a></li>
            <li class="onelevelmenu"><a href="#" style="text-decoration: none ">服务支持</a></li>
            <li class="onelevelmenu"><a href="showRecruit?currentpage=1" style="text-decoration: none ">加入我们</a></li>

        </ul>
    </div>
</div>
</div>
<%
    List<Recruit> recruitList = (List<Recruit>) request.getAttribute("recruitList");
    if (recruitList!=null){
%>
<table border="1" cellspacing="0">
    <tr>
        <td>职位名称</td>
        <td>职位名称</td>
        <td>薪资待遇</td>
        <td>详情点击</td>

    </tr>
    <%
        for (int i = 0; i < recruitList.size(); i++) {
    %>
    <tr>
        <td><%=recruitList.get(i).getRe_position()%></td>
        <td><%=recruitList.get(i).getRe_needs()%></td>
        <%
            if(recruitList.get(i).getRe_salarylow()==0||recruitList.get(i).getRe_salarytop()==0){

    %>
        <td>工资面议</td>
       <%
            }
            else if(recruitList.get(i).getRe_salarylow()==recruitList.get(i).getRe_salarytop()&&recruitList.get(i).getRe_salarylow()!=0){

       %>
        <td><%=recruitList.get(i).getRe_salarytop()%></td>
        <%
        }
        else {

        %>
        <td><%=recruitList.get(i).getRe_salarylow()%>——<%=recruitList.get(i).getRe_salarytop()%></td>
        <%
            }

        %>
        <td>
            <form action="showRecruitDetail" method="post">
                <input type="hidden" name="re_id" value="<%=recruitList.get(i).getRe_id()%>">
                <input type="submit"value="详情">
            </form>
        </td>
    </tr>
    <%
        }
    %>

</table>
<%
    if(request.getAttribute("totalPages")!=null){
        int totalPages=(int)request.getAttribute("totalPages");
        if(totalPages!=0){
            for(int k=1;k<=totalPages;k++){
%>
<a href="showRecruit?currentPage=<%=k%>"><%=k%></a>

<%

                }
            }
        }
    }
%>
</body>
</html>

