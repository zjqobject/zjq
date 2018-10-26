<%@ page import="com.jun.model.Interview" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jun.model.Department" %><%--
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
</head>
<body>
<link rel="stylesheet" type="text/css" href="/pintuer2/css/pintuer.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script type="text/javascript" src="/pintuer2/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/pintuer2/js/pintuer.js"></script>
<script type="text/javascript" src="/pintuer2/js/respond.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>>
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
                            v_name:function () {
                                return $("#de_name").val();
                            }
                        }
                    }
                }
            },
            messages: {
                de_name: {
                    required: "请输入部门名",
                    remote:"用户名已存在",
                }

            }
        });
    });

</script>
</head>
<div class="head">
    <div class="container">
        <div class="x12">
            <ul class="nav nav-meau nav-inline nav-pills nav-navicon" >
                <li class="nav-head">
                    <a href="#" style="text-decoration: none ">
                        <img src="/images/logo1.png">
                    </a>
                </li>
                <li class="onelevelmenu"><a href="showInterviewALL" style="text-decoration: none ">投递信息</a></li>
                <li class="onelevelmenu"><a href="showDepartMent" style="text-decoration: none ">查看添加部门</a></li>
            </ul>
        </div>
    </div>
</div>
<div style="width: 960px; height: 800px; background:#fff;margin: auto;position: relative;z-index: 1">
    <div style="width:800px; height:100% ; background-color: #ccffaa;margin: 0 auto" >


<%

    List<Interview> interviewList=(List<Interview>) request.getAttribute("interviewList");
    List<Department> departmentList= (List<Department>)request.getAttribute("departmentList");
    if(interviewList!=null) {
%>
<span><a >返回公司首页</a></span>
<table border="1" cellspacing="0" width="100%">

    <tr>
        <td>职位名称</td>
        <td>求职人</td>
        <td>查看简历</td>
        <td>面试邀请</td>
        <td>是否已接受面试</td>
        <td colspan="2">录用</td>

    </tr>
        <%
            for (int i = 0; i < interviewList.size(); i++) {
        %>
    <tr>
        <td><%=interviewList.get(i).getIv_rename()%></td>
        <td><%=interviewList.get(i).getIv_vname()%></td>
        <td><a href="showResumeDetail1?r_id=<%=interviewList.get(i).getIv_rid()%>">浏览</a></td>
            <%
                if(interviewList.get(i).getIv_invit()==0){
            %>

        <td>
            <a href="updateInterViewinvit?iv_id=<%=interviewList.get(i).getIv_id()%>">发送邀请</a>
        </td>
        <td></td>
        <td colspan="2"></td>
             <%
                }
                 else{
                     %>
                     <td>已发送邀请</td>
        <%
                        if(interviewList.get(i).getIv_receive()==0){
             %>
        <td>还未接受邀请</td>
        <td colspan="2"> </td>
             <%}
             else{
             %>
        <td>已接受邀请</td>
     <%   if(interviewList.get(i).getIv_offerid()==1){%>

       <td colspan="2">已录用</td>

        <%
        }
        else{
            %>

        <td colspan="2">
            <a href="addEmployee?iv_id=<%=interviewList.get(i).getIv_id()%>">录用</a>
        </td>
    </tr>
        <%
              }
                 }
            }
            %>
    </tr>
            <%
            }
            %>
            </table>
        <h3>${sessionScope.addemployeeMSg}</h3>
        <%
    }
   else{
       if(departmentList!=null){
        %>
          <table border="1" cellspacing="0" width="100%">
              <tr>
                  <td>部门名称</td>
              </tr>
                  <%for (int k = 0; k < departmentList.size(); k++) {%>
              <tr>
                  <td><%=departmentList.get(k).getDe_name()%></td>
              </tr>
              <%
                  }
       }
   }
              %>
          </table>
              <form action="addDepartment" method="post" id="addDepartmentform">
                 <label >添加部门：</label><input type="text" name="de_name">
                  确认添加：<input type="submit" value="添加">
              </form>
            <span>${sessionScope.addemErr}</span>
</div>
</div>
</body>
</html>

