<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/fixed/header.css">
<script type="text/javascript" src="/js/includeHtml.js"></script>
<header>
    <!-- 고정 헤더-->
    <div class="col-12 fixed_header" style="position:fixed; display: none; justify-content: space-between; align-items: center;">
        <div class="col-1 header_logo">
            <a href="/" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
        </div>
        <div class="col-0 mypage_btn" onclick="location.href='/mypage/mypage.jsp'">마이페이지</div>
    </div>
    <!-- 모바일 메뉴 -->
    <div id="slide_menu">
        <ul class="m_nav">
            <a href="#" id="close_btn">
                <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd">
                    <path d="M12 11.293l10.293-10.293.707.707-10.293 10.293 10.293 10.293-.707.707-10.293-10.293-10.293 10.293-.707-.707 10.293-10.293-10.293-10.293.707-.707 10.293 10.293z"/>
                </svg>
            </a>
            <li class="m_nav_title m_right">
                <ul>
                    <li>
                        <div class="col-12 weather">날씨 api 연결 필요</div>
                    </li>
                    <li id="m_visitor">
                        <a onclick="location.href='/login/login.jsp'">로그인</a>&nbsp;
                        <a onclick="location.href='/login/register.jsp'">회원가입</a>
                    </li>
                    <li id="m_user">
                        <div class="user_name"><span th:text="${session.id}"></span>님, 환영합니다.</div>
                        <a onclick="location.href='/mypage/mypage.jsp?stateCode=${stateCode}'">마이페이지</a>
                        <a onclick="location.href='/login/logout.jsp'">로그아웃</a>
                        <!--<a th:action = "@{/login/logout}">로그아웃</a>-->
                    </li>
                    <li id="m_admin"><a onclick="location.href='/'">관리자 페이지로 넘어가기.</a></li>
                </ul>
            </li>
            <li class="m_nav_title" onclick="location.href='/community/community.jsp?stateCode=${stateCode}&category=10'">커뮤니티</li>
            <li class="m_nav_title" onclick="location.href='/advice/advice.jsp'">상담</li>
            <li class="m_nav_title" onclick="location.href='/location/location.jsp'">위치기반</li>
            <li class="m_nav_title" onclick="location.href='/Entertainment/Entertainment.jsp'">ENT</li>
            <li class="m_nav_title" onclick="location.href='/event/event_detail.jsp'">이벤트</li>
            <li class="m_nav_title" onclick="location.href='/report/report.jsp'">신고</li>
        </ul>
    </div>
    <!-- 기본 헤더 -->
    <div class="col-12 header_wrap" id="header">
        <div class="col-1 col-md-2 header_logo">
            <a href="/" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
        </div>
        <ul class="col-6 nav_mian">
            <li class="nav_title" onclick="location.href='/community/community.jsp?stateCode=${stateCode}&category=10'">커뮤니티</li>
            <li class="nav_title" onclick="location.href='/advice/advice.jsp'">상담</li>
            <li class="nav_title" onclick="location.href='/location/location.jsp'">위치기반</li>
            <li class="nav_title" onclick="location.href='/Entertainment/Entertainment.jsp'">ENT</li>
            <li class="nav_title" onclick="location.href='/event/event_detail.jsp'">이벤트</li>
            <li class="nav_title" onclick="location.href='/report/report.jsp'">신고</li>
        </ul>
        <div class="col-3 col-md-2 container">
            <img class="weatherIcon">
            <span class="weatherInfo"></span>
        </div>
        <!--    <div class="col-2 w_right">-->
        <!--        <ul>-->
        <!--            <li id="w_visitor">-->
        <!--                <a onclick="location.href='/login/login.html'">로그인</a>&nbsp;-->
        <!--                <a onclick="location.href='/login/register.html'">회원가입</a>-->
        <!--            </li>-->
        <!--            <li id="w_user">-->
        <!--                <div class="user_name">-->
        <!--                    <span th:text="${session.id}">님, 환영합니다.</span> &lt;!&ndash;header에 사용자 아이디 출력 안됨.&ndash;&gt;-->
        <!--                </div>-->
        <!--                <a onclick="location.href='/mypage/mypage.html'">마이페이지</a>-->
        <!--                <a onclick="location.href='/login/logout.html'">로그아웃</a>-->
        <!--                &lt;!&ndash;<a th:href="@{/login/logout.html}">로그아웃</a>&ndash;&gt;-->
        <!--                &lt;!&ndash;<a onclick="logout()">로그아웃</a>&ndash;&gt;-->
        <!--            </li>-->
        <!--            <li id="w_admin"><a onclick="location.href='/admin/admin.html'">관리자 페이지로 넘어가기.</a></li>-->
        <!--        </ul>-->
        <!--    </div>-->
    <div id="burgerbtn" onclick="headerAction();"><img style="wdith: 100%; height: 100%;"
                                                       src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGQ9Ik0yNCAxOHYxaC0yNHYtMWgyNHptMC02djFoLTI0di0xaDI0em0wLTZ2MWgtMjR2LTFoMjR6IiBmaWxsPSIjMTA0MGUyIi8+PHBhdGggZD0iTTI0IDE5aC0yNHYtMWgyNHYxem0wLTZoLTI0di0xaDI0djF6bTAtNmgtMjR2LTFoMjR2MXoiLz48L3N2Zz4=">
    </div>
    </div>
</header>