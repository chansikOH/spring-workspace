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
    <style>
    	.table td {
    		vertical-align: middle !important;
    	}
    </style>
</head>
<body>
<c:set var="menu" value="cart" scope="page" />
<%@ include file="../common/nav.jsp" %>
<div class="container">
  	<div class="page-header">
  		<h1>장바구니</h1>
  	</div>
  	
  	<div class="row">
  		<div class="col-sm-12">
  			<div class="panel panel-default">
  				<div class="panel-heading">
  					${LOGIN_USER.name }님의 장바구니 목록입니다.
  				</div>
  				<div class="panel-body">
  					<table class="table">
  						<thead>
  							<tr>
  								<th></th>
  								<th>상품명</th>
  								<th>가격</th>
  								<th>등록일</th>
  								<th></th>
  							</tr>
  						</thead>
  						<tbody>
  						<c:choose>
  							<c:when test="${not empty products }">
  								<c:forEach var="product" items="${products }">
		  							<tr>
		  								<td>
		  									<img src="resources/images/${product.imgName }" alt="Nature" style="width: 120px; height:100px">
		  								</td>
		  								<td>${product.name }</td>
		  								<td><fmt:formatNumber value="${product.price }"/>원</td>
		  								<td><fmt:formatDate value="${product.createDate }"/></td>
		  								<td><a href="removeCart.do?proNo=${product.no }" class="btn btn-danger btn-sm">삭제</a></td>
		  							</tr>
  								</c:forEach>
  							</c:when>
  							<c:otherwise>
  								<tr>
  									<td colspan="5" class="text-center">장바구니에 상품이 없습니다.</td>
  								</tr>
  							</c:otherwise>
  						</c:choose>
  						</tbody>
  					</table>
  				</div>
  			</div>
  		</div>
  	</div>
</div>
</body>
</html>