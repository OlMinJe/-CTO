<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>포인트 지급 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Entertainment.css">
    <script>
        function confirm() {
            location.href="/pointModify";
            return true;
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 Enter-container">
    <form action='<c:url value='/pointModify'/>' method="post" onsubmit="return confirm()" enctype="multipart/form-data">
        <div class="col-12 col-md-10 Ent_main">
            <div class="col-12 btn_wrap">
                <div class="col-12 Ent_content">
                    <p>100P가 지급되었습니다!</p><Br>
                <a onclick="location.href='/Entertainment/Entertainment.jsp?stateCode=${stateCode}';" class="on box_eft_02">다른 게임 및 테스트하기</a>
                </div>
            </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="stateCode" value="${stateCode}"/>
        <input type="hidden" name="mb_nick" id="mb_nick" value="${data.mb_nick}">
    </form>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/Entertainment.js"></script>
</body>
</html>