<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>테트리스</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Enter_tetris.css">
</head>
<body>
<div style="background-color: #ccc;">
    <div class="col-12 wrapper">
        <div class="game_text">
            GAME OVER
            <div>
                <button class="restart" style="margin-right: 5px;">다시시작</button>
                <button class="stop" style="margin-left: 5px;" onclick="location.href='/Entertainment/Entertainment.jsp?stateCode=${stateCode}'">그만하기</button>
            </div>
        </div>
        <div class="col-12 score">0</div>
        <div class="col-12 playground">
            <ul class="col-12 col-sm-9 col-md-4"></ul>
        </div>
        <div class="col-12" style="text-align: center;">
            <button onclick="location.href='/Entertainment/Enter_point?stateCode=${stateCode}'">포기하기</button>
        </div>
    </div>
</div>
<script src="/js/tetris.js" type="module"></script>
</body>
</html>