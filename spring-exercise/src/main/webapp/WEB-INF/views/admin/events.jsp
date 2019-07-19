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
		<h1>이벤트 관리 <button class="btn btn-default pull-right" id="btn-open-modal">등록</button></h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<table class="table" id="event-table">
				<colgroup>
					<col width="7%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty events }">
						<c:forEach var="event" items="${events }" varStatus="loop">
							<tr data-no="${event.no }">
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
								<td>
								<c:choose>
									<c:when test="${event.active eq 'N' }">
										<button class="btn btn-primary btn-xs btn-active">시작</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-danger btn-xs btn-active">종료</button>
									</c:otherwise>
								</c:choose>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="3">
									${event.contents }
								</td>
								<td></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="text-center">조회된 이벤트가 없습니다.</td>
						</tr>
						<tr></tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		</div>
	</div>

	<div id="event-form-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">신규 이벤트 등록</h4>
				</div>
				<div class="modal-body">
					<form class="well" method="post" action="">
						<div class="form-group">
							<label>제목</label>
							<input type="text" class="form-control" name="title" />
						</div>
						<div class="form-group">
							<label>이벤트 내용</label>
							<textarea rows="3" class="form-control" name="contents"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn-add-event">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#btn-open-modal").click(function() {
			$("#event-form-modal").modal('show');
		});
		
		$('#event-form-modal').on('show.bs.modal', function() {
			$('#event-form-modal :input').val('');
		});
		
		$('#btn-add-event').click(function() {
			var param = {
					title: $('[name=title]').val(),
					contents: $('[name=contents]').val()
			};
			
			$.ajax({
				type: 'POST',
				url: 'addEvent.do',
				data: JSON.stringify(param),
				contentType: 'application/json',
				dataType: 'json',
				success: function(events) {
					$('#event-table tbody').empty();
					
					$.each(events, function(index, event) {
						var count = index +1;
						var d = new Date(event.createDate);
						var month = d.getMonth() + 1;
						var day = d.getDate();
						var year = d.getFullYear();

						var date = year + '. ' + month + '. ' + day;
						
						var html = '<tr data-no="'+event.no+'">';
						html += '<td>'+count+'</td>';
						html += '<td>'+event.title+'</td>';
						html += '<td>'+date+'</td>';
						html += '<td>';
						if (event.active == 'Y') {
							html += '<span class="label label-success">진행중</span>';
						} else if (event.active == 'N') {
							html += '<span class="label label-default">종료</span>';
						}
						html += '</td>';
						html += '<td>';
						if (event.active == 'N') {							
							html += '<button class="btn btn-primary btn-xs btn-active">시작</button> ';
						} else if (event.active == 'Y') {
							html += '<button class="btn btn-danger btn-xs btn-active">종료</button>';
						}
						html += '</td>';							
						html += '</tr>';
						html += '<tr>';
						html += '<td></td>';
						html += '<td colspan="3">'+event.contents+'</td>';
						html += '<td></td>';
						html += '</tr>';
						
						$('#event-table tbody').append(html);
					});
					
					$('#event-form-modal').modal('hide');
				}
			});
		});
		
		$('#event-table tbody').on('click', '.btn-active', function() {
			var dataNo = $(this).parents('tr').attr('data-no');
			
			$.ajax({
				type:'GET',
				url:'switchEvent.do?eventNo='+dataNo,
				dataType:'json',
				success: function(events) {
					$('#event-table tbody').empty();
					
					if(events.length) {
						$.each(events, function(index, event) {
							var count = index +1;
							var d = new Date(event.createDate);
							var month = d.getMonth() + 1;
							var day = d.getDate();
							var year = d.getFullYear();

							var date = year + '. ' + month + '. ' + day;
							
							var html = '<tr data-no="'+event.no+'">';
							html += '<td>'+count+'</td>';
							html += '<td>'+event.title+'</td>';
							html += '<td>'+date+'</td>';
							html += '<td>';
							if (event.active == 'Y') {
								html += '<span class="label label-success">진행중</span>';
							} else if (event.active == 'N') {
								html += '<span class="label label-default">종료</span>';
							}
							html += '</td>';
							html += '<td>';
							if (event.active == 'N') {							
								html += '<button class="btn btn-primary btn-xs btn-active">시작</button> ';
							} else if (event.active == 'Y') {
								html += '<button class="btn btn-danger btn-xs btn-active">종료</button>';
							}
							html += '</td>';							
							html += '</tr>';
							html += '<tr>';
							html += '<td></td>';
							html += '<td colspan="3">'+event.contents+'</td>';
							html += '<td></td>';
							html += '</tr>';
							
							$('#event-table tbody').append(html);
						});
					} else {
						var html = '<tr>';
						html += '<td colspan="5" class="text-center">조회된 공지사항이 없습니다.</td>';
						html += '</tr>';
						html += '<tr></tr>';
						
						$('#event-table tbody').append(html);
					}
				}
			});
		});
	})
</script>
</body>
</html>