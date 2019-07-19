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
<c:set var="menu" value="login" scope="page" />
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>로그인</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<form class="well" method="post" action="login.do">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" id="id" class="form-control" name="id" />
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" id="password" class="form-control" name="password" />
				</div>
				<div class="text-right">
					<button type="submit" id="btn-login" class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('#btn-login').click(function(event) {
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
	})
</script>
</body>
</html>