<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.helloproject.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴 설문 조사 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
<script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
<link rel="stylesheet" type="text/css" href="/css/fixed/header.css"> <!-- 헤더 -->
<link rel="stylesheet" type="text/css" href="/css/fixed/footer.css"> <!--푸터-->
<link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
<script type="text/javascript" src="/js/includeHtml.js"></script>
<script type="text/javascript" src="/js/mypage.js"></script>
<html>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 no_user">
    <div class="col-10 no_user_title">설문조사</div>
    <form class="col-10">
        <ul>
            <li><input type="checkbox" checked>선택 1</li>
            <li><input type="checkbox">선택 1</li>
            <li><input type="checkbox">선택 1</li>
            <li><input type="checkbox">선택 1</li>
            <li><input type="checkbox">선택 1</li>
            <li class="flex__"><span>기타</span><input type="text" checked></li>
            <li class="float__"><input type="submit" class="no_user_btn btn btn-info"></input></li>
        </ul>
    </form>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>