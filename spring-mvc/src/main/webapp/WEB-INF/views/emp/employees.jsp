<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exercise</title>
</head>
<body>
	<h1>부서별 사원 목록</h1>
	
	<h3><strong>${dept.departmentName }</strong></h3>
	
	<table border="1" style="width: 100%">
		<tbody>
		<c:forEach var="employee" items="${employees }">
			<tr>
				<th><strong>사원 이름</strong> </th>
				<td><a href="employee.do?empid=${employee.id }">${employee.firstName } ${employee.lastName }</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>