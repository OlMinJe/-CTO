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
                <pre>${data.talk_content}</pre>
            </div>
        </div>
        <div class="col-12 btn_wrap">
            <a onclick="location.href='/advice/advice.jsp';" class="on box_eft_02">목록</a>
        </div>

        <div>
            <c:if test="${membervo.mb_nick == data.mb_nick}">
                <button class="box_eft_02" id="modify" onclick="location.href='/advice/advice_modify?talk_num=${data.talk_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'" style="padding: 8px 15px;">수정</button>
                <button class="box_eft_01" id="delete" onclick="location.href='/talkDelete?talk_num=${data.talk_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'" style="padding: 8px 15px;">삭제</button>
            </c:if>
        </div>

        <!-- 여기 댓글 -->
        <div class="col-12 comment_box">
            <div class="col12 comment_num ">댓글수<span>${data.talk_comment}</span></div>
            <c:if test="${membervo.mb_doctor != 0}">
            <div class="col-12 comment_writer">
                <form name="commentInsertForm" method="post">
                <div class="col-12 input_box">
                    <input type="hidden" name="talk_num" id="talk_num" value="${data.talk_num}"/>
                    <input type="hidden" name="mb_nick" id="mb_nick" value="${membervo.mb_nick}"/>
                    <input type="hidden" name="mb_seq" value="${membervo.mb_seq}"/>
                    <input type="hidden" name="mb_doctor" value="${membervo.mb_doctor}"/>
                    <!-- TODO : https://tried.tistory.com/95 -->
                    <textarea
                            className={`block whitespace-pre-wrap w-full bg-white text-gray-700 border border-black py-2
                            px-2 mb-3 leading-tight focus:border focus:border-pz-pt-1 `}
                            rows={large ? 5 : 1}
                            placeholder="댓글을 통해 작성자에게 큰 힘이 되어주세요."
                            value={text}
                            onChange={handleChange}
                            class="box_eft_01"
                            id="comment_content"
                            name="comment_content"
                    ></textarea>
                    <span class="input-group-btn">
                    <button class="btn btn-outline-success box_eft_02" type="button" name="commentInsertBtn">댓글 등록</button>
                    </span>
                </div>
                </form>
            </div>
            </c:if>
            <div class="col-12 comment_writer"> <!-- 확인용 -->
                <div class="commentList"></div>
            </div>
            <%@include file="advice_comment.jsp"%>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>