<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>2048</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/header.css"> <!-- 헤더 -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/footer.css"> <!--푸터-->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Game2048.css">
    <script type="text/javascript" src="/includeHtml.js"></script>
    <style></style>
</head>
<body>
<div class="game_2048">
    <table id="titleBar" border="0">
        <tr>
            <td id="titlePad">
                <p id="title">2048</p>
            </td>
            <td id="scorePad">
                <p id="scoreType">Score</p>
                <p id="score"></p>
            </td>
        </tr>
    </table>
    <table id="board">
        <tr>
            <td id="00"></td>
            <td id="01"></td>
            <td id="02"></td>
            <td id="03"></td>
        </tr>
        <tr>
            <td id="10"></td>
            <td id="11"></td>
            <td id="12"></td>
            <td id="13"></td>
        </tr>
        <tr>
            <td id="20"></td>
            <td id="21"></td>
            <td id="22"></td>
            <td id="23"></td>
        </tr>
        <tr>
            <td id="30"></td>
            <td id="31"></td>
            <td id="32"></td>
            <td id="33"></td>
        </tr>
    </table>
    <p id="info" style="text-align: center">
        가장 높은 숫자 2048을 만들어보세요!
    </p>
    <div class="game_2048b">
        <c:if test="${sessionScope.stateCode ne null}">
            <button class="game2048_btn" onclick="location.href='/Entertainment/Enter_point?stateCode=${stateCode}'">종료하기</button>
        </c:if>
        <c:if test="${sessionScope.stateCode eq null}">
            <button class="game2048_btn" onclick="location.href='/Entertainment/Entertainment.jsp'">종료하기</button>
        </c:if>
    </div>
</div>

</body>

<script type="text/javascript" src="/js/Game2048.js"></script>
</html>
