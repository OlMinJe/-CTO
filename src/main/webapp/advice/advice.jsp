<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상담 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/advice/advice.css">
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 advice">
    <div class="col-12 col-lg-10 menu">
        <ul class="menu-wrap">
            <li class="col-6 box_eft_01" id="active_normal">
                <a href="/advice/advice?stateCode=${stateCode}&category=0">일반 고민</a>
                <img src="/img/icon_01.png" id="click01" style="float: right;">
            </li>
            <li class="col-6 box_eft_01" id="active_woman">
                <a href="/advice/advice?stateCode=${stateCode}&category=5">여성 고민</a>

                <img src="/img/icon_01.png" id="click02" style="float: right;">
            </li>
        </ul>
        <div class="col-12 menu-con">
            <ul class="col-12 menu-box-01" id="sub-menu-01">
                <li class="box_eft_01 div1"><a href="/advice/advice?stateCode=${stateCode}&category=0">일반고민</a></li>
                <li class="box_eft_01 div1"><a href="/advice/advice?stateCode=${stateCode}&category=1">대인관계/가족</a></li>
                <li class="box_eft_01 div1"><a href="/advice/advice?stateCode=${stateCode}&category=2">정신건강</a></li>
                <li class="box_eft_01 div1"><a href="/advice/advice?stateCode=${stateCode}&category=3">직장</a></li>
                <li class="box_eft_01 div1"><a href="/advice/advice?stateCode=${stateCode}&category=4">성소수자</a></li>
            </ul>
            <ul class="col-12 menu-box-02" id="sub-menu-02" style="display: none;">
                <li class="box_eft_01 div2"><a href="/advice/advice?stateCode=${stateCode}&category=5">성추행</a></li>
                <li class="box_eft_01 div2"><a href="/advice/advice?stateCode=${stateCode}&category=6">출산/육아</a></li>
                <li class="box_eft_01 div2"><a href="/advice/advice?stateCode=${stateCode}&category=7">섭식장애</a></li>
                <li class="box_eft_01 div2"><a href="/advice/advice?stateCode=${stateCode}&category=8">외모</a></li>
            </ul>
        </div>
    </div>
    <div class="col-12 col-lg-10 content">
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>
        <table class="table table-hover table-bordered">
            <tr>
                <%--<th>자동순번</th>--%>
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
                    <%--<td>${no}</td>--%>
                    <td>${data.talk_num}</td>
                    <div>
                        <c:choose>
                            <c:when test="${data.talk_category == 0}">
                                <td>일반고민</td>
                            </c:when>
                            <c:when test="${data.talk_category == 1}">
                                <td>대인관계/가족</td>
                            </c:when>
                            <c:when test="${data.talk_category == 2}">
                                <td>정신건강</td>
                            </c:when>
                            <c:when test="${data.talk_category == 3}">
                                <td>직장</td>
                            </c:when>
                            <c:when test="${data.talk_category == 4}">
                                <td>성소수자</td>
                            </c:when>
                            <c:when test="${data.talk_category == 5}">
                                <td>성추행</td>
                            </c:when>
                            <c:when test="${data.talk_category == 6}">
                                <td>출산/육아</td>
                            </c:when>
                            <c:when test="${data.talk_category == 7}">
                                <td>섭식장애</td>
                            </c:when>
                            <c:when test="${data.talk_category == 8}">
                                <td>외모</td>
                            </c:when>
                        </c:choose>
                    </div>
                    <td>${data.mb_nick}</td>
                    <td><a href="/advice/advice_view?talk_num=${data.talk_num}&stateCode=${stateCode}&category=${data.talk_category}">${data.talk_title}</a>
                        <c:if test="${data.talk_comment ne 0}">
                            <small>[&nbsp;<c:out value="${data.talk_comment}"/>&nbsp;]</small>
                        </c:if>
                    </td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.talk_date}"/></td>
                    <td>${data.talk_hit}</td>
                    <td>${data.talk_like}</td>
                </tr>
                <c:set var="no" value="${no-1}"></c:set>
            </c:forEach>
        </table>
        <%--<div class="content-table">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th style="width: 10%;">No.</th>
                    <th style="width: 10%;">작성자</th>
                    <th style="width: auto;">제목</th>
                    <th style="width: 10%;">댓글수</th>
                </tr>
                </thead>
                <tbody id="advice-table"></tbody>
            </table>
            <!-- https://sloth.tistory.com/29 페이징 -->
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item active"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>--%>
        <ul class="pagination">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item active"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </div>
    <input type="hidden" name="category" value="${category}"/>
    <div class="btn_wrap">
        <a onclick="location.href='/advice/advice_write';" class="on box_eft_02">글쓰기</a>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/advice.js"></script>
</body>
</html>

