<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<script type="text/javascript">
function confirm() {
	var title = $("#com_title").val().trim();
	var content =  $("#com_content").val().trim();

	if(title == "") {
		alert("제목을 입력해주세요.");
	} else if(content == "") {
		alert("내용을 입력해주세요.");
	}
	
	if(title != "" && title != "") {
		location.href="/boardWrite";
	}
}
</script>
</head>
<body>
<h2>[게시판 글쓰기]</h2>
<form action='<c:url value='/boardWrite'/>' method="post" enctype="multipart/form-data">
	<div>
		카테고리
		<input type="radio" name="com_category" value="0" checked="checked">일상
		<input type="radio" name="com_category" value="1">취미
		<input type="radio" name="com_category" value="2">유머
		<input type="radio" name="com_category" value="3">음식
		<input type="radio" name="com_category" value="4">정보
		<input type="radio" name="com_category" value="5">취업/진로
		<input type="radio" name="com_category" value="6">기타
	</div><br>
	<div>작성자<input type="text" name="mb_nick" value="${modifyNick}" readonly="readonly"></div>
	<div>제목<input type="text" id="com_title" name="com_title"></div>
	<div>내용<textarea rows="5" cols="13" id="com_content" name="com_content"></textarea></div>

	<input type="file" name="file" id="com_photo">

	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="stateCode" value="${stateCode}"/>
	<input type="hidden" name="stateCode" value="${category}"/>
	<button type="button" onclick="location.href='/boardList?stateCode=${stateCode}&category=${category}'">목록</button>
	<button type="submit" onclick="confirm()">완료</button>
</form>
</body>
</html>