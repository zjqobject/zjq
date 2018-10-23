<%@ page import="com.jun.model.Recruit" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jun.model.Resume" %><%--
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
    <style type="text/css">
        td{
            text-align:center;
            width:100px;
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
            <li class="nav-head"><a href="#" style="text-decoration: none ">
                <img src="/images/logo1.png">
            </a></li>
            <li class="onelevelmenu"><a style="text-decoration: none ">关于公司</a></li>
            <li class="onelevelmenu"><a style="text-decoration: none ">产品与应用</a></li>
            <li class="onelevelmenu"><a style="text-decoration: none ">服务支持</a></li>
            <li class="onelevelmenu"><a href="showRecruit?currentpage=1" style="text-decoration: none ">加入我们</a></li>

        </ul>
    </div>
</div>
</div>
<div style="width: 1200px; background:#fff;margin: auto;position: relative;z-index: 1">
    <%
        List<Recruit> recruitList = (List<Recruit>)request.getAttribute("recruitList");
        if (recruitList!=null){
    %>
    <h3 align="center">招聘信息</h3>
    <table border="1" cellspacing="0" width="100%">

        <tr>
            <td>职位名称</td>
            <td>职位需求</td>
            <td>工作地点</td>
            <td>薪资待遇</td>
            <td>学历要求</td>
            <td>公司福利</td>
            <td>工作经验要求</td>
            <td>简历投递</td>

        </tr>
        <%
            for (int i = 0; i < recruitList.size(); i++) {
        %>
        <tr>
            <td><%=recruitList.get(i).getRe_position()%></td>
            <td><%=recruitList.get(i).getRe_needs()%></td>
            <td><%=recruitList.get(i).getRe_address()%></td>
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
            <td><%=recruitList.get(i).getRe_education()%></td>
            <td><%=recruitList.get(i).getRe_welfare()%></td>
            <td><%=recruitList.get(i).getRe_years()%>年</td>
            <td>
                <form action="showResume" method="post">
                    <input type="hidden" name="re_id" value="<%=recruitList.get(i).getRe_id()%>">
                    <input type="submit"value="简历投递">
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
       Resume resume  = (Resume) request.getAttribute("resume");
        if (resume!=null){
    %>
    <form method="post" action="updateResume">
    <table border="1" align="center">
        <!--第一行-->
        <tr>
            <td>姓名</td>
            <td><input type="text" name="r_name"  value="<%=resume.getR_name()%>"> </td>
            <td>性别</td>
            <td><input type="text" name="r_sex" value="<%=resume.getR_sex()%>"></td>
            <td>出生年月</td>
            <td><input type="text" name="r_borndate" value="<%=resume.getR_borndate()%>"></td>
            <td rowspan="4"><input type="file"></td>
        </tr>
        <!--第二行-->
        <tr>
            <td>民族</td>
            <td><input type="text" name="r_nation" value="<%=resume.getR_nation()%>"></td>
            <td>政治面貌</td>
            <td><input type="text"  name="r_politics"value="<%=resume.getR_politics()%>"></td>
            <td>身高</td>
            <td><input type="text"  name="r_height"value="<%=resume.getR_height()%>"></td>
        </tr>
        <!--第三行-->
        <tr>
            <td>学制</td>
            <td><input type="text" name="r_edusystem" value="<%=resume.getR_edusystem()%>"></td>
            <td>学历</td>
            <td><input type="text" name="r_education" value="<%=resume.getR_education()%>"></td>
            <td>户籍</td>
            <td><input type="text"  name="r_naviteplace"value="<%=resume.getR_naviteplace()%>"></td>
        </tr>
        <!--第四行-->
        <tr>
            <td>专业</td>
            <td><input type="text"  name="r_specialty" value="<%=resume.getR_specialty()%>"></td>
            <td colspan="2">毕业学校</td>
            <td colspan="2"><input type="text" name="r_college"value="<%=resume.getR_college()%>"></td>
        </tr>
        <tr>
            <td colspan="7" ><b>技能、特长或爱好</b> </td>
        </tr>
        <tr>
            <td>外语等级</td>
            <td colspan="2"><input type="text" name="r_englevel" value="<%=resume.getR_englevel()%>"></td>
            <td>计算机</td>
            <td colspan="3"><input type="text" name="r_comlevel"value="<%=resume.getR_complevel()%>"></td>
        </tr>
        <tr>
            <td colspan="7" >工作经历</td>
        </tr>
        <tr>
            <td colspan="7" ><input rows="2" name="r_workexperience"value="<%=resume.getR_workexperience()%>"></td>
        </tr>
        <tr>
            <td colspan="7" >教育经历</td>
        </tr>
        <tr>
            <td colspan="7" ><input rows="2" name="r_educatexp" value="<%=resume.getR_educatexp()%>"></td>
        </tr>
        <tr>
            <td colspan="7">联系方式</td>
        </tr>
        <tr>
            <td>通信地址</td>
            <td colspan="2"><input type="text" name="r_address" value="<%=resume.getR_address()%>"></td>
            <td>联系电话</td>
            <td colspan="3"><input type="text" name="r_phone" value="<%=resume.getR_phone()%>"></td>
        </tr>
        <tr>
            <td>E-mail</td>
            <td colspan="2"><input type="text" name="r_email" value="<%=resume.getR_email()%>"></td>
            <td>邮编</td>
            <td colspan="3"><input type="text" name="r_postcode" value="<%=resume.getR_postcode()%>"></td>
        </tr>
        <tr>
            <td colspan="7">自我评价</td>
        </tr>
        <tr>
            <td colspan="7" ><input rows="5" name="r_evaluate"value="<%=resume.getR_evaluate()%>"></td>
        </tr>

    </table>
    </form>
            <div style="width: 100px ;height: 30px" align="center">
                <form action="postresume" method="post">
                    <input type="hidden" name="r_id" value="<%=resume.getR_id()%>">
                    <input type="submit"value="简历投递">
                </form>
            </div>
  <%
        }
        else{
            if(recruitList==null){
  %>
    <p align="center"><a href="addResume.jsp">添加简历</a></p>
    <%
        }
        }
    %>
</div>

</body>
</html>

