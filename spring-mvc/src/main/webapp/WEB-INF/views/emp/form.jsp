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
	<h1>사원 등록</h1>

	<form action="add.do" method="post">
		<p>이름 : <input type="text" name="firstName" /></p>
		<p>성 : <input type="text" name="lastName" /></p>
		<p>이메일 : <input type="text" name="email" /></p>
		<p>전화번호 : <input type="text" name="phoneNumber" /></p>
		<p>직종아이디
			<select name="jobId">
			<c:forEach var="jobId" items="${jobIds }">
				<option>${jobId }</option>
			</c:forEach>
			</select>
		</p>
		<p>급여 : <input type="text" name="salary" /></p>
		<p>커미션 : <input type="text" name="commissionPct" /></p>
		<p>매니저 아이디
			<select name="managerId">
			<c:forEach var="managerId" items="${managerIds }">
				<option>${managerId }</option>
			</c:forEach>
			</select>
		</p>
		<p>부서 아이디
			<select name="departmentId">
			<c:forEach var="deptId" items="${deptIds }">
				<option>${deptId }</option>
			</c:forEach>
			</select>
		</p>
		<button type="submit">등록</button>
	</form>
</body>
</html>