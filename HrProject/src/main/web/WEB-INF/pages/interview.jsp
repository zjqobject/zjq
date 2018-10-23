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
</head>
<body>
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
        <%
        }
        else{
        %>
        <td>已收到offer</td>
<%
        }
       }
    }
%>
</body>
</html>

