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
		<h1>게시글 상세정보</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-12">
			<table class="table">
				<tbody>
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>
					<tr>
						<th>제목</th>
						<td colspan="3">${board.title }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${board.writer }</td>
						<th>등록일</th>
						<td><fmt:formatDate value="${board.createDate }"/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">${board.contents }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="3">${board.fileName1 }, ${board.fileName2 }, ${board.fileName3 }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="text-right">
		<a href="list.do" class="btn btn-default">목록</a>
	</div>
	
	<div class="page-header">
		<h4>전체 댓글</h4>
	</div>
	
	<div class="row" style="margin-top: 20px;">
		<div class="col-sm-12">
			<form method="post" action="addcomment.do">
				<input type="hidden" name="no" value="${board.no }"/>
				<div class="form-group">
					<textarea id="comment-text" rows="4" class="form-control" name="contents" placeholder="댓글을 입력하세요."></textarea>
				</div>
				<div class="text-right">
					<button type="button" id="btn-add-comment" class="btn btn-default btn-sm">댓글 등록</button>	
				</div>
			</form>
		</div>
	</div>
	
	<div id="comments-box" class="row" style="margin-top: 20px;">
	<c:forEach var="comment" items="${comments }">
		<div class="col-sm-12">
			<p class="text-left"><span class="label label-success"><strong>${comment.writer }</strong></span></p>
			<p>${comment.contents }</p>
			<hr/>
		</div>
	</c:forEach>
	</div>
	
	<div id="user-detail-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">작성자 정보</h4>
				</div>
				<div class="modal-body">
					<table class="table">
						<tbody>
							<tr>
								<th>이름</th><td id="name-cell"></td>
								<th>아이디</th><td id="id-cell"></td>
							</tr>
							<tr>
								<th>연락처</th><td id="phone-cell"></td>
								<th>이메일</th><td id="email-cell"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function() {
		$("#btn-add-comment").click(function() {
			var contents = $("[name=contents]").val();
			if(contents == '') {
				alert("내용을 입력하세요");
				return false;
			}
			
			$.ajax({
				type:"GET",
				url:"addcomment.do",
				data:{no:$("[name=no]").val(), contents:contents},
				dataType:"json",
				success:function(result) {
					$("#comments-box").empty();
					$('#comment-text').val("");
					
					$.each(result, function(index, item) {
						var html = "<div class='col-sm-12'>";
						html += "<p class='text-left'><span class='label label-success'><strong>"+item.writer+"</strong></span></p>";
						html += "<p>"+item.contents+"</p>";
						html += "<hr/>";
						html += "</div>";
						
						$("#comments-box").append(html);
					});
				}
			});
		});
	});
	
	$('#comments-box').on('click', '.label', function() {
		
		$.ajax({
			type:'GET',
			url:'../user/getUser.do',
			data:{id:$(this).text()},
			dataType:'json',
			success:function(result) {
				$("#name-cell").text(result.name);
				$("#id-cell").text(result.id);
				$("#phone-cell").text(result.phone);
				$("#email-cell").text(result.email);
				
				$('#user-detail-modal').modal('show');
			}
		});
	});
</script>
</body>
</html>