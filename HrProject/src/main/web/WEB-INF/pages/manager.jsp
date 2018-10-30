<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        var  arr=[];
        <c:forEach var="i" items="${departmentList}" >
        arr.push('${i.de_name}');
        </c:forEach>
        <c:forEach var="i" items="${departmentList}">
        arr["${i.de_name}"]=[];
        <c:forEach var="j" items="${positionList}">
        <c:if test="${j.p_deid==i.de_id}">
        arr["${i.de_name}"].push('${j.po_name}');
        arr["${j.po_name}"]=[];
        <c:forEach var="k" items="${employeeList}">
        <c:if test="${j.po_id==k.em_poid}">
        arr["${j.po_name}"].push('${k.em_acount}');
        </c:if>
        </c:forEach>
        </c:if>
        </c:forEach>
        </c:forEach>
        function Init(node) {
            return node.html("<option>---请选择---</option>");
        }
        $.each(db, function (changShang) {
            $("#selF").append("<option>" + changShang + "</option>");
        })
        //一级变动
        $("#selF").change(function () {
            //清空二三级
            Init($("#selB"));
            Init($("#selC"));
            $.each(db,function (cs,pps) {
                if ($("#selF option:selected").text() == cs) {
                    $.each(pps, function (pp, xhs) {
                        $("#selB").append("<option>" + pp + "</option>");
                    });
                    $("#selB").change(function () {
                        Init($("#selC"));
                        $.each(pps, function (pp,xhs) {
                            if ($("#selB option:selected").text()==pp) {
                                $.each(xhs.split(','), function () {
                                    $("#selC").append("<option>" + this + "</option>");
                                })
                            }
                        })
                    })
                }
            })
        })
    })
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
                <li class="onelevelmenu"><a href="getdepartment" style="text-decoration: none ">管理部门</a></li>
                <li class="onelevelmenu"><a href="getdepartment" style="text-decoration: none ">管理职位</a></li>
                <li class="onelevelmenu"><a href="getredicuritAll" style="text-decoration: none ">查看招聘信息</a></li>
                <li class="onelevelmenu"><a href="getAll" style="text-decoration: none ">查看所有</a></li>
            </ul>
        </div>
    </div>
</div>
<div style="width: 960px; height: 800px; background:#fff;margin: auto;position: relative;z-index: 1">
    <div style="width:800px; height:100% ; background-color: #ccffaa;margin: 0 auto" >

<c:if test="${requestScope.interviewList!=null}" var="inrerviewListFlag">
    <table border="1" cellspacing="0" width="100%">
        <tr>
            <td>职位名称</td>
            <td>求职人</td>
            <td>查看简历</td>
            <td>面试邀请</td>
            <td>是否已接受面试</td>
            <td colspan="2">录用</td>
        </tr>
        <c:forEach items="${requestScope.interviewList}" var="i">
        <tr>
            <td>${i.iv_poname}</td>
            <td>${i.iv_vname}</td>
            <td><a href="showResumeDetail1?r_id=${i.iv_rid}">浏览</a></td>
            <c:if test="${i.iv_invit==0}" var="invitFlag">
                <td>
                    <a href="updateInterViewinvit?iv_id=${i.iv_id}">发送邀请</a>
                 </td>
                <td ></td>
                <td ></td>
            </c:if>
            <c:if test="${not invitFlag}">
                <td>已发送邀请</td>
                <c:if test="${i.iv_receive==0}" var="reciveFlag">
                    <td>还未接受邀请</td>
                    <td ></td>
                 </c:if>
                 <c:if test="${not reciveFlag}">
                    <td>已接受邀请</td>
                    <c:if test="${i.iv_offerid==1}" var="offrtidFlag">
                        <td >已录用</td>
                    </c:if>
                    <c:if test="${not offrtidFlag}">
                        <td >
                            <a href="addEmployee?iv_id=${i.iv_id}">录用</a>
                        </td>

                    </c:if>
                </c:if>

            </c:if>
        </tr>
        </c:forEach>
    </table>
</c:if>
        <c:if test="${requestScope.employeeList!=null}">
            <table border="1" cellspacing="0" width="100%">
                <tr>
                    <td>员工名（账户）</td>
                    <td>职位</td>
                    <td>部门</td>
                    <td>状态</td>
                    <td>更换职位</td>
                </tr>
                <c:forEach items="${requestScope.employeeList}" var="i">
                    <tr>
                        <td>${i.em_acount}</td>
                        <td>${i.em_position}</td>
                        <td>${i.em_department}</td>
                        <c:if test="${i.em_status==0}">
                            <td>实习期</td>
                        </c:if>
                        <c:if test="${i.em_status==1}">
                            <td>正式员工</td>
                        </c:if>
                        <c:if test="${i.em_status==3}">
                            <td>休假</td>
                        </c:if>
                        <c:if test="${i.em_status==4}">
                            <td>离职</td>
                        </c:if>
                        <td><a href="updatePosition?em_id=${i.em_id}"><input  type="button" value="更新"></a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${requestScope.departmentList!=null}">
        <table border="1" cellspacing="0" width="100%">
            <tr>
                <td>序号</td>
                <td>ID</td>
                <td>名称</td>
                <td>创建日期</td>
                <td>更新</td>
                <td>删除</td>

            </tr>
            <c:forEach items="${requestScope.departmentList}" var="i">
                <td>i</td>
                <td>${i.de_id}</td>
                <td>${i.de_name}</td>
                <td>${i.de_createdate}</td>
                <td><a href="getDepartmentByid?de_id=${i.de_id}"><input  type="button" value="更新"></a></td>
                <td><a href="deleteDepartment?de_id=${i.de_id}"><input  type="button" value="删除"></a></td>
            </c:forEach>
        </table>
            ${sessionScope.deleteDepartMsg}
            ${sessionScope.updateDepartMsg}
        </c:if>
<c:if test="${requestScope.employeeList!=null&&requestScope.departmentList!=null&&requestScope.positionList!=null}">
        部门：<select id="selF">
        <option>---请选择---</option>
    </select>
        职位：<select id="selB">
        <option>---请选择---</option>
    </select>
        员工：<select id="selC">
        <option>---请选择---</option>
    </select>
</c:if>
</div>
</div>
</body>
</html>

