<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.project.vo.LocationVO" %>
<%@page import="com.project.vo.MemberVO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>위치기반 사용내역</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/mypage.js"></script>
    <%--<script>
        if(localStorage.getItem('performance')){
            const performance = window.localStorage.getItem('performance');
            document.write(performance);
        }
        if(localStorage.getItem('food')){
            const food = window.localStorage.getItem('food');
            document.write(food);
        }
        if(localStorage.getItem('cafe')){
            const cafe = window.localStorage.getItem('cafe');
            document.write(cafe);
        }
        if(localStorage.getItem('show_show')){
            const show_show = window.localStorage.getItem('show_show');
            document.write(show_show);
        }
        if(localStorage.getItem('experience')){
            const experience = window.localStorage.getItem('experience');
            document.write(experience);
        }
        if(localStorage.getItem('exercise')){
            const exercise = window.localStorage.getItem('exercise');
            document.write(exercise);
        }
    </script>--%>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 mypage">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="col-12 title" style="float: left">
        <a class="col-12" id="tab_0" name="menu_tab" onclick="location.href='/mypage/mypage.jsp'">내정보</a>
    </div>
    <div class="col-12 mypage_con">
        <!--왼쪽 메뉴 -->
        <div class="col-12 col-lg-3 mypage_menu">
            <div class="col-0 menu_list mt">
                <div class="col-12 menu_title" onclick="mobile_menu();">활동내역</div>
                <ul class="col-12" id="menu_list_01">
                    <li class="col-12" onclick="location.href='/mypage/mypage_01.jsp?stateCode=${stateCode}'">이벤트 참여내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_02.jsp?stateCode=${stateCode}'">커뮤니티 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_03.jsp?stateCode=${stateCode}'">위치기반 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_04.jsp?stateCode=${stateCode}'">테스트 결과 내역</li>
                </ul>
                <div class="col-12 col-lg-0 menu_list" id="menu_list_02">
                    <div class="menu_title mt">정보변경</div>
                    <ul>
                        <li class="col-12" onclick="location.href='/mypage/mypage_05?stateCode=${stateCode}'">비밀번호 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_06?stateCode=${stateCode}'">닉네임 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_07?stateCode=${stateCode}'">프로필 사진 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_08?stateCode=${stateCode}'">회원탈퇴</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 오른쪽 컨텐츠-->
        <div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_3_content">
                <!------------------------------------------>
                <div class="col-12" id="sub_title">위치기반 사용내역</div>
                <div class="col-12 location_table" id="sub_table">
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 10%;">No.</th>
                            <th style="width: 20%;">선택한 카테고리</th>
                            <th style="width: auto;">선택한 장소</th>
                        </tr>
                        </thead>
                        <tbody id="location_table">
                        </tbody>
                    </table>
                </div>
                <!------------------------------------------>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        mypage_03();
    });

    function mypage_03() {
        var e = document.getElementById('location_table');

        for (var i = 0; i < 1; i++) { /* 저장된 seq의 값만큼 돌아가도록 변경하기*/
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 1) + '</td>' +
                '<td class="select_01">' + '공연' + '</td>' +
                '<td class="select_02"><a href="/location/location.jsp?stateCode=1">' + '고척스카이돔' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 2) + '</td>' +
                '<td class="select_01">' + '음식' + '</td>' +
                '<td class="select_02"><a href="/location/location.jsp?stateCode=1">' + '삼청동 수제비' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 3) + '</td>' +
                '<td class="select_01">' + '카페' + '</td>' +
                '<td class="select_02"><a href="/location/location.jsp?stateCode=1">' + '어니언 안국점' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 4) + '</td>' +
                '<td class="select_01">' + '행사' + '</td>' +
                '<td class="select_02"><a href="/location/location.jsp?stateCode=1">' + '월등복숭아체험행사' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 5) + '</td>' +
                '<td class="select_01">' + '체험' + '</td>' +
                '<td class="select_02"><a href="/location/location.jsp?stateCode=1">' + '부산영화체험박물관' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 6) + '</td>' +
                '<td class="select_01">' + '운동' + '</td>' +
                '<td class="select_02"><a href="/location/location.jsp?stateCode=1">' + '스포짐 종로점' + '</a></td>' +
                '</tr>';
            /* document.querySelector('.location_table .diplay_no').innerHTML = '<span>' + (i+1) + '</span>';
             document.querySelector('.location_table .select_01').innerHTML = '<span>' + '공연' + '</span>';
             document.querySelector('.location_table .select_02').innerHTML = '<a href="https://weblin.tistory.com/5">' + '고척스카이돔' + '</a>';*/
        }
    }
</script>
</body>
</html>


<%--<table class="table table-hover table-bordered">
    <tr>
        <th>No.</th>
        <th>선택한 카테고리</th>
        <th>검색 시간</th>
    </tr>
    <c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
    <c:forEach items="${list}" var="data">
        <tr>
                &lt;%&ndash;<td>${data.loc_num}</td>&ndash;%&gt;
            <td>
                <script>
                    if(localStorage.getItem('performance')){
                        const performance = window.localStorage.getItem('performance');
                        document.write(performance);
                    }
                    if(localStorage.getItem('food')){
                        const food = window.localStorage.getItem('food');
                        document.write(food);
                    }
                    if(localStorage.getItem('cafe')){
                        const cafe = window.localStorage.getItem('cafe');
                        document.write(cafe);
                    }
                    if(localStorage.getItem('show_show')){
                        const show_show = window.localStorage.getItem('show_show');
                        document.write(show_show);
                    }
                    if(localStorage.getItem('experience')){
                        const experience = window.localStorage.getItem('experience');
                        document.write(experience);
                    }
                    if(localStorage.getItem('exercise')){
                        const exercise = window.localStorage.getItem('exercise');
                        document.write(exercise);
                    }
                </script>
            </td>
                &lt;%&ndash;<td>${data.loc_content}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.loc_date}"/></td>&ndash;%&gt;
        </tr>
        <c:set var="no" value="${no-1}"></c:set>
    </c:forEach>
</table>--%>

<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>위치기반 사용내역</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/mypage.js"></script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 mypage">
    <div class="col-12 title" style="float: left">
        <a class="col-12" id="tab_0" name="menu_tab" onclick="location.href='/mypage/mypage.jsp'">내정보</a>
    </div>
    <div class="col-12 mypage_con">
        <!--왼쪽 메뉴 -->
        <div class="col-12 col-lg-3 mypage_menu">
            <div class="col-0 menu_list mt">
                <div class="col-12 menu_title" onclick="mobile_menu();">활동내역</div>
                <ul class="col-12" id="menu_list_01">
                    <li class="col-12" onclick="location.href='/mypage/mypage_01.jsp?stateCode=${stateCode}'">이벤트 참여내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_02.jsp?stateCode=${stateCode}'">커뮤니티 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_03.jsp?stateCode=${stateCode}'">위치기반 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_04.jsp?stateCode=${stateCode}'">테스트 결과 내역</li>
                </ul>
                <div class="col-12 col-lg-0 menu_list" id="menu_list_02">
                    <div class="menu_title mt">정보변경</div>
                    <ul>
                        <li class="col-12" onclick="location.href='/mypage/mypage_05?stateCode=${stateCode}'">비밀번호 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_06?stateCode=${stateCode}'">닉네임 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_07?stateCode=${stateCode}'">프로필 사진 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_08?stateCode=${stateCode}'">회원탈퇴</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 오른쪽 컨텐츠-->
        <div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_3_content">
                <!------------------------------------------>
                <div class="col-12" id="sub_title">위치기반 사용내역</div>
                <div class="col-12 location_table" id="sub_table">
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 10%;">No.</th>
                            <th style="width: 20%;">선택한 카테고리</th>
                            <th style="width: auto;">선택한 장소</th>
                        </tr>
                        </thead>
                        <tbody id="location_table">
                        </tbody>
                    </table>
                </div>
                <!------------------------------------------>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        mypage_03();
    });

    function mypage_03() {
        var e = document.getElementById('location_table');

        for (var i = 0; i < 1; i++) { /* 저장된 seq의 값만큼 돌아가도록 변경하기*/
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 1) + '</td>' +
                '<td class="select_01">' + '공연' + '</td>' +
                '<td class="select_02"><a href="https://weblin.tistory.com/5">' + '고척스카이돔' + '</a></td>' +
                '</tr>';
            /* document.querySelector('.location_table .diplay_no').innerHTML = '<span>' + (i+1) + '</span>';
             document.querySelector('.location_table .select_01').innerHTML = '<span>' + '공연' + '</span>';
             document.querySelector('.location_table .select_02').innerHTML = '<a href="https://weblin.tistory.com/5">' + '고척스카이돔' + '</a>';*/
        }
    }
</script>
</body>
</html>
--%>
