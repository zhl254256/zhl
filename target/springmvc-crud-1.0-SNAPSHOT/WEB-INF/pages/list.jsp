<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/21
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<%
    pageContext.setAttribute("ctp",request.getContextPath());
%>
<head>
    <title>员工列表</title>
    <script type="text/javascript" src="${ctp}/scripts/jquery-1.9.1.min.js"></script>
</head>
<body>
<h1>员工列表</h1>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>lastName</th>
        <th>email</th>
        <th>gender</th>
        <th>departmentName</th>
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    <c:forEach items="${emps}" var="emp">
        <tr>
            <td>${emp.id}</td>
            <td>${emp.lastName}</td>
            <td>${emp.email}</td>
            <td>${emp.gender==0?"女":"男"}</td>
            <td>${emp.department.departmentName}</td>
            <td>
                <a href="${ctp}/emp/${emp.id}">edit</a>
            </td>
            <td>
                <a href="${ctp}/emp/${emp.id}" class="delBtn">delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="hello?i=10">click here</a>
<a href="login?username=admin">click here to login</a>
<a href="${ctp}/toaddpage">添加员工</a>
    <form:form id="deleteForm" action="${ctp}/emp/${emp.id}" method="post">
        <input type="hidden" name="_method" value="DELETE"/>
    </form:form>
    <script type="text/javascript">
        $(function(){
            $(".delBtn").click(function(){
                //改变表单的action指向
                $("#deleteForm").attr("action",this.href);
                //提交表单
                $("#deleteForm").submit();
                return false;
            });
        });
    </script>
</body>
</html>
