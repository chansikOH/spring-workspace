<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="container">
	<div class="page-header">
		<h1>사원관리</h1>
	</div>
	
	<div class="row">
		<div class="col-sm-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">부서 목록</h3>
				</div>
				<ul class="list-group" id="dept-list-box"></ul>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						사원 목록 <button class="btn btn-primary btn-xs pull-right" id="btn-open-form">사원 등록</button>
					</h3>
				</div>
				<table class="table" id="emp-list-table">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>직종</th>
							<th>부서아이디</th>
							<th></th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div id="emp-form-modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">새 사원 등록</h4>
				</div>
				<div class="modal-body">
					<form class="well">
						<div class="form-group">
							<label>First Name</label>
							<input type="text" class="form-control" name="firstName" />
						</div>
						<div class="form-group">
							<label>Last Name</label>
							<input type="text" class="form-control" name="lastName" />
						</div>
						<div class="form-group">
							<label>Email</label>
							<input type="text" class="form-control" name="email" />
						</div>
						<div class="form-group">
							<label>Phone Number</label>
							<input type="text" class="form-control" name="phoneNumber" />
						</div>
						<div class="form-group">
							<label>Hire Date</label>
							<input type="date" class="form-control" name="hireDate" />
						</div>
						<div class="form-group">
							<label>Job Id</label>
							<select class="form-control" name="jobId">
								<option value="" selected disabled> 선택하세요</option>
								<c:forEach var="job" items="${jobs }">
									<option value="${job.id }">${job.title }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Salary</label>
							<input type="text" class="form-control" name="salary" />
						</div>
						<div class="form-group">
							<label>Commission Pct</label>
							<input type="text" class="form-control" name="commissionPct" />
						</div>
						<div class="form-group">
							<label>Manager Id</label>
							<select class="form-control" name="managerId">
								<option value="" selected disabled> 선택하세요</option>
								<c:forEach var="manager" items="${managers }">
									<option value="${manager.id }">${manager.firstName } ${manager.lastName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>Department Id</label>
							<select class="form-control" name="departmentId">
								<option value="" selected disabled> 선택하세요</option>
								<c:forEach var="department" items="${departments }">
									<option value="${department.id }">${department.name }</option>
								</c:forEach>
							</select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btn-add-emp">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function() {
	$.ajax({
		type:"GET",
		url:"depts",
		dataType:"json",
		success:function(depts) {
			$.each(depts, function(index, dept) {
				$('#dept-list-box').append('<li class="list-group-item" data-dept="'+dept.id+'">'+dept.name+'</li>')
			});
		}
	});

	$("#dept-list-box").on("click", ".list-group-item", function() {
		var deptId = $(this).attr('data-dept');
		
		$(this).addClass('active').siblings().removeClass('active');
		$('#emp-list-table tbody').empty();
		
		$.ajax({
			type:'GET',
			url:'emps/'+deptId,
			dataType:'json',
			success:function(emps) {
				
				if (emps.length) {
					$.each(emps, function(index, emp) {
						var row = '<tr>';
						row += '<td>'+emp.id+'</td>';
						row += '<td>'+emp.firstName+' '+emp.lastName+'</td>';
						row += '<td>'+emp.jobId+'</td>';
						row += '<td>'+emp.departmentId+'</td>';
						row += '<td><button class="btn btn-danger btn-xs" data-emp="'+emp.id+'">삭제</button></td>';
						row += '</tr>';
						
						$('#emp-list-table tbody').append(row);
					})
				} else {
					var row = '<tr>';
					row += '<td colspan="4" class="text-center">소속된 사원이 없습니다.</td>';
					row += '</tr>';
					$('#emp-list-table tbody').append(row);
				}
			}
		});
	});
	
	$('#emp-list-table tbody').on('click', 'button', function() {
		// var empId = $(this).parents('tr').find('td:first').text();
		var empId = $(this).attr('data-emp');
		
		$.ajax({
			type:'DELETE',
			url:'emps/'+empId,
			dataType:'json',
			success:function(emps) {

				$('#emp-list-table tbody').empty();
				$.each(emps, function(index, emp) {
					var row = '<tr>';
					row += '<td>'+emp.id+'</td>';
					row += '<td>'+emp.firstName+' '+emp.lastName+'</td>';
					row += '<td>'+emp.jobId+'</td>';
					row += '<td>'+emp.departmentId+'</td>';
					row += '<td><button class="btn btn-danger btn-xs" data-emp="'+emp.id+'">삭제</button></td>';
					row += '</tr>';
					
					$('#emp-list-table tbody').append(row);
				});
			},
			error:function() {
				alert('해당 사원정보는 삭제할 수 없습니다.');
			}
		});
	});
	
	$('#btn-open-form').click(function() {
		$('#emp-form-modal').modal('show');
	});
	
	$('#btn-add-emp').click(function() {
		var param = {
			firstName: $("[name=firstName]").val(),	
			lastName: $("[name=lastName]").val(),	
			email: $("[name=email]").val(),
			phoneNumber: $("[name=phoneNumber]").val(),	
			hireDate: $("[name=hireDate]").val(),	
			jobId: $("[name=jobId]").val(),
			salary: $("[name=salary]").val(),
			commissionPct: $("[name=commissionPct]").val(),	
			managerId: $("[name=managerId]").val(),
			departmentId: $("[name=departmentId]").val()
		};
		
		$.ajax({
			type:'POST',
			url:'emps',
			data: JSON.stringify(param),		// jsontext
			contentType: 'application/json',	// 서버로 보내는 데이터 타입
			dataType: 'json',					// 클라이언트가 받는 데이터 타입 
			success: function(emps) {
				
				$('#emp-list-table tbody').empty();
				$.each(emps, function(index, emp) {
					var row = '<tr>';
					row += '<td>'+emp.id+'</td>';
					row += '<td>'+emp.firstName+' '+emp.lastName+'</td>';
					row += '<td>'+emp.jobId+'</td>';
					row += '<td>'+emp.departmentId+'</td>';
					row += '<td><button class="btn btn-danger btn-xs" data-emp="'+emp.id+'">삭제</button></td>';
					row += '</tr>';
					
					$('#emp-list-table tbody').append(row);
				});
				
				var deptId = emps[0].departmentId;
				$('.list-group-item').filter('[data-dept='+deptId+']').addClass('active').siblings().removeClass('active');
				
				$("#emp-form-modal").modal('hide');
			}
		});
	});
	
	// 모달이 표시되기 전
	$('#emp-form-modal').on('show.bs.modal', function() {
		$('#emp-form-modal :input').val('');
		
	});
	
	// 모달이 사라질 때 
	$('#emp-form-modal').on('hide.bs.modal', function() {
	
	});
	
});
</script>
</body>
</html>