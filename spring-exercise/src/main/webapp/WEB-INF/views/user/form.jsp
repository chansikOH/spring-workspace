<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:set var="menu" value="register" scope="page" />
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>회원가입</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<form class="well" method="post" action="register.do">
				<div class="form-group">
					<label>이름</label>
					<input type="text" id="name" class="form-control" name="name" />
				</div>
				<div class="form-group">
					<label>아이디</label>
					<input type="text" id="id" class="form-control" name="id" />
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" id="password" class="form-control" name="password" />
				</div>
				<div class="form-group">
					<label>이메일</label>
					<input type="text" id="email" class="form-control" name="email" />
				</div>
				<div class="text-right">
					<button type="submit" id="btn-register" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#btn-register').click(function(event) {
		if($('#name').val() == '') {
			event.preventDefault();
			alert('이름을 입력해주세요');
			$('#name').focus();
			return;
		}
		
		if($('#id').val() == '') {
			event.preventDefault();
			alert('아이디를 입력하세요');
			$('#id').focus();
			return;
		}
		
		if($('#password').val() == '') {
			event.preventDefault();
			alert('비밀번호를 입력하세요');
			$('#password').focus();
			return;
		}
		
		if($('#email').val() == '') {
			event.preventDefault();
			alert('이메일을 입력하세요');
			$('#email').focus();
			return;
		}	
	});
</script>
</body>
</html>