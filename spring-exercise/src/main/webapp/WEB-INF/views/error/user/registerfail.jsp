<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap Example</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="menu" value="register" scope="page"/>
<%@ include file="../../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>회원가입 오류 페이지</h1>
	</div>
	
	<div class="alert alert-danger">
		<strong>회원가입 실패</strong>
		<%=exception.getMessage() %>
	</div>
</div>

</body>
</html>