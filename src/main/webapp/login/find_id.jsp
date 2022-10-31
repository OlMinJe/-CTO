<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/login/find.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(function(){
            $("#loginBtn").click(function(){
                location.href='/login';
            })
        })
    </script>
    <title>아이디 찾기</title>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 result_wrap">
    <div class="col-11 col-sm-8 col-md-6 col-lg-5 result_wrap">
        <div class="title">아이디 찾기 검색결과</div>
        <div>회원님의 아이디는
        <span>${ id }</span>입니다.</div>
        <br>
        <div style="text-align: center;">
            <button type="button" id=loginBtn class="box_eft_02">로그인으로 이동</button>
            <button type="button" class="box_eft_02" onclick="history.go(-1);">취소</button>
        </div>
    </div>
</div>

<%--<div class="w3-content w3-container w3-margin-top">--%>
<%--    <div class="w3-container w3-card-4">--%>
<%--        <div class="w3-center w3-large w3-margin-top">--%>
<%--            <h3>아이디 찾기 검색결과</h3>--%>
<%--        </div>--%>
<%--        <div>--%>
<%--            <h5>--%>
<%--                ${ id }--%>
<%--            </h5>--%>
<%--            <p class="w3-center">--%>
<%--                <button type="button" id=loginBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">Login</button>--%>
<%--                <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>--%>
<%--            </p>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>