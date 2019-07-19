<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원 상세정보</h1>
	
	<table border="1" style="width: 100%">
		<tbody>
			<tr>
				<th><strong>사원 아이디</strong></th>
				<td>${employee.id }</td>
			</tr>
			<tr>
				<th><strong>사원 이름</strong></th>
				<td>${employee.firstName } ${employee.lastName }</td>
			</tr>
			<tr>
				<th><strong>이메일</strong></th>
				<td>${employee.email }</td>
			</tr>
			<tr>
				<th><strong>전화번호</strong></th>
				<td>${employee.phoneNumber }</td>
			</tr>
			<tr>
				<th><strong>입사일</strong></th>
				<td><fmt:formatDate value="${employee.hireDate }"/></td>
			</tr>
			<tr>
				<th><strong>직종 아이디</strong></th>
				<td>${employee.jobId }</td>
			</tr>
			<tr>
				<th><strong>급여</strong></th>
				<td><fmt:formatNumber value="${employee.salary }" />원</td>
			</tr>
			<tr>
				<th><strong>커미션</strong></th>
				<td>${employee.commissionPct }</td>
			</tr>
			<tr>
				<th><strong>관리자 아이디</strong></th>
				<td>${employee.managerId }</td>
			</tr>
			<tr>
				<th><strong>부서 아이디</strong></th>
				<td>${employee.departmentId }</td>
			</tr>
		</tbody>
	</table>
</body>
</html>