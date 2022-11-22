<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>location</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <link rel="stylesheet" type="text/css" href="/css/location/location.css">
    <script>
        function performance() {
            const Element = document.getElementById('keyword');
            Element.value = "혜화 공연";
            $('#sbtn').trigger('click');
            window.localStorage.setItem('performance', '혜화 공연');
        }
        function food() {
            const Element = document.getElementById('keyword');
            Element.value = "종로 음식점";
            $('#sbtn').trigger('click');
            window.localStorage.setItem('food', '종로 음식점');
        }
        function cafe() {
            const Element = document.getElementById('keyword');
            Element.value = "종로 카페";
            $('#sbtn').trigger('click');
            window.localStorage.setItem('cafe', '종로 카페');
        }
        function show_show() {
            const Element = document.getElementById('keyword');
            Element.value = "행사";
            $('#sbtn').trigger('click');
            window.localStorage.setItem('show_show', '행사');
        }
        function experience() {
            const Element = document.getElementById('keyword');
            Element.value = "체험";
            $('#sbtn').trigger('click');
            window.localStorage.setItem('experience', '체험');
        }
        function exercise() {
            const Element = document.getElementById('keyword');
            Element.value = "종로 헬스장";
            $('#sbtn').trigger('click');
            window.localStorage.setItem('exercise', '종로 헬스장');
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12">
    <div class="col-12 menu">
        <ul>
            <li class="box_eft_02" id="performance" onclick="performance()">공연</li>
            <li class="box_eft_02" id="food" onclick="food()">음식</li>
            <li class="box_eft_02" id="cafe" onclick="cafe()">카페</li>
            <li class="box_eft_02" id="show_show" onclick="show_show()">행사</li>
            <li class="box_eft_02" id="experience" onclick="experience()">체험</li>
            <li class="box_eft_02" id="exercise" onclick="exercise()">운동</li>
        </ul>
    </div>
    <div class="map_wrap">
        <div id="map" class="col-12 col-md-8"></div><!--지도 크기 설정 변경 필수-->
        <!--지도 검색 컨트롤 div-->
        <div id="menu_wrap" class="col-12 col-md-4 bg_white">
            <div class="option">
                <div>
                    <form onsubmit="searchPlaces(); return false;">
                        <input type="text" value="경복궁 맛집" id="keyword" class="box_eft_01" size="15">
                        <button class="box_eft_02" type="submit" id="sbtn">검색하기</button>
                    </form>
                </div>
            </div>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>
        <!--지도 타입 컨트롤 div-->
        <div class="custom_typecontrol radius_border">
            <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
            <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
        </div>
        <!--지도 확대, 축소 컨트롤 div-->
        <div class="custom_zoomcontrol radius_border">
            <span onclick="zoomIn();"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>
            <span onclick="zoomOut();"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>


<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=e0b9488f11b6cad91c9c64919764e1de&libraries=services"></script>
<script type="text/javascript" src="/js/map.js"></script>
</body>
</html>
