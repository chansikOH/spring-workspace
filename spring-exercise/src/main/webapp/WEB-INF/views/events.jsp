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
<c:set var="menu" value="event" scope="page"/>
<%@ include file="common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>이벤트 목록</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<table class="table" id="event-table">
				<colgroup>
					<col width="7%">
					<col width="*">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty events }">
						<c:forEach var="event" items="${events }" varStatus="loop">
							<tr>
								<td>${loop.count }</td>
								<td>${event.title }</td>
								<td><fmt:formatDate value="${event.createDate }"/></td>
								<td>
								<c:choose>
									<c:when test="${event.active eq 'Y' }">
										<span class="label label-success">진행중</span>
									</c:when>
									<c:otherwise>
										<span class="label label-default">종료</span>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									${event.contents }
								</td>
								<td></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="text-center">조회된 이벤트가 없습니다.</td>
						</tr>
						<tr></tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(function() {
		$("#event-table tbody tr:odd").hide();
		
		$('#event-table tbody tr:even').click(function() {
			$(this).next().slideToggle();
		});
	})
</script>
</body>
</html>