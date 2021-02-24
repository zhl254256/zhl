<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/21
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>员工添加</title>
</head>
<body>
<h1>员工添加</h1>
<%
    pageContext.setAttribute("ctp",request.getContextPath());
%>
<form:form action="${ctp}/emp" modelAttribute="employee" method="post">
    <%--path就是name项
        1.当作原生的name项
        2.自动会先隐含模型中某个对象对应的这个属性值
    --%>
    lastName:<form:input path="lastName"/><br/>
    email:<form:input path="email"/><br/>
    gender:<br/>
        男:<form:radiobutton path="gender" value="1"/><br/>
        女:<form:radiobutton path="gender" value="0"/><br/>
    dept:<form:select path="department.id" items="${depts}" itemLabel="departmentName" itemValue="id"></form:select><br/>
    <input type="submit" value="保存">
</form:form>





<%--<form action="">
    lastName:<input type="text" name="lastName"/><br/>
    email:<input type="text" name="email"><br/>
    gender:<br/>
        男:<input type="radio" name="gender" value="1"><br/>
        女:<input type="radio" name="gender" value="0"><br/>
    dept：<select name="department.id">
            <c:forEach items="${depts}" var="deptItem">
                <option value="${deptItem.id}">${deptItem.departmentName}</option>
            </c:forEach>
         </select>
    <input type="submit" value="提交"/>
</form>--%>
</body>
</html>
