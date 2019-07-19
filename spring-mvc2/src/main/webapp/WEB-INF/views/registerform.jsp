<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>등록 폼</h1>
	<form action="register.do" method="post">
		<p><label>이름 : </label> <input type="text" name="name"></p>
		<p><label>아이디 : </label> <input type="text" name="id"></p>
		<p><label>비밀번호 : </label> <input type="text" name="password"></p>
		<p><label>이메일 : </label> <input type="text" name="email"></p>
		<p><button type="submit">등록</button> </p>
	</form>
</body>
</html>