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
<c:set var="menu" value="cate" scope="page" />
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>카테고리별 상품</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					카테고리
				</div>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="#" class="btn-print" data-id="new">신상품</a></li>
					<li><a href="#" class="btn-print" data-id="rec">추천상품</a></li>
					<c:forEach var="category" items="${categories }">
						<li><a href="#" class="btn-print" data-id="${category.id }">${category.name }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="col-sm-9">
			<div class="row" id="product-box" data-user="${LOGIN_USER.id }">
				<div class="col-md-12">
					<div class="thumbnail text-center" style="height: 250px">
						<h4 style="margin-top: 100px"><strong>카테고리를 선택하세요.</strong></h4>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('.btn-print').click(function(event) {
		event.preventDefault();
		var dataId = $(this).attr('data-id');
		$(this).parent().addClass('active').siblings().removeClass('active');
		
		$.ajax({
			type:'GET',
			url:'cateProduct.do',
			data: {dataId: dataId},
			dataType:'json',
			success:function(products) {
				$('#product-box').empty();
				
				if(products.length) {					
					$.each(products, function(index, product) {
						var formatter = new Intl.NumberFormat();
						var html = '<div class="col-md-4">';
						html += '<div class="thumbnail">';
						html += '<a href="detail.do">';
						html += '<img src="resources/images/'+product.imgName+'" alt="Nature" style="width: 100%">';
						html += '<a>';
						html += '<div class="caption">';
						html += '<h4>'+product.name+'</h4>';
						html += '<p>'+formatter.format(product.price)+'원</p>';
						html += '<div class="text-center"><button type="button" class="btn btn-primary btn-addCart" data-pro-no="'+product.no+'">담기</button></div>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						
						$('#product-box').append(html);
					});
				} else {
					var html = '<div class="col-md-12">';
					html += '<div class="thumbnail text-center" style="height: 250px">';
					html += '<h4 style="margin-top: 100px"><strong>상품이 없습니다.</strong></h4>';
					html += '</div>';
					html += '</div>';
					
					$('#product-box').append(html);
				}
			}
		});
	});
	
	$('#product-box').on('click', '.btn-addCart', function() {
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