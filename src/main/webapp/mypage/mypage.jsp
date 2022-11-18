<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>내 정보 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
    <link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/mypage.js"></script>
    <!-- calendar를 위한 라이브러리들 지우면 안됨 -->

</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 mypage">
    <div class="col-12 title" style="float: left">
        <a class="col-12" id="tab_0" name="menu_tab" onclick="location.href='/mypage/mypage?stateCode=${stateCode}'">내정보</a>
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
                    <div class="menu_title">정보변경</div>
                    <ul style="padding-top: 10px;">
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
            <!-- 0. 내정보 [main] -->
            <div class="col-12 content_box" id="tab_0_content"> <!--id="tab_1_content"-->
                <article class="col-12 content_left"><!--col-lg-7 -->
                    <section class="col-12 calender">
                        <div class="container calendar-container">
                            <div id="calendar"></div>
                        </div>
                    </section>
                    <%--<section class="col-12 calender">
                        <div class="col-12 sub_title">출석체크 현황</div>
                        <div class="col-12 calender_top">
                            <div class="col-4 nav">
                                <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
                                <!--<button class="nav-btn go-today"-->
                                <div>Today</div>
                                <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
                            </div>
                            <div class="col-4 year_month"></div>
                            <div class="col-4 today_complete">출석 완료</div>
                        </div>
                        <div class="calender_bottom">
                            <div class="days">
                                <div class="day">일</div>
                                <div class="day">월</div>
                                <div class="day">화</div>
                                <div class="day">수</div>
                                <div class="day">목</div>
                                <div class="day">금</div>
                                <div class="day">토</div>
                            </div>
                            <div class="dates"></div>
                        </div>
                    </section>--%>
                </article>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>


<!--
<button type="radio" class="col-12" id="tab_1" name="menu_tab" value="1" onclick="location.href='mypage_01.html'">이벤트 참여내역</button> showMenu(this)
<button type="radio" class="col-12" id="tab_2" name="menu_tab" value="2" onclick="location.href='mypage_02.html'">커뮤니티 사용내역</button>
<button type="radio" class="col-12" id="tab_3" name="menu_tab" value="3" onclick="location.href='mypage_03.html'">위치기반 사용내역</button>
<button type="radio" class="col-12" id="tab_4" name="menu_tab" value="4" onclick="location.href='mypage_04.html'">테스트 결과 내역</button>
<div class="menu_title mt">정보변경</div>
<button type="radio" class="col-12" id="tab_5" name="menu_tab" value="5" onclick="location.href='mypage_05.html'">비밀번호 변경</button>
<button type="radio" class="col-12" id="tab_6" name="menu_tab" value="6" onclick="location.href='mypage_06.html'">닉네임 변경</button>
<button type="radio" class="col-12" id="tab_7" name="menu_tab" value="7" onclick="location.href='mypage_07.html'">프로필 사진 변경</button>
<button type="radio" class="col-12" id="tab_8" name="menu_tab" value="8" onclick="location.href='mypage_08.html'">회원탈퇴</button>
-->
<!-- 1. 내정보 [활동내역 - 이벤트 참여내역]-->
<!--<div class="col-12 content_box" id="tab_1_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypage/mypage_01.html"></div>
</div>-->
<!-- 2. 내정보 [활동내역 - 커뮤니티 참여내역]-->
<!--<div class="col-12 content_box" id="tab_2_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypage/mypage_02.html"></div>
</div>-->
<!-- 3. 내정보 [활동내역 - 위치기반 참여내역]-->
<!--<div class="col-12 content_box" id="tab_3_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypag/mypage_03.html"></div>
</div>-->
<!-- 4. 내정보 [활동내역 - 테스트 참여내역]-->
<!--<div class="col-12 content_box" id="tab_4_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypage/mypage_04.html"></div>
</div>-->
<!-- 5. 내정보 [정보변경 - 비밀번호 변경]-->
<!--<div class="col-12 content_box" id="tab_5_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypage/mypage_05.html"></div>
</div>-->
<!-- 6. 내정보 [정보변경 - 닉네임 변경]-->
<!--<div class="col-12 content_box" id="tab_6_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypage/mypage_06.html"></div>
</div>-->
<!-- 7. 내정보 [정보변경 - 프로필 사진 변경]-->
<!--<div class="col-12 content_box" id="tab_7_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypage/mypage_07.html"></div>
</div>-->
<!-- 8. 내정보 [정보변경 - 비밀번호 변경]-->
<!--
<div class="col-12 content_box" id="tab_8_content">
<div data-include-path="/22_ig031/src/main/resources/templates/mypage/menu/mypage_08.html"></div>
</div>-->



<%--
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<body>
<h1>마이페이지 입니다.</h1>
<hr><br>
<button type="button" onclick="location.href='pw_modify?stateCode=${stateCode}'">비밀번호 수정</button>
<button type="button" onclick="location.href='nick_modify?stateCode=${stateCode}'">닉네임 수정</button>
<button type="button" onclick="location.href='profile_modify?stateCode=${stateCode}'">프로필사진 수정</button>
<button type="button" onclick="location.href='memberDelete?stateCode=${stateCode}'">회원 탈퇴</button>
</body>
</html>--%>
