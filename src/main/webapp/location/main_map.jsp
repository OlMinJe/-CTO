<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>메인화면 지도</title>
</head>
<body>
<div id="map" style="width:350%;height:350px;"></div>
<!--<p>
    <button onclick="setDraggable(false)">지도 드래그 이동 끄기</button>
    <button onclick="setDraggable(true)">지도 드래그 이동 켜기</button>
</p>-->
<!--메인회면에서는 지정한 위치를 벗어날 수 없게 막음-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0b9488f11b6cad91c9c64919764e1de"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(37.577491675481404, 126.9770077164053), // 지도의 중심좌표
            draggable: false, // 지도를 생성할때 지도 이동 및 확대/축소를 막으려면 draggable: false 옵션을 추가하세요
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 버튼 클릭에 따라 지도 이동 기능을 막거나 풀고 싶은 경우에는 map.setDraggable 함수를 사용합니다
    function setDraggable(draggable) {
        // 마우스 드래그로 지도 이동 가능여부를 설정합니다
        map.setDraggable(draggable);
    }
</script>
</body>
</html>