<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>커뮤니티 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/community/community.css">
    <%--<script type="text/javascript" src="/js/community.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/community.js"></script>--%>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 community">
    <div class="col-12 col-lg-10 menu">
        <ul class="menu-wrap">
            <li class="col-6 active box_eft_01" id="community_normal" onclick="li_active_01();"> <!-- normal_event(); -->커뮤니티</li>
            <li class="col-6 box_eft_01" id="community_editor">에디터 칼럼</li>
        </ul>
        <div class="col-12 menu-con" id="sub-menu">
            <ul class="col-12 menu-box-01"><!--id="sub-menu"-->
                <li class="box_eft_01 active"><a href="/community/community.jsp?stateCode=${stateCode}&category=10">전체</a></li>
                <li class="box_eft_01"><a href="/community/community.jsp?stateCode=${stateCode}&category=0">일상</a></li>
                <li class="box_eft_01"><a href="/community/community.jsp?stateCode=${stateCode}&category=1">취미</a></li>
                <li class="box_eft_01"><a href="/community/community.jsp?stateCode=${stateCode}&category=2">유머</a></li>
                <li class="box_eft_01"><a href="/community/community.jsp?stateCode=${stateCode}&category=3">음식</a></li>
                <li class="box_eft_01"><a href="/community/community.jsp?stateCode=${stateCode}&category=4">정보</a></li>
                <li class="box_eft_01"><a href="/community/community.jsp?stateCode=${stateCode}&category=5">취업/진로</a></li>
                <li class="box_eft_01"><a href="/community/community.jsp?stateCode=${stateCode}&category=6">기타</a></li>
            </ul>
        </div>
    </div>
    <div class="col-12 col-lg-10 content">
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>
        <div class="content-table">
            <table class="table table-hover table-bordered" id="community-table">
                <thead id="community-table-head"></thead>
                <tbody id="community-table-body"></tbody>
            </table>
            <div class="col-12" id="editor_content">
                <div data-include-path="/community/editor.jsp"></div>
            </div>
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
        <a onclick="location.href='/community/community_write.jsp';" class="on box_eft_02">글쓰기</a>
        <!--<a href="#">수정</a>-->
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/js/community.js"></script>
</html>