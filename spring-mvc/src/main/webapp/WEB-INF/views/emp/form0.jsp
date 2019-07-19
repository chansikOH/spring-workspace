<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사원 등록 폼</h1>
	
	<form method="post" action="register.do">
		<p>아이디: <input type="text" name="id" /></p>
		<p>이름: <input type="text" name="name" /></p>
		<p>소속부서: <input type="text" name="dept" /></p>
		<p>직급: <input type="text" name="position" /></p>
		<p>급여: <input type="text" name="salary" /></p>
		<p>커미션: <input type="text" name="commission" /></p>
		<p><button type="submit">등록</button></p>
	</form>
</body>
</html>