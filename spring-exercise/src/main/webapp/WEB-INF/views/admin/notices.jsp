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
<c:set var="menu" value="admin" scope="page"/>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="page-header">
		<h1>공지사항 관리 <button class="btn btn-default pull-right" id="btn-open-modal">등록</button></h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<table class="table" id="notice-table">
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
						<th></th>
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
								<td>
									<button class="btn btn-danger btn-xs removeNotice" data-no="${notice.no }">삭제</button>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2">
									${notice.contents }
								</td>
								<td></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" class="text-center">조회된 공지사항이 없습니다.</td>
						</tr>
						<tr></tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="notice-form-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">신규 공지사항 등록</h4>
				</div>
				<div class="modal-body">
					<form class="well" method="post" action="">
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" name="title" />
						</div>
						<div class="form-group">
							<label>공지 내용</label>
							<textarea rows="3" class="form-control" name="contents"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn-add-notice">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#btn-open-modal").click(function() {
			$("#notice-form-modal").modal('show');
		});
		
		$('#notice-form-modal').on('show.bs.modal', function() {
			$('#notice-form-modal :input').val('');
		});
		
		$('#btn-add-notice').click(function() {
			var param = {
					title: $('[name=title]').val(),
					contents: $('[name=contents]').val()
			};

			$.ajax({
				type:'POST',
				url:'addNotice.do',
				data: JSON.stringify(param),
				contentType: 'application/json',
				dataType: 'json',
				success: function(notices) {
					$('#notice-table tbody').empty();
					
					$.each(notices, function(index, notice) {
						var count = index +1;
						var d = new Date(notice.createDate);
						var month = d.getMonth() + 1;
						var day = d.getDate();
						var year = d.getFullYear();

						var date = year + '. ' + month + '. ' + day;
						
						var html = '<tr>';
						html += '<td>'+count+'</td>';
						html += '<td>'+notice.title+'</td>';
						html += '<td>'+date+'</td>';
						html += '<td>';
						html += '<button class="btn btn-danger btn-xs removeNotice" data-no="'+notice.no+'">삭제</button>';
						html += '</td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td></td>';
						html += '<td colspan="2">'+notice.contents+'</td>';
						html += '<td></td>';
						html += '</tr>';
						
						$('#notice-table tbody').append(html);
					});
					
					$('#notice-form-modal').modal('hide');
				}
			});
		});
		
		$('#notice-table tbody').on('click', '.removeNotice', function() {
			var dataNo = $(this).attr('data-no');
			
			$.ajax({
				type:'GET',
				url:'removeNotice/'+ dataNo + '.do',
				dataType: 'json',
				success: function(notices) {
					$('#notice-table tbody').empty();
					
					if(notices.length) {
						$.each(notices, function(index, notice) {
							var count = index +1;
							var d = new Date(notice.createDate);
							var month = d.getMonth() + 1;
							var day = d.getDate();
							var year = d.getFullYear();

							var date = year + '. ' + month + '. ' + day;
							
							var html = '<tr>';
							html += '<td>'+count+'</td>';
							html += '<td>'+notice.title+'</td>';
							html += '<td>'+date+'</td>';
							html += '<td>';
							html += '<button class="btn btn-danger btn-xs removeNotice" data-no="'+notice.no+'">삭제</button>';
							html += '</td>';
							html += '</tr>';
							html += '<tr>';
							html += '<td></td>';
							html += '<td colspan="2">'+notice.contents+'</td>';
							html += '<td></td>';
							html += '</tr>';
							
							$('#notice-table tbody').append(html);
						})
					} else {
						var html = '<tr>';
						html += '<td colspan="4" class="text-center">조회된 공지사항이 없습니다.</td>';
						html += '</tr>';
						html += '<tr></tr>';
						
						$('#notice-table tbody').append(html);
					}
				}
			})
		});
	})
</script>
</body>
</html>