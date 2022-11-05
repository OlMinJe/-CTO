<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>report_view</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" report_content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/report/report.css">
</head>

<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 view_wrap">
    <div class="col-12 col-lg-10 view_con">
        <div class="col-12 category_title">
            <c:choose>
                <c:when test="${data.report_category == 0}">
                    <div class="col-12 category_title">유저신고</div>
                </c:when>
                <c:when test="${data.report_category == 1}">
                    <div class="col-12 category_title">댓글/게시판신고</div>
                </c:when>
                <c:when test="${data.report_category == 2}">
                    <div class="col-12 category_title">페이지오류신고</div>
                </c:when>
                <c:when test="${data.report_category == 3}">
                    <div class="col-12 category_title">저작권/명예회손</div>
                </c:when>
                <c:when test="${data.report_category == 4}">
                    <div class="col-12 category_title">기타</div>
                </c:when>
            </c:choose>
        </div>
        <div class="col-12 view_list">
            <div class="col-12 board_view_title">${data.re_title}</div>
            <div class="col-12 board_view_info">
                <dl>
                    <dt>번호</dt>
                    <dd>${data.re_num}</dd>
                </dl>
                <dl>
                    <dt>글쓴이</dt>
                    <dd>김배화</dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.re_date}"/></dd>
                </dl>
                <dl>
                    <dt>조회</dt>
                    <dd>0</dd>
                </dl>
            </div>
            <div class="col-12 board_view_content">
                ${data.re_content}
            </div>
        </div>
        <div class="col-12 btn_wrap">
            <a onclick="location.href='/report/report.jsp';" class="on box_eft_02">목록</a>
            <a href="edit.html" class="box_eft_01">수정</a>
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
<!--<div class="col-12 report_board_wrap">
<div class="col-12 report_board_title">
<strong>신고게시판</strong>
</div>
<div class="col-12 board_view_wrap">
<div class="col-12 report_board_view">
<div class="col-12 report_view_title">
글 제목
</div>
<div class="col-12 report_view_info">
<dl>
<dt>번호</dt>
<dd>1</dd>
</dl>
<dl>
<dt>글쓴이</dt>
<dd>김배화</dd>
</dl>
<dl>
<dt>작성일</dt>
<dd>2022.07.13</dd>
</dl>
<dl>
<dt>조회</dt>
<dd>33</dd>
</dl>
</div>
<div class="col-12 report_view_content">
글 내용<br>
글 내용<br>
글 내용<br>
글 내용<br>
글 내용<br>
글 내용<br>
글 내용<br>
글 내용
</div>
</div>
<div class="col-12 report_bt_wrap">
<a href="report.html" class="on">목록</a>
&lt;!&ndash;<a href="edit.html">수정</a>&ndash;&gt;
</div>
</div>
</div>-->