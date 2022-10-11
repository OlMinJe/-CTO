<%@ page import="com.helloproject.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
</head>
<body>
<h2>[게시판 내용]</h2>
<form name="form" method="post">
	<div>글번호<input name="com_num" readonly="readonly" value="${data.com_num}"></div>
	<div>카테고리
		<c:choose>
			<c:when test="${data.com_category == 0}">
				<label>일상</label>
			</c:when>
			<c:when test="${data.com_category == 1}">
				<label>취미</label>
			</c:when>
			<c:when test="${data.com_category == 2}">
				<label>유머</label>
			</c:when>
			<c:when test="${data.com_category == 3}">
				<label>음식</label>
			</c:when>
			<c:when test="${data.com_category == 4}">
				<label>정보</label>
			</c:when>
			<c:when test="${data.com_category == 5}">
				<label>취업/진로</label>
			</c:when>
			<c:when test="${data.com_category == 6}">
				<label>기타</label>
			</c:when>
		</c:choose>
	</div>
	<div>제목<input name="title" readonly="readonly" value="${data.com_title}"></div>
	<div>내용<input name="content" readonly="readonly" value="${data.com_content}"></div>
	<div>작성자<input name="writer" readonly="readonly" value="${data.mb_nick}"></div>
	<div>조회수<input name="hit" readonly="readonly" value="${data.com_hit}"></div>
	<div>좋아요 수<input name="com_like" readonly="readonly" value="${data.com_like}"></div>

</form>

<div style="margin-bottom:10px">
	<%if(session.getAttribute("member")==null){
		out.println("<a href='/'로그인</a>");
	}else{
		MemberVO vo=(MemberVO)session.getAttribute("member");
		out.println(vo.getMb_id()+"님 반갑습니다.<br>");
	}%>
</div>

<div style="width: auto;">
	<br>
	<c:if test="${sessionScope.member.mb_id != null}">
	<!--추가:댓글-->
	<div class="container">
		<label for="comment_content">comment</label>
		<form name="commentInsertForm" method="post">
			<div class="input-group">
			<input type="hidden" name="com_num" id="com_num" value="${data.com_num}"/>
			<input type="hidden" name="mb_nick" id="mb_nick" value="${membervo.mb_nick}"/>
			<input type="hidden" name="mb_seq" value="${membervo.mb_seq}"/>
			<input type="hidden" name="mb_doctor" value="${membervo.mb_doctor}"/>
			<input type="text" class="form-control" id="comment_content" name="comment_content" placeholder="내용을 입력하세요.">
			<span class="input-group-btn"><button class="btn btn-default" type="button" name="commentInsertBtn">등록</button></span>
		</div>
		</form>
	</div>
	<div class="container">
		<div class="commentList"></div>
	</div>
</div>
<!--
		<textarea rows="5" cols="80" id="comment_text" placeholder="댓글을 작성해주세요!"></textarea>
		<br>
		<button type="button" id="btn_comment">댓글작성</button>
		<br>-->
	</c:if>
</div>
<%@include file="comment.jsp"%>

<c:if test="${membervo.mb_nick == data.mb_nick}">
	<button id="modify" onclick="location.href='boardModifyForm?com_num=${data.com_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'">수정</button>
	<button id="delete" onclick="location.href='boardDelete?com_num=${data.com_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'">삭제</button>
</c:if>

<style>
	.btn-light{
		color: slategray;
	}
	.btn-danger{
		color: red;
	}
</style>
<div id="like">
	<c:choose>
		<c:when test="${like_check ==0}">
			<button type="button" class="btn-light" id="likebtn">좋아요</button>
			<input type="hidden" id="likecheck" value="${like_check }">
		</c:when>
		<c:when test="${like_check ==1}">
			<button type="button" class="btn-danger" id="likebtn">좋아요</button>
			<input type="hidden" id="likecheck" value="${like_check }">
		</c:when>
	</c:choose>
</div>

<script>

	$('#likebtn').click(function(){
		likeupdate();
	});

	function likeupdate(){
		var root = getContextPath(),
				likeurl = "/like/likeupdate",
				mb_nick = $('#mb_nick').val(),
				com_num = $('#com_num').val(),
				count = $('#likecheck').val(),
				data = {"mb_nick" : mb_nick,
					"com_num" : com_num,
					"count" : count};

		$.ajax({
			url : "/like/likeupdate",
			type : 'POST',
			contentType: "application/json; charset=UTF-8",
			beforeSend: function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			async: false,
			data : JSON.stringify(data),
			success : function(result){
				console.log("수정" + result.result);

				if(count == 1){
					console.log("좋아요 취소");
					$('#likecheck').val(0);
					$('#likebtn').attr('class','btn-light');
				}else if(count == 0){
					console.log("좋아요!");
					$('#likecheck').val(1);
					$('#likebtn').attr('class','btn-danger');
				}
			}, error : function(result){
				console.log("에러" + result.result)
			}

		});
	};

	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
</script>

<button onclick="location.href='/boardList?stateCode=${stateCode}&category=${category}'">목록</button>

<%-- <a href='<c:url value='/boardDelete?bno=${data.bno}'/>'>삭제</a> --%>
<!-- 두가지 모두 가능 -->
</body>
</html>