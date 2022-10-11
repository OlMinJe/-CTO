<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
	<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
	<script type="text/javascript" src="/js/includeHtml.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
	<link rel="stylesheet" type="text/css" href="/css/login/login.css">
	<script type="text/javascript" src="/js/login.js"></script>
	<title>Login</title>

</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 login">
		<div class="title">로그인</div>
		<form action='<c:url value='/userCheck'/>' method="get" class="col-11 col-sm-8 col-md-6 col-lg-5"> <!--method="post" 안되서 get으로 바꿈-->
			<input type="text" class="box_eft_01" id="mb_id" name="mb_id" placeholder="아이디를 입력해주세요.">
			<input type="password" class="box_eft_01" id="mb_pw" name="mb_pw" placeholder="비밀번호를 입력해주세요.">
			<div class="col-12" style="margin-bottom: 20px;">
				<div class="col-7 user_id_pass">
					<input type="button" title="아이디 찾기" id="find_id_btn" value="아이디 찾기"
						   onclick="location.href='/login/find_id_form.jsp'">
					<input type="button" title="비밀번호 찾기" id="find_pw_btn" value="비밀번호 찾기"
						   onclick="location.href='/login/find_pw_form.jsp'">
				</div>
				<div class="col-5 new_user">
					<input type="button" value="회원가입" onclick="location.href='/login/register.jsp'">
				</div>
			</div>
			<input type="submit" value="로그인" class="btn box_eft_02">
		</form>
	</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>