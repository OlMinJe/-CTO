<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>해리포터 테스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Enter_test_potter.css">
</head>

<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 potter">
    <!-- 시작 화면 -->
    <article class="col-12 mb-4 trip_start">
        <div class="mb-5 title">너나들이</div>
        <%--Enter_trip_test_title--%>
        <div class="mb-5 col-12 col-lg-10" style="margin-left: auto; margin-right: auto;">
            <img class="mb-5 Enter_image" src="/img/Enter_trip_test/Enter_trip_test_title.jpg">
            <h1 class="mb-4 text-center">헤리포터 테스트</h1>
            <h5 class="mb-5 text-center">"Sorting hat"가 선택해주는 당신의 기숙사를 알아보러 가보자고</h5>
            <%-- 버튼 지정해서 css 입히기--%>
            <div class="col-12 mb-5 text-center">
                <button type="button" class="btn btn-outline-secondary col-12 mb-5" style="padding-top:25px; padding-bottom:25px; font-size: large;" onclick="Enter_start();">테스트 시작하기</button>
                <button type="button" class="btn btn-outline-secondary col-12" style="padding-top:25px; padding-bottom:25px; font-size: large;" onclick="location.href='/Entertainment/Entertainment.jsp'">다른 테스트 보러가기</button>
            </div>
            <h5 class="mb-2 text-center">테스트 공유하기</h5>
            <!-- Go to www.addthis.com/dashboard to customize your tools -->
            <div class="mb-2 text-center share addthis_inline_share_toolbox"></div>
        </div>
    </article>

    <!-- 문제 화면 -->
    <article class="col-12 mb-4 trip_question">
        <div class="mb-2 title">해리포터 테스트</div>
        <div class="col-12 col-lg-10" style="margin-left: auto; margin-right: auto;">
            <h6 id="EntertripQnum" class="mb-2" style="text-align:right; color: rgb(137, 137, 137);">문제 번호</h6>
            <div class="mb-2 progress">
                <div class="mb-10 progress-bar bg-success" role="progressbar" aria-label="Basic example" style="width: calc(100/12*1%)"></div>
            </div>
            <div class="col-12" id="trip_title">문제</div>
            <!--<h2 id="trip_title" class="text-center mt-10">문제</h2>-->
            <input id="type" type="hidden" value="EI">
            <div class="col-12 text-center" style="display: grid;">
                <button id="Enter_trip_test_A" type="button" class="btn btn-light mb-4" style="padding: 28px 15px; border-radius: 12px;">Primary</button>
                <button id="Enter_trip_test_B" type="button" class="btn btn-light" style="padding: 28px 15px; border-radius: 12px;">Primary</button>
            </div>
        </div>
    </article>

    <!-- 결과 화면 -->
    <article class="col-12 mb-4 result">
        <div class="mb-5 title">해리포터 테스트</div>
        <div class="col-12 col-lg-10" style="margin-left: auto; margin-right: auto;">
            <h1 id="Enter_trip_keyword" class="text-center mb-4">기숙사 키워드</h1>
            <h2 id="Enter_trip" class="text-center mb-4">기숙사</h2>
            <div class="col-12 text-center">
                <img id="img" src="" class="rounded-circle mb-4" alt="Enter_trip">
            </div>
            <div id="Enter_trip_result" class="mb-3" style="border: 1px solid #ddd;">
                <h3 id="explain_title" class="mb-1">타이틀 설명</h3>
                <h3 id="explain" class="mb-1">여행 스타일 설명</h3>
            </div>
            <!-- Go to www.addthis.com/dashboard to customize your tools -->
            <div class="mb-5 share addthis_inline_share_toolbox text-center"></div>
            <button id="Enter_page" type="button" class="btn btn-light text-center col-12" onclick="location.href='/Entertainment/Entertainment.jsp'">다른 테스트 하러 가기!</button>
        </div>
    </article>

    <!-- 타입별로 데이터 저장 -->
    <input type="hidden" id="EI" value="0">
    <input type="hidden" id="SN" value="0">
    <input type="hidden" id="TF" value="0">
    <input type="hidden" id="JP" value="0">
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> <!-- jquery -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>  <!-- 스크립트 -->
<!-- addthis code / sns 공유 기능 -->
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-62f6d80e58d7a901"></script>
<script type="text/javascript" src="/js/Enter_test_potter.js"></script>
</body>
</html>