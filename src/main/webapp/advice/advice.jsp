<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상담</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/advice/advice.css">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 advice">
    <div class="col-12 col-lg-10 menu">
        <ul class="menu-wrap">
            <li class="col-6 active box_eft_01" id="active_normal" onclick="liActive01();">일반 고민</li>
            <li class="col-6 box_eft_01" id="active_woman" onclick="liActive02();">여성 고민</li>
        </ul>
        <div class="col-12 menu-con">
            <ul class="col-12 menu-box-01" id="sub-menu-01">
                <li class="box_eft_01 active">일반고민</li>
                <li class="box_eft_01">대인관계 / 가족</li>
                <li class="box_eft_01">정신건강</li>
                <li class="box_eft_01">직장</li>
                <li class="box_eft_01">성소수자</li>
            </ul>
            <ul class="col-12 menu-box-02" id="sub-menu-02" style="display: none;">
                <li class="box_eft_01 active">성추행</li>
                <li class="box_eft_01">출산 / 육아</li>
                <li class="box_eft_01">섭식장애</li>
                <li class="box_eft_01">외모 강박증</li>
            </ul>
        </div>
    </div>
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
        </div>
    </div>

    <div class="btn_wrap">
        <a onclick="location.href='/advice/advice_write.jsp';" class="on box_eft_02">글쓰기</a>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/advice.js"></script>
</body>
</html>

