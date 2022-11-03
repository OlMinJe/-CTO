<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>타이핑 게임</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script type="text/javascript" src="/includeHtml.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>   <!-- 랜덤 api 실행을 위해 axios 설치 -->
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/header.css"> <!-- 헤더 -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/footer.css"> <!--푸터-->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Enter_typinggame.css">
</head>
<body>

<div class="col-12 ty_game" style="justify-content: center; justify-items: center; align-content: center; align-items: center; text-align: center; margin: auto; background-color: #f5f5f5; display: table-column;">
    <div class="md-10 game_header" style="display: inline-block;">
        <h1 style="justify-content: center;">영어 타이핑 연습 게임</h1>
    </div>
    <div class="md-5 word-display">
        Hello
    </div>
    <div class="md-5 word-input-box">
        <input type="text" class="word-input">
    </div>
    <div class="md-5 game-info" style="display: inline;">
        <div style="margin-bottom: 1rem;">
            남은 시간 : <span class="time">0</span>초
            <div>
            </div>
            획득 점수 : <span class="score">0</span>점
        </div>
    </div>
    <button class="md-5 button loading" onclick="run()">게임을 불러오는 중</button>
</div>
<script src="/js/TypingGame.js" ></script>
</body>
</html>