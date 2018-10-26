<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="com.jun.model.Recruit" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jun.model.Resume" %>
<%@ page import="com.jun.model.Interview" %><%--
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
    <%
        List<Recruit> recruitList = (List<Recruit>)request.getAttribute("recruitList");
        if (recruitList!=null){
    %>
    <h3 align="center">招聘信息</h3>
    <table border="1" align="center" >

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
                <form action="showResumeAll" method="post">
                    <input type="hidden" name="re_id" value="<%=recruitList.get(i).getRe_id()%>">
                    <input type="submit"value="投递简历">
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
       <%
        /* 挑选简历*/
      List<Resume> resumeList  = (List<Resume>) request.getAttribute("resumeList");
        if (resumeList!=null){
    %>
       <table border="1" align="center" >

           <tr>
               <td>序号</td>
               <td>简历名称</td>
               <td>详情查看</td>
               <td>选择</td>


           </tr>
           <%
               for (int i = 0; i < resumeList.size(); i++) {
           %>
           <tr>
               <td><%=resumeList.get(i).getR_id()%></td>
               <td>简历<%=i%></td>
               <td>
                  <a href="showResumeDetail?r_id=<%=resumeList.get(i).getR_id()%>">查看</a>
               </td>
               <td>
                   <a href="addInterview?iv_rid=<%=resumeList.get(i).getR_id()%>">选择</a>
               </td>

       </table>
       <%
           }
           }
           List<Resume> resumeList1  = (List<Resume>) request.getAttribute("resumeList1");
           if (resumeList1!=null){
       %>
       <table border="1" align="center" >

           <tr>
               <td>序号</td>
               <td>简历名称</td>
               <td>详情查看</td>
           </tr>
           <%
               for (int i = 0; i < resumeList1.size(); i++) {
           %>
           <tr>
               <td><%=resumeList1.get(i).getR_id()%></td>
               <td>简历<%=i%></td>
               <td>
                   <a href="showResumeDetail?r_id=<%=resumeList1.get(i).getR_id()%>">查看</a>
               </td>
       </table>
       ${sessionScope.ReERR}
       <%
               }
           }
           Resume resume  = (Resume) request.getAttribute("resume");
           if (resume!=null){
        %>
    <%--个人简历界面--%>
    <form  method="post" action="updateResume" id="updateResumeForm">
        <h3 align="center">个人简历</h3>
        <input type="hidden" name="r_id"  value="<%=resume.getR_name()%>">
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
    <div  align="center">
        <ul class="nav nav-meau nav-inline nav-pills nav-navicon" >
            <li class="onelevelmenu"><a  href="deleteResumes?r_id=<%=resume.getR_id()%>" style="text-decoration: none ">删除简历</a></li>
            <li class="onelevelmenu"><button type="submit" value="更新"  form="updateResumeForm" style="text-decoration: none ">更新简历</button></li>
        </ul>
    </div>
        <%
            }
%>
        <%--投递信息--%>
            <%
            List<Interview> interviewList=(List<Interview>) request.getAttribute("interviewList");
            if(interviewList!=null) {
            %>
        <h3 align="center">投递信息</h3>
        <span><a >返回公司首页</a></span>
        <table border="1" cellspacing="0" width="100%">

            <tr>
                <td>职位名称</td>
                <td>求职人</td>
                <td>收到面试邀请</td>
                <td>接受面试邀请</td>
                <td>是否录用</td>

            </tr>
                <% for (int i = 0; i < interviewList.size(); i++) {%>
            <tr>
                <td><%=interviewList.get(i).getIv_rename()%></td>
                <td><%=interviewList.get(i).getIv_vname()%></td>
                    <%   if(interviewList.get(i).getIv_invit()==0){%>
                <td>未收到</td>
                <td></td>
                    <%
                         }
                         else{
                     %>
                <td>(已收到)<a href="getInvitmessage?iv_id=<%=interviewList.get(i).getIv_id()%>"> 查看邀请信息</a></td>
                    <%

                        if(interviewList.get(i).getIv_receive()==0) {
                    %>
                <td><a href="updateInterViewReceive?iv_id=<%=interviewList.get(i).getIv_id()%>">接受面试邀请</a> </td>
                <td></td>
                    <%
                        } else{
                    %>
                    <td>已接受</td>
                     <%
                         }
                    if(interviewList.get(i).getIv_offerid()==1){
                     %>
                    <td>(已收到)<a href="getOfferDetail?iv_id=<%=interviewList.get(i).getIv_id()%>">查看offer</a> </td>

                    <%
                    } else{

                    %>
                     <td>未收到offer</td>
                <%
                    }
             }
                %>
             </tr>
            <%
        }
            %>

        </table>
        <%
    }
    %>
            <%-- 面试邀请--%>
       <%
       Interview interviewMsg = (Interview)request.getAttribute("interviewMsg");
        if (interviewMsg!=null){
    %>
                <h3> <%=interviewMsg.getIv_vname()%> 先生你好</h3>
                <h3>您投递的 <%=interviewMsg.getIv_rename()%> 岗位请求已收到，请于 后天上午10点来我司面试</h3>
                <h3>谢谢</h3>
                <h3>日期：<fmt:formatDate value="<%=interviewMsg .getIv_date() %>" pattern="yyyy年MM月dd日" />    </h3>
            <%
                    }
            %>
                    <%
       Interview offerview = (Interview)request.getAttribute("offerview");
        if (offerview!=null){
    %>
                <h3> <%=offerview.getIv_vname()%> 先生（女士）你好</h3>
                <h3>您投递的 <%=offerview.getIv_rename()%> 岗位请求已收到，请于 后天上午9点准时上班</h3>
                <h3>谢谢</h3>
                <h3>日期：<fmt:formatDate value="<%=offerview.getIv_offerDate()%>" pattern="yyyy年MM月dd日" />    </h3>
                    <%
                    }
            %>
 </div>
</div>
</body>
</html>

