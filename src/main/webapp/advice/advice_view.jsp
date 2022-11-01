<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상담 게시물</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/advice/advice.css">
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 view_wrap">
    <div class="col-12 col-lg-10 view_con">
        <div class="col-12 category_title">
            <c:choose>
                <c:when test="${data.talk_category == 0}">
                    <div class="col-12 category_title">일반고민</div>
                </c:when>
                <c:when test="${data.talk_category == 1}">
                    <div class="col-12 category_title">대인관계/가족</div>
                </c:when>
                <c:when test="${data.talk_category == 2}">
                    <div class="col-12 category_title">정신건강</div>
                </c:when>
                <c:when test="${data.talk_category == 3}">
                    <div class="col-12 category_title">직장</div>
                </c:when>
                <c:when test="${data.talk_category == 4}">
                    <div class="col-12 category_title">성소수자</div>
                </c:when>
                <c:when test="${data.talk_category == 5}">
                    <div class="col-12 category_title">성추행</div>
                </c:when>
                <c:when test="${data.talk_category == 6}">
                    <div class="col-12 category_title">출산/육아</div>
                </c:when>
                <c:when test="${data.talk_category == 7}">
                    <div class="col-12 category_title">섭식장애</div>
                </c:when>
                <c:when test="${data.talk_category == 8}">
                    <div class="col-12 category_title">외모</div>
                </c:when>
            </c:choose>
        </div>
        <div class="col-12 view_list">
            <div class="col-12 board_view_title">${data.talk_title}</div>
            <div class="col-12 board_view_info">
                <dl>
                    <dt>번호</dt>
                    <dd>${data.talk_num}</dd>
                </dl>
                <dl>
                    <dt>글쓴이</dt>
                    <dd>${data.mb_nick}</dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.talk_date}"/></dd>
                </dl>
                <dl>
                    <dt>조회</dt>
                    <dd>${data.talk_hit}</dd>
                </dl>
            </div>
            <div class="col-12 board_view_content">
                ${data.talk_content}
            </div>
        </div>
        <div class="col-12 btn_wrap">
            <a onclick="location.href='/advice/advice.jsp';" class="on box_eft_02">목록</a>
        </div>

        <!-- 여기 댓글 -->
        <div class="col-12 comment_box">
            <div class="col12 comment_num ">댓글수<span>카운트해서 넣기</span></div>
            <div class="col-12 comment_writer">
                <div class="col-12 input_box">
                    <!-- TODO : https://tried.tistory.com/95 -->
                    <textarea
                            className={`block whitespace-pre-wrap w-full bg-white text-gray-700 border border-black py-2
                            px-2 mb-3 leading-tight focus:border focus:border-pz-pt-1 `}
                            rows={large ? 5 : 1}
                            placeholder={placeholder}
                            value={text}
                            onChange={handleChange}
                            class="box_border"></textarea>
                    <button class="btn btn-outline-success box_eft_02" type="submit">댓글 등록</button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>