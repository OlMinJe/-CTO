<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>관리자 페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
	<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<script type="text/javascript" src="/js/includeHtml.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
	<link rel="stylesheet" type="text/css" href="/css/admin/admin.css">

	<script type="text/javascript">
		$(function (){
			$(".userDrop").click(function() {
				const dropId = $(this).data("user");
				console.log(dropId);
				$.ajax({
					type: "GET",
					url: "/dropId",
					data: {
						mb_id : dropId
					},
					success: function(data) {
						alert("해당 회원이 강제 탈퇴처리 되었습니다.");
						location.reload();
					}, error: function (status, error) {
						console.log('에러발생!!');
						console.log(status, error);
					}
				})
			})
		});
	</script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 admin">
	<div class="col-12 title">관리자 페이지</div>
	<table class="col-11 table table-striped table-bordered">
		<thead>
	<tr>
		<th>회원 고유번호</th>
		<th>회원 이름</th>
		<th>회원 아이디</th>
		<th>회원 닉네임</th>
		<th>회원 이메일</th>
		<th>회원 주소</th>
		<th>회원 성별</th>
		<th>전문가 여부</th>
		<th>가입일자</th>
		<th>회원 강제탈퇴</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach items="${memberlist}" var="data">
		<tr>
			<td>${data.mb_seq}</td>
			<td>${data.mb_name}</td>
			<td>${data.mb_id}</td>
			<td>${data.mb_nick}</td>
			<td>${data.mb_email}</td>
			<td>${data.mb_addr}</td>
			<td>${data.mb_sex}</td>
			<td>${data.mb_doctor}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.reg_date}"/></td>
			<td>
				<button type="button" id="userDrop" class="userDrop" data-user="${data.mb_id}">탈퇴 시키기</button>
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>