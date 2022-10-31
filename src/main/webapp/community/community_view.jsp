<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/community/community.css">
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 view_wrap">
    <div class="col-12 col-lg-10 view_con">
        <c:choose>
            <c:when test="${data.com_category == 0}">
                <div class="col-12 category_title">일상</div>
            </c:when>
            <c:when test="${data.com_category == 1}">
                <div class="col-12 category_title">취미</div>
            </c:when>
            <c:when test="${data.com_category == 2}">
                <div class="col-12 category_title">유머</div>
            </c:when>
            <c:when test="${data.com_category == 3}">
                <div class="col-12 category_title">음식</div>
            </c:when>
            <c:when test="${data.com_category == 4}">
                <div class="col-12 category_title">정보</div>
            </c:when>
            <c:when test="${data.com_category == 5}">
                <div class="col-12 category_title">취업/진로</div>
            </c:when>
            <c:when test="${data.com_category == 6}">
                <div class="col-12 category_title">기타</div>
            </c:when>
        </c:choose>
        <div class="col-12 view_list">
            <div class="col-12 board_view_title">${data.com_title}</div>
            <div class="col-12 board_view_info">
                <dl>
                    <dt>번호</dt>
                    <dd>${data.com_num}</dd>
                </dl>
                <dl>
                    <dt>작성자</dt>
                    <dd>${data.mb_nick}</dd>
                </dl>
                <dl>
                    <dt>작성일</dt><!--안 나옴(수정 필수)-->
                    <%--<dd>${data.com_date}</dd>--%>
                    <dd><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.com_date}"/></dd>
                </dl>
                <dl>
                    <dt>조회수</dt>
                    <dd>${data.com_hit}</dd>
                </dl>
                <dl>
                    <dt>좋아요 수</dt>
                    <dd>${data.com_like}</dd>
                </dl>
            </div>
            <div class="col-12 board_view_content">
                ${data.com_content}
            </div>
        </div>

        <%--<form name="form" method="post">
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

        </form>--%>

        <div class="col-12 btn_wrap">
            <!--로그인 유뮤에 따른 목차 주소 반환-->
            <c:if test="${sessionScope.stateCode ne null}">
                <a onclick="location.href='/community/community?stateCode=${stateCode}&category=10';" class="on box_eft_02">목록</a>
            </c:if>
            <c:if test="${sessionScope.stateCode eq null}">
                <a onclick="location.href='/?com&category=10';" class="on box_eft_02">목록</a>
            </c:if>
        </div>
        <div class="col-12 comment_box">
            <div class="col12 comment_num ">댓글수<span>카운트해서 넣기</span></div>
            <c:if test="${sessionScope.stateCode ne null}">
            <div class="col-12 comment_writer">

                <form name="commentInsertForm" method="post">
                <div class="col-12 input_box">
                    <input type="hidden" name="com_num" id="com_num" value="${data.com_num}"/>
                    <input type="hidden" name="mb_nick" id="mb_nick" value="${membervo.mb_nick}"/>
                    <input type="hidden" name="mb_seq" value="${membervo.mb_seq}"/>
                    <input type="hidden" name="mb_doctor" value="${membervo.mb_doctor}"/>
                    <!-- TODO : https://tried.tistory.com/95 -->
                    <textarea
                            className={`block whitespace-pre-wrap w-full bg-white text-gray-700 border border-black py-2
                            px-2 mb-3 leading-tight focus:border focus:border-pz-pt-1 `}
                            rows={large ? 5 : 1}
                            placeholder={placeholder}
                            value={text}
                            onChange={handleChange}
                            class="box_eft_01"
                            id="comment_content"
                            name="comment_content"
                    ></textarea>
                    <span class="input-group-btn">
                    <button class="btn btn-outline-success box_eft_02" type="submit" name="commentInsertBtn">댓글 등록</button>
                    </span>
                </div>
                </form>

            </div>
            </c:if>
            <div class="col-12 comment_writer"> <!-- 확인용 -->
                <div class="commentList"></div>
            </div>
            <%@include file="../community/comment.jsp"%>
        </div>
        <!-- <form name="commentInsertForm" method="post">
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
	</div>-->
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>
