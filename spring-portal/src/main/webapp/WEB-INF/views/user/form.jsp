<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap Example</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<style type="text/css">
		.form-error {
			color: red;
			font-style: italic;
		}
	</style>
</head>
<body>
<c:set var="menu" value="register" scope="page"/>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>회원가입 폼</h1>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<form:form modelAttribute="userForm" cssClass="well" method="post" action="register.do" enctype="multipart/form-data">
				<div class="form-group">
					<label>아이디</label>
					<form:input path="id" cssClass="form-control" />
					<span class="help-block form-error"><form:errors path="id"></form:errors></span>
				</div>
				<div class="form-group">
					<label>이름</label>
					<form:input path="name" cssClass="form-control" />
					<span class="help-block form-error"><form:errors path="name"></form:errors></span>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<form:password path="password" cssClass="form-control" />
					<span class="help-block form-error"><form:errors path="password"></form:errors></span>
				</div>
				<div class="form-group">
					<label>이메일</label>
					<form:input path="email" cssClass="form-control" />
					<span class="help-block form-error"><form:errors path="email"></form:errors></span>
				</div>
				<div class="form-group">
					<label>전화번호</label>
					<form:input path="phone" cssClass="form-control" />
					<span class="help-block form-error"><form:errors path="phone"></form:errors></span>
				</div>
				<div class="form-group">
					<label>나이</label>
					<input type="number" name="age" class="form-control" />
					<span class="help-block form-error"><form:errors path="age"></form:errors></span>
				</div>
				<div class="form-group">
					<label>생일</label>
					<input type="date" name="birth" class="form-control" />
					<span class="help-block form-error"><form:errors path="birth"></form:errors></span>
				</div>
				<div class="form-group">
					<label>프로필사진</label>
					<input type="file" name="photofile" class="form-control" />
					<span class="help-block form-error"><form:errors path="photofile"></form:errors></span>
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form:form>
		</div>
	</div>
</div>

</body>
</html>