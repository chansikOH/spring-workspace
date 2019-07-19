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
</head>
<body>
<c:set var="menu" value="free" scope="page"/>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>게시글 등록하기</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<form class="well" action="add.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name=title>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input type="text" class="form-control" name=writer>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea rows="20" class="form-control" name="contents"></textarea>
				</div>
				<div class="form-group">
					<label>사진첨부1</label>
					<input type="file" class="form-control" name=photofile1>
				</div>
				<div class="form-group">
					<label>사진첨부2</label>
					<input type="file" class="form-control" name=photofile2>
				</div>
				<div class="form-group">
					<label>사진첨부3</label>
					<input type="file" class="form-control" name=photofile3>
				</div>
				<div class="text-right">
					<button type="submit" class="btn btn-primary">등록하기</button>
				</div>
			</form>
		</div>
	</div>

</div>
</body>
</html>