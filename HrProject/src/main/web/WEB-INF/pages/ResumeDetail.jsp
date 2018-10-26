<%@ page import="com.jun.model.Resume" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/10/25
  Time: 15:25
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
<%Resume resume  = (Resume) request.getAttribute("resume");
if (resume!=null){
%>
<%--个人简历界面--%>
<form method="post" action="updateResume" id="updateResumeForm">
    <h3 align="center">个人简历</h3>
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
        <%
            }
%>
</body>
</html>

