<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
</head>
<body>
<h2>[게시판 수정]</h2>
<form action='<c:url value='/boardModify'/>' method="post" enctype="multipart/form-data">
	<div><label>글번호</label>
		 <input name="com_num" readonly="readonly" value="${data.com_num}">
	</div>
	<div><label>작성자</label>
		 <input name="mb_nick" readonly="readonly" value="${data.mb_nick}">
	</div>
	<div><label>카테고리</label>
		<input name="category" readonly="readonly" value="${data.com_category}">
	</div>
	<div><label>조회수</label>
		<input name="hit" readonly="readonly" value="${data.com_hit}">
	</div>
	<div>
		<label>제목</label>
		<textarea rows="5" cols="13" name="com_title">${data.com_title}</textarea>
	</div>
	<div>
		<label>내용</label>
		<textarea rows="5" cols="13" name="com_content">${data.com_content}</textarea>
	</div>
	<div>이미지
		<input type="file" name="file" id="com_photo">
	</div>

	<button type="submit">수정</button>
	<button type="button" onclick="location.href='/boardList?stateCode=${stateCode}&category=${data.com_category}'">돌아가기</button>
	<input type="hidden" name="stateCode" value="${stateCode}">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<input type="hidden" name="num" value="${data.com_num}">
</body>
</html>