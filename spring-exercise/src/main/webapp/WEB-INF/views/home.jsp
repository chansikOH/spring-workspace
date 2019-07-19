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
<c:set var="menu" value="home" scope="page" />
<%@ include file="common/nav.jsp"%>
<div class="container">
	<div class="page-header">
		<h1>홈 페이지</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-6">
			<h4>
				진행중인 이벤트 <a href="events.do" class="btn btn-default btn-xs pull-right">더보기</a>
			</h4>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
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
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" class="text-center">진행중인 이벤트가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
		<div class="col-sm-6">
			<h4>
				공지사항 <a href="notices.do" class="btn btn-default btn-xs pull-right">더보기</a>
			</h4>
			<table class="table">
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
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="3" class="text-center">공지사항이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">추천상품</div>
				<div class="panel-body">
					<div class="row">
					<c:choose>
						<c:when test="${not empty recommendProducts }">
							<c:forEach var="product" items="${recommendProducts }">
								<div class="col-md-3">
									<div class="thumbnail">
										<a href="detail.do"> 
											<img src="resources/images/${product.imgName }" alt="Nature" style="width: 100%">
										</a>
										<div class="caption">
											<h4>${product.name }</h4>
											<p><fmt:formatNumber value="${product.price }" />원</p>
											<div class="text-center"><button class="btn btn-primary btn-addCart" data-pro-no="${product.no }">담기</button></div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="col-md-12">
									<div class="thumbnail text-center" style="height: 250px">
										<h4 style="margin-top: 100px"><strong>추천상품이 없습니다.</strong></h4>
									</div>
								</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">최신상품</div>
				<div class="panel-body">
					<div class="row">
					<c:choose>
						<c:when test="${not empty newProducts }">
							<c:forEach var="product" items="${newProducts }">
								<div class="col-md-3">
									<div class="thumbnail">
										<a href="detail.do"> 
											<img src="resources/images/${product.imgName }" alt="Nature" style="width: 100%">
										</a>
										<div class="caption">
											<h4>${product.name }</h4>
											<p><fmt:formatNumber value="${product.price }" />원</p>
											<div class="text-center"><button class="btn btn-primary btn-addCart" data-pro-no="${product.no }">담기</button></div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="col-md-12">
									<div class="thumbnail text-center" style="height: 250px">
										<h4 style="margin-top: 100px"><strong>최신상품이 없습니다.</strong></h4>
									</div>
								</div>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('.btn-addCart').click(function() {
		var proNo = $(this).attr('data-pro-no');
		$.ajax({
			type:'get',
			url:'addCart.do',
			data:{proNo: proNo},
			dataType:'text',
			success:function(check) {
				if(check == '') {
					alert('상품이 장바구니에 담겼습니다.');
				}
				if(check == 'check') {
					alert('장바구니에 이미 상품이 있습니다.');
				}
				if(check == 'login') {
					alert('로그인이 필요합니다');
				}
			}
		});
	});
</script>
</body>
</html>