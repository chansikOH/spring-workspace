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
<c:set var="menu" value="notice" scope="page"/>
<%@ include file="common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>공지사항</h1>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<table class="table" id="notice-table">
				<colgroup>
					<col width="7%">
					<col width="*">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty notices }">
						<c:forEach var="notice" items="${notices }" varStatus="loop">
							<tr>
								<td>${loop.count }</td>
								<td>${notice.title }</td>
								<td><fmt:formatDate value="${notice.createDate }"/></td>
							</tr>
							<tr>
								<td></td>
								<td>
									${notice.contents }
								</td>
								<td></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" class="text-center">조회된 공지사항이 없습니다.</td>
						</tr>
						<tr></tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#notice-table tbody tr:odd").hide();
		
		// 제목행을 클릭하면 그 아래의 내용행이 표시되도록 합니다.
		// 제목행을 다시 클릭하면  내용행이 사라집니다.
		$("#notice-table tbody tr:even").click(function() {
			$(this).next().slideToggle();
		});
	})
</script>
</body>
</html>