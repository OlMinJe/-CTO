<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css">  <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/notice/notice.css">
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 notice">
    <div class="col-12 col-lg-10 list-title">공지사항</div>
    <div class="col-12 col-lg-10 content">
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>
        <div class="content-table">
            <table class="table table-hover table-bordered" id="notice-table">
                <tr>
                    <th>No.</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>작성시간</th>
                </tr>
                <c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
                <c:forEach items="${list}" var="data">
                    <tr>
                        <td>${data.notice_num}</td>
                        <td>${data.mb_nick}</td>
                        <td>
                            <a href="/notice/notice_view?notice_num=${data.notice_num}&stateCode=${stateCode}&category=${data.notice_category}">${data.notice_title}</a>
                        </td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.notice_date}"/></td>
                    </tr>
                    <c:set var="no" value="${no-1}"></c:set>
                </c:forEach>
            </table>
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item active"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>
    <div class="btn_wrap">
        <c:if test="${sessionScope.stateCode == 1}">
            <a onclick="location.href='/notice/notice_write';" class="on box_eft_02">글쓰기</a>
        </c:if>

    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/notice.js"></script>
</body>
</html>



<%--
<div class="col-12 notice">
    <div class="col-12 col-lg-10 list-title">공지사항</div>
    <div class="col-12 col-lg-10 content">
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>
        <div class="content-table">
            <table class="table table-hover table-bordered" id="notice-table">
                <thead id="notice-table-head"></thead>
                <tbody id="notice-table-body"></tbody>
            </table>
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item active"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>
    <div class="btn_wrap">
        <a onclick="location.href='/notice/notice_write.jsp';" class="on box_eft_02">글쓰기</a>
        <!--<a href="#">수정</a>-->
    </div>
</div>--%>
