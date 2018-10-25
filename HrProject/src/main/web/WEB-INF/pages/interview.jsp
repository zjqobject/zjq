<%@ page import="com.jun.model.Interview" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/24
  Time: 1:24
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
    <link rel="stylesheet" type="text/css" href="/pintuer2/css/pintuer.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <script type="text/javascript" src="/pintuer2/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="/pintuer2/js/pintuer.js"></script>
    <script type="text/javascript" src="/pintuer2/js/respond.js"></script>
</head>
<body>
<div style="width: 800px;height: 100%; margin:0 auto ; background-color: #ccffaa" >
<%
            List<Interview> interviewList=(List<Interview>) request.getAttribute("interviewList");
if(interviewList!=null)
{
%>
<h3 align="center">投递信息</h3>
<span><a >返回公司首页</a></span>
<table border="1" cellspacing="0" width="100%">

    <tr>
        <td>职位名称</td>
        <td>求职人</td>
        <td>offer</td>
        <td>接受面试邀请</td>

    </tr>
        <%
            for (int i = 0; i < interviewList.size(); i++) {
        %>
    <tr>
        <td><%=interviewList.get(i).getIv_rename()%></td>
        <td><%=interviewList.get(i).getIv_vname()%></td>
        <%
            if(interviewList.get(i).getIv_invit()==0){
        %>
        <td>未收到offer</td>
        <td></td>
        <%
        }
        else{
        %>
        <td>收到offer</td>
       <%
       if(interviewList.get(i).getIv_receive()==0) {
            %>

        <td><a href="updateInterViewReceive?iv_id=<%=interviewList.get(i).getIv_id()%>">接受面试邀请</a> </td>
        <%
        }
        else{
        %>
        <td>已接受</td>
        <%
        }
        }
       }
    }
    %>
</div>
</body>
</html>

