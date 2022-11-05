<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Report</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" report_content="width=device-width, initial-scale=14">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/report/report.css">

</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 report_main">
<%--    <div class="col-12 col-lg-10 menu">
        <input type="radio" id="tab-1" name="show" checked/>
        <input type="radio" id="tab-2" name="show"/>
        <input type="radio" id="tab-3" name="show"/>
        <input type="radio" id="tab-4" name="show"/>
        <input type="radio" id="tab-5" name="show"/>
        <div class="tab">
            <label class="box_eft_01" for="tab-1"><a href="/report/report?stateCode=${stateCode}&category=0">유저신고</a></label>
            <label class="box_eft_01" for="tab-2"><a href="/report/report?stateCode=${stateCode}&category=1">댓글/게시판신고</a></label>
            <label class="box_eft_01" for="tab-3"><a href="/report/report?stateCode=${stateCode}&category=2">페이지오류신고</a></label>
            <label class="box_eft_01" for="tab-4"><a href="/report/report?stateCode=${stateCode}&category=3">저작권/명예회손</a></label>
            <label class="box_eft_01" for="tab-5"><a href="/report/report?stateCode=${stateCode}&category=4">기타</a></label>
        </div>
    </div>--%>
    <div class="col-12 col-lg-10 menu">
        <ul class="col-12 menu-box-01" id="sub-menu-01">
            <li class="box_eft_01 div1"><a href="/report/report?stateCode=${stateCode}&category=0">일반고민</a></li>
            <li class="box_eft_01 div1"><a href="/report/report?stateCode=${stateCode}&category=1">대인관계/가족</a></li>
            <li class="box_eft_01 div1"><a href="/report/report?stateCode=${stateCode}&category=2">정신건강</a></li>
            <li class="box_eft_01 div1"><a href="/report/report?stateCode=${stateCode}&category=3">직장</a></li>
            <li class="box_eft_01 div1"><a href="/report/report?stateCode=${stateCode}&category=4">성소수자</a></li>
        </ul>
    </div>
    <!--
    <div class="col-12 col-lg-10 menu">
        <input type="radio" id="tab-1" name="show" checked/>
        <input type="radio" id="tab-2" name="show"/>
        <input type="radio" id="tab-3" name="show"/>
        <input type="radio" id="tab-4" name="show"/>
        <input type="radio" id="tab-5" name="show"/>
        <div class="tab">
            <label class="box_eft_01" for="tab-1">유저신고</label>
            <label class="box_eft_01" for="tab-2">댓글/게시판신고</label>
            <label class="box_eft_01" for="tab-3">페이지오류신고</label>
            <label class="box_eft_01" for="tab-4">저작권/명예회손</label>
            <label class="box_eft_01" for="tab-5">기타</label>
        </div>
    </div>-->
    <div class="col-12 col-lg-10 content">
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>
        <div class="content-table">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th style="width: 10%;">No.</th>
                    <th style="width: auto;">제목</th>
                    <th style="width: 20%;">날짜</th>
                </tr>
                </thead>
                <c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
                <c:forEach items="${list}" var="data">
                <tbody id="report-table">
                <tr>
                    <td>${no}</td>
                    <td><a href="/report/report_view?re_num=${data.re_num}&stateCode=${stateCode}&category=${data.report_category}">${data.re_title}</a></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.re_date}"/></td>
                </tr>
                </tbody>
                    <c:set var="no" value="${no-1}"></c:set>
                </c:forEach>
                <!--
                <tbody id="report-table">
                 TODO : 추후에 스크립트를 이용해서 넣는걸로 바꾸기
                <tr>
                    <td>1</td>
                    <td><a href="/report/report_view.jsp">신고 글 제목</a></td>
                    <td>2022.07.13</td>
                </tr>
                </tbody>-->
            </table>
            <!-- TODO: 부트스트랩 템플릿 이용 -->
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
    </div>
    <input type="hidden" name="category" value="${category}"/>
    <div class="btn_wrap">
        <a onclick="location.href='/report/report_write.jsp';" class="on box_eft_02">글쓰기</a>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script>
    let category = document.querySelector('.content-dis').outerHTML;
    for (let i = 0; i < 4; i++) {
        document.querySelector('.report_content').innerHTML += category;
    }
</script>
</body>
</html>


<!--<div class="col-12 report">
<input type="radio" id="tab-1" name="show" checked/>
<input type="radio" id="tab-2" name="show" />
<input type="radio" id="tab-3" name="show" />
<input type="radio" id="tab-4" name="show" />
<input type="radio" id="tab-5" name="show" />
<div class="tab">
<label for="tab-1">유저신고</label>
<label for="tab-2">댓글/게시판신고</label>
<label for="tab-3">페이지오류신고</label>
<label for="tab-4">저작권/명예회손</label>
<label for="tab-5">기타</label>
</div>
<div class="col-12 report_notice">
<div class="report_page_title">
<div class="container">
<h3>신고게시판</h3>
</div>
</div>

&lt;!&ndash; board seach area &ndash;&gt;
<div class="report_board_search">&lt;!&ndash;id="report_board_search"&ndash;&gt;
<div class="container">
<div class="report_search_window">
<form action="">
<div class="search-wrap">
<label for="search" class="blind">신고 내용 검색</label>
<input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
<button type="submit" class="btn btn-dark">검색</button>
</div>
</form>
</div>
</div>
</div>
</div>
<div class="report_content">
&lt;!&ndash; 추후에는 메뉴 체크했을 때 content-dis 반복문 돌릴 필요없이 해당하는 카테고리의 내용만 넣으면 됨
지금은 임의로 for문 넣어둠 &ndash;&gt;
<div class="content-dis">
&lt;!&ndash; board list area &ndash;&gt;
<div class="report_board_list">&lt;!&ndash;id="report_board_list"&ndash;&gt;
<div class="container">
<table class="report_board_table">
<thead>
<tr>
<th scope="col" class="col-1 th-num">번호</th>
<th scope="col" class="th-title" style="width: auto;">제목</th>
<th scope="col" class="col-1 th-date">등록일</th>
</tr>
</thead>
<tbody>
<tr>
<td>3</td>
<th>
<a href="report_view.html">신고 글 제목</a>
<p>테스트</p>
</th>
<td>2022.07.13</td>
</tr>

<tr>
<td>2</td>
<th><a href="report_view.html">신고 글 제목</a></th>
<td>2022.07.13</td>
</tr>

<tr>
<td>1</td>
<th><a href="report_view.html">신고 글 제목</a></th>
<td>2022.07.13</td>
</tr>
</tbody>
</table>
</div>
</div>
<div class="report_board_page">
<a href="#" class="bt first"><<</a>
<a href="#" class="bt prev"><</a>
<a href="#" class="num on">1</a>
<a href="#" class="num">2</a>
<a href="#" class="num">3</a>
<a href="#" class="num">4</a>
<a href="#" class="num">5</a>
<a href="#" class="bt next">></a>
<a href="#" class="bt last">>></a>
</div>
<div class="report_bt_wrap">
<a href="report_write.html" class="on">글쓰기</a>
&lt;!&ndash;<a href="#">수정</a>&ndash;&gt;
</div>
</div>
</div>
<footer data-include-path="/22_ig031/src/main/resources/templates/fixed/footer/footer.html"></footer>
</div>-->