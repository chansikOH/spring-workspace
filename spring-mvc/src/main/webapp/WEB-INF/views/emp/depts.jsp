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
	<h1>모든 부서 정보</h1>
	 
	<table border="1" style="width: 100%">
		<thead>
			<tr>
				<th>부서 이름</th>
				<th>관리자 아이디</th>
				<th>지역 아이디</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="dept" items="${depts }">
			<tr>
				<td><a href="employees.do?deptid=${dept.departmentId }">${dept.departmentName }</a></td>
				<td>${dept.managerId }</td>
				<td>${dept.locationId }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div>
		<a href="form.do">새 사원 등록</a>
	</div>
</body>
</html>