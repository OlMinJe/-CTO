<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="/css/Entertainment/Ent_RSPGame.css" />
<div id="rps_page" class="col-12">
    <h1>가위바위보를 해보세요!</h1>
    <img src="/img/Enter_RSPGame/question.png" , id="what" />
</div>
<div class="rsp_btn">
    <button class="rsp" id="rocks">Rock</button>
    <button class="rsp" id="scissor">Scissor</button>
    <button class="rsp" id="papers">Paper</button>

    <div id="result"></div>
    <button
            class="rsp"
            onClick="window.location.reload()"
            style="margin-top: 35px"
    >
        다시하기
    </button>
    <%--<button class="rsp">게임 종료</button>--%>
        <c:if test="${sessionScope.stateCode ne null}">
            <button class="rsp" onclick="location.href='/Entertainment/Enter_point?stateCode=${stateCode}'">종료하기</button>
        </c:if>
        <c:if test="${sessionScope.stateCode eq null}">
            <button class="rsp" onclick="location.href='/Entertainment/Entertainment.jsp'">종료하기</button>
        </c:if>
</div>
<script>
    var rock = document.getElementById("rocks"); //0
    var sissor = document.getElementById("scissor"); //1
    var paper = document.getElementById("papers"); //2

    var randompush = Math.floor(Math.random() * 3);

    rocks.addEventListener("click", function () {
        if (randompush == 0) {
            result.innerText = "무승부입니다.";
            alert;
            document.getElementById("what").src = "/img/Enter_RSPGame/Rock.png";
        } else if (randompush == 1) {
            result.innerText = "이겼습니다! 축하드려요!";
            document.getElementById("what").src = "/img/Enter_RSPGame/Paper.png";
        } else {
            result.innerText = "아쉽게 졌네요";
            document.getElementById("what").src = "/img/Enter_RSPGame/Scissors.png";
        }
    });
    scissor.addEventListener("click", function () {
        if (randompush == 0) {
            result.innerText = "아쉽게 졌네요";
            document.getElementById("what").src = "/img/Enter_RSPGame/Rock.png";
        } else if (randompush == 1) {
            result.innerText = "무승부입니다";
            document.getElementById("what").src = "/img/Enter_RSPGame/Scissors.png";
        } else {
            result.innerText = "이겼습니다! 축하드려요!";
            document.getElementById("what").src = "/img/Enter_RSPGame/Paper.png";
        }
    });
    paper.addEventListener("click", function () {
        if (randompush == 0) {
            result.innerText = "이겼습니다! 축하드려요!";
            document.getElementById("what").src = "/img/Enter_RSPGame/Rock.png";
        } else if (randompush == 1) {
            result.innerText = "아쉽게 졌네요";
            document.getElementById("what").src = "/img/Enter_RSPGame/Scissors.png";
        } else {
            result.innerText = "무승부입니다";
            document.getElementById("what").src = "/img/Enter_RSPGame/Paper.png";
        }
    });
</script>
</html>
