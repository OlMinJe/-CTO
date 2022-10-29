<%@ page import="com.project.vo.BoardVO" %>
<%@ page import="com.project.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
/* /boardDelete에서 오는 msg */
var msg = '${msg}'
if(msg == "success") {
	alert("해당 글이 삭제되었습니다.")
} else if(msg == "fail") {
	alert("타인의 글은 삭제할 수 없습니다. 리스트로 돌아갑니다.")
}
</script>
</head>
<body>
<h2>[게시판 리스트]</h2>
<div style="margin-bottom:10px">
	<%if(session.getAttribute("member")==null){
		out.println("<a href='/'로그인</a>");
	}else{
		MemberVO vo=(MemberVO)session.getAttribute("member");
		out.println(vo.getMb_id()+"님 반갑습니다.<br>");
	}%>
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<c:if test="${stateCode == '2'}">
	<button type="button" onclick="location.href='kakao_logout'">카카오 로그아웃</button>
	<button type="button" onclick="location.href='securityAdmin'">관리자용 페이지</button>
</c:if>
<c:if test="${stateCode == '1'}">

	<button type="button" onclick="location.href='myPage?stateCode=${stateCode}'">마이페이지</button>
	<button type="button" onclick="location.href='logout'">로그아웃</button>

</c:if>
<c:if test="${stateCode == '0'}">
	<button type="button" onclick="location.href='securityAdmin?stateCode=${stateCode}'">관리자용 페이지</button>
	<button type="button" onclick="location.href='logout'">로그아웃</button>
</c:if>
<br>

<a href="/boardList?stateCode=${stateCode}&category=0">일상</a>
<a href="/boardList?stateCode=${stateCode}&category=1">취미</a>
<a href="/boardList?stateCode=${stateCode}&category=2">유머</a>
<a href="/boardList?stateCode=${stateCode}&category=3">음식</a>
<a href="/boardList?stateCode=${stateCode}&category=4">정보</a>
<a href="/boardList?stateCode=${stateCode}&category=5">취업/진로</a>
<a href="/boardList?stateCode=${stateCode}&category=6">기타</a>

<a href="/boardList?stateCode=${stateCode}&category=10">전체 조회</a>

<table border="1">
	<tr>
		<th>자동순번</th>
		<th>글번호</th>
		<th>카테고리</th>
		<th>작성자</th>
		<th>제목</th>
		<th>작성시간</th>
		<th>조회수</th>
		<th>좋아요</th>
	</tr>
	<c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
	<c:forEach items="${list}" var="data">
	<tr>
		<td>${no}</td>
		<td>${data.com_num}</td>
		<div>
			<c:choose>
				<c:when test="${data.com_category == 0}">
					<td>일상</td>
				</c:when>
				<c:when test="${data.com_category == 1}">
					<td>취미</td>
				</c:when>
				<c:when test="${data.com_category == 2}">
					<td>유머</td>
				</c:when>
				<c:when test="${data.com_category == 3}">
					<td>음식</td>
				</c:when>
				<c:when test="${data.com_category == 4}">
					<td>정보</td>
				</c:when>
				<c:when test="${data.com_category == 5}">
					<td>취업/진로</td>
				</c:when>
				<c:when test="${data.com_category == 6}">
					<td>기타</td>
				</c:when>
			</c:choose>
		</div>
		<td>${data.mb_nick}</td>
		<td><a href="/boardRead?com_num=${data.com_num}&stateCode=${stateCode}&category=${data.com_category}">${data.com_title}</a>
			<c:if test="${data.com_comment ne 0}">
				<small><b>[&nbsp;<c:out value="${data.com_comment}"/>&nbsp;]</b></small>
			</c:if>
		</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.com_date}"/></td>
		<td>${data.com_hit}</td>
		<td>${data.com_like}</td>
	</tr>
		<c:set var="no" value="${no-1}"></c:set>
	</c:forEach>
</table>
<input type="hidden" name="category" value="${category}"/>
<button type="button" onclick="location.href='boardWriteForm'">글쓰기</button> 

<ul class="paging">
    <c:if test="${paging.prev}">
    	<span><a href='<c:url value="/boardList?stateCode=${stateCode}&page=${paging.startPage-1}"/>'>이전</a></span>
    </c:if>
    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
    	<span><a href='<c:url value="/boardList?stateCode=${stateCode}&page=${num}"/>'>${num}</a></span>
    </c:forEach>
    <c:if test="${paging.next && paging.endPage>0}">
    	<span><a href='<c:url value="/boardList?stateCode=${stateCode}&page=${paging.endPage+1}"/>'>다음</a></span>
    </c:if>
</ul>
</body>
</html>