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
		.freeboard-title {
			text-decoration: none;
			color: black;
			display: block;
		}
		.freeboard-title:hover {
			background-color: #d8d8d8;
			text-decoration: none;
			color: black;
		}
	</style>
</head>
<body>
<c:set var="menu" value="free" scope="page"/>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>자유 게시판</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty freeBoards }">
						<c:forEach var="freeboard" items="${freeBoards }">
							<tr>
								<td>${freeboard.no }</td>
								<td><a href="detail.do?no=${freeboard.no }" class="freeboard-title">${freeboard.title }</a></td>
								<td>${freeboard.writer }</td>
								<td><fmt:formatDate value="${freeboard.createDate }"/> </td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="text-center">조회된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-right">
		<a href="form.do" class="btn btn-info">새 글쓰기</a>
	</div>
</div>
</body>
</html>