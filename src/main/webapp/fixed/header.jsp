<%@ page import="com.project.vo.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="/css/fixed/header.css">
<script type="text/javascript" src="/js/includeHtml.js"></script>
<header>
    <!-- 고정 헤더(스크롤 내리면 보이는 헤더)-->
    <div class="col-12 fixed_header" style="position:fixed; display: none; justify-content: space-between; align-items: center;">
        <div class="col-1 header_logo">
            <c:if test="${sessionScope.stateCode == 1}">
                <a href="/main?stateCode=1" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
            </c:if>
            <c:if test="${sessionScope.stateCode ne 1}">
                <a href="/" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
            </c:if>
            <!--관리자의 경우 다시 만들기-->
            <%--<c:if test="${sessionScope.stateCode == 0}">
                <a href="/main?stateCode=1" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
            </c:if>
            <c:if test="${sessionScope.stateCode ne 0}">
                <a href="/" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
            </c:if>--%>
        </div>
        <c:if test="${sessionScope.stateCode ne 1}">
            <div class="col-0 mypage_btn" onclick="location.href='/login/login.jsp'">로그인</div>
        </c:if>
        <c:if test="${sessionScope.stateCode == 1}">
            <div class="col-0 mypage_btn" onclick="location.href='/mypage/mypage.jsp?stateCode=${stateCode}'">마이페이지</div>
        </c:if>
    </div>
    <!-- 모바일 메뉴(모바일) -->
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
                        <img class="weatherIcon01">
                        <span class="weatherInfo01"></span>
                    </li>
                    <c:if test="${sessionScope.stateCode ne 1}">
                    <li id="m_visitor">
                        <a onclick="location.href='/login/login.jsp'">로그인</a>&nbsp;
                        <a onclick="location.href='/login/register.jsp'">회원가입</a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.stateCode == 1}">
                    <li id="m_user">
                        <div class="user_name">
                        <%--<span th:text="${session.id}"></span>님, 환영합니다.</div>--%>
                        <span>
                        <%
                            if (session.getAttribute("member") == null) {
                                out.println(" ");
                            } else {
                                MemberVO vo = (MemberVO) session.getAttribute("member");
                                out.println(vo.getMb_id() + "님 반갑습니다.<br>");
                            }
                        %>
                        </span>
                        <a onclick="location.href='/mypage/mypage.jsp?stateCode=${stateCode}'">마이페이지</a>
                        <a onclick="location.href='/login/logout.jsp'">로그아웃</a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.stateCode == 0}">
                        <li id="m_admin"><a onclick="location.href='/'">관리자 페이지</a></li>
                    </c:if>
                </ul>
            </li>
            <li class="m_nav_title" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">커뮤니티</li>
            <li class="m_nav_title" onclick="location.href='/advice/advice.jsp?stateCode=${stateCode}'">상담</li>
            <li class="m_nav_title" onclick="location.href='/location/location.jsp?stateCode=${stateCode}'">위치기반</li>
            <li class="m_nav_title" onclick="location.href='/Entertainment/Entertainment.jsp?stateCode=${stateCode}'">ENT</li>
            <li class="m_nav_title" onclick="location.href='/event/event_detail.jsp?stateCode=${stateCode}'">이벤트</li>
            <li class="m_nav_title" onclick="location.href='/report/report.jsp?stateCode=${stateCode}'">신고</li>
        </ul>
    </div>
    <!-- 기본 헤더(웹) -->
    <div class="col-12 header_wrap" id="header">
        <div class="col-1 col-md-2 header_logo">
            <c:if test="${sessionScope.stateCode == 1}">
                <a href="/main?stateCode=1" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
            </c:if>
            <c:if test="${sessionScope.stateCode ne 1}">
                <a href="/" class="logo"><img src="/img/CTO_Logo_02.png" alt="Logo"></a>
            </c:if>
        </div>
        <ul class="col-6 nav_mian">
            <c:if test="${sessionScope.stateCode ne 1}">
                <li class="nav_title" onclick="location.href='/com?category=10'">커뮤니티</li>
                <li class="nav_title" onclick="location.href='/advice/advice?stateCode=${stateCode}&category=0'">상담</li>
                <li class="nav_title" onclick="location.href='/location/location.jsp?stateCode=${stateCode}'">위치기반</li>
                <li class="nav_title" onclick="location.href='/Entertainment/Entertainment.jsp?stateCode=${stateCode}'">ENT</li>
                <li class="nav_title" onclick="location.href='/event/event_detail.jsp?stateCode=${stateCode}'">이벤트</li>
                <li class="nav_title" onclick="location.href='/report/report.jsp?stateCode=${stateCode}'">신고</li>
            </c:if>
            <c:if test="${sessionScope.stateCode ==1}">
                <li class="nav_title" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">커뮤니티</li>
                <li class="nav_title" onclick="location.href='/advice/advice?stateCode=${stateCode}&category=0'">상담</li>
                <li class="nav_title" onclick="location.href='/location/location.jsp?stateCode=${stateCode}'">위치기반</li>
                <li class="nav_title" onclick="location.href='/Entertainment/Entertainment.jsp?stateCode=${stateCode}'">ENT</li>
                <li class="nav_title" onclick="location.href='/event/event_detail.jsp?stateCode=${stateCode}'">이벤트</li>
                <li class="nav_title" onclick="location.href='/report/report.jsp?stateCode=${stateCode}'">신고</li>
            </c:if>

        </ul>
        <div class="col-2 container">
            <img class="weatherIcon">
            <span class="weatherInfo"></span>
        </div>
        <div class="col-2 w_right">
            <ul>
                <c:if test="${sessionScope.stateCode ne 1}">
                <li id="w_visitor">
                    <a onclick="location.href='/login/login.jsp'">로그인</a>
                    <a onclick="location.href='/login/register.jsp'">회원가입</a>
                </li>
                </c:if>
                <c:if test="${sessionScope.stateCode == 1}">
                <li id="w_user">
                    <div class="user_name">
                        <%--<span text="${session.id}">님, 환영합니다.</span>--%>
                        <span>
                        <%
                            if (session.getAttribute("member") == null) {
                                out.println(" ");
                            } else {
                                MemberVO vo = (MemberVO) session.getAttribute("member");
                                out.println(vo.getMb_id() + "님 반갑습니다.<br>");
                            }
                        %>
                        </span>
                    </div>
                    <a onclick="location.href='/mypage/mypage.jsp?stateCode=${stateCode}'">마이페이지</a>
                    <a onclick="location.href='/login/logout.jsp'">로그아웃</a>
                    <%--<a th:href="@{/login/logout.html}">로그아웃</a>
                    <a onclick="logout()">로그아웃</a>--%>
                </li>
                </c:if>
                <c:if test="${sessionScope.stateCode == 0}">
                    <li id="m_admin"><a onclick="location.href='/'">관리자 페이지</a></li>
                </c:if>
            </ul>
        </div>
    <div id="burgerbtn" onclick="headerAction();"><img style="wdith: 100%; height: 100%;"
                                                       src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGQ9Ik0yNCAxOHYxaC0yNHYtMWgyNHptMC02djFoLTI0di0xaDI0em0wLTZ2MWgtMjR2LTFoMjR6IiBmaWxsPSIjMTA0MGUyIi8+PHBhdGggZD0iTTI0IDE5aC0yNHYtMWgyNHYxem0wLTZoLTI0di0xaDI0djF6bTAtNmgtMjR2LTFoMjR2MXoiLz48L3N2Zz4=">
    </div>
    </div>
</header>