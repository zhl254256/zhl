<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/21
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>员工修改</title>
</head>
<body>
<%
    pageContext.setAttribute("ctp",request.getContextPath());
%>
<h1>员工修改</h1>
<form:form action="${ctp}/emp/${employee.id}" modelAttribute="employee" method="post">
    <input type="hidden" name="_method" value="put"/>
    <input type="hidden" name="id" value="${employee.id}"/>
    email:<form:input path="email"/><br/>
    gender:&nbsp;&nbsp;&nbsp;
        男:<form:radiobutton path="gender" value="1"/>&nbsp;&nbsp;&nbsp;
        女:<form:radiobutton path="gender" value="0"/><br/>
    dept:<form:select path="department.id" items="${depts}" itemLabel="departmentName" itemValue="id"></form:select><br/>
    <input type="submit" value="修改">
</form:form>
</body>
</html>
