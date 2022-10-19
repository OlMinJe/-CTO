<%@ page import="com.project.vo.MemberVO" %>
<%@ page import="com.project.vo.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" ; charset="UTF-8"> <!-- 추가 필수 -->
    <title>Main</title>
    <!--추가-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/> <!-- 스와이퍼 -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0b9488f11b6cad91c9c64919764e1de"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/main/main.css">
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <div class="col-12 main">
        <div class="col-12 search_wrap mb">
            <!--221005-->
            <form id="search_input">
                <input type="text" id="search" class="box_eft_01">
                <button id="search_btn" class="box_eft_02">검색하기</button>
            </form>
        </div>
        <%--    <div class="col-12 search-wrap mb">
            <div class="board-content-search">
                <div class="selectbox">
                    <button type="button" class="bt-select">
                        <span>제목</span><i class="ico"></i></button>
                    <ul class="box_eft_00">
                        <li><a href="#">제목</a></li>
                        <li><a href="#">제목+본문</a></li>
                        <li><a href="#">작성자</a></li>
                    </ul>
                </div>
                <div class="tagsearch">
                    <input type="text" id="searchText" class="box_eft_01" placeholder="검색어를 입력하세요." autocomplete="off">
                    <button class="bt-submit"></button>
                </div>
            </div>
        </div>--%>
        <div class="col-12 second_row_wrap mb">
            <div class="col-12 col-md-6 location_wrap">
                <div id="map" style="width:100%;height:346px;"></div>
            </div>
            <div class="col-12 col-md-6 user_wrap"><!--회원 정보 및 로그인-->
                <!-- [1] 로그인 화면  -->
                <!--
                <div class="col-12 login">
                    <div class="title" style="text-align: center; margin-bottom: 15px;">로그인</div>
                    <form action='/userCheck' method="post" class="col-12 col-lg-10">
                        <input type="text" class="box_eft_01" id="mb_id" name="mb_id" placeholder="아이디를 입력해주세요.">
                        <input type="password" class="box_eft_01" id="mb_pw" name="mb_pw" placeholder="비밀번호를 입력해주세요.">
                        <div class="col-12 input_type" style="margin-bottom: 20px;">
                            <div class="col-7 user_id_pass">
                                <input type="button" title="아이디 찾기" id="find_id_btn" value="아이디 찾기"
                                       onclick="location.href='/login/find_id_form.html'">
                                <input type="button" title="비밀번호 찾기" id="find_pw_btn" value="비밀번호 찾기"
                                       onclick="location.href='/login/find_pw_form.html'">
                            </div>
                            <div class="col-5 new_user">
                                <input type="button" value="회원가입" onclick="location.href='/login/register.html'">
                            </div>
                        </div>
                        <input type="submit" value="로그인" class="btn box_eft_02">
                    </form>
                </div>
                -->
                <!-- [2] 유저 로그인 완료 이후 화면-->
                <div class="col-12 user_login">
                    <div class="col-12 user_login_top">
                        <ul class="col-12 user_information">
                            <li class="col-3 user_profile">
                                <img src="">프로필 사진
                            </li>
                            <li class="col-4 user_home_01">
                                <span>
                                    <%
                                        if (session.getAttribute("member") == null) {
                                            out.println("<a href='/'로그인</a>");
                                        } else {
                                            MemberVO vo = (MemberVO) session.getAttribute("member");
                                            out.println(vo.getMb_id() + "님 반갑습니다.<br>");
                                        }
                                    %>
                                </span>
                                <a class="box_eft_02" onclick="location.href='/login/login.jsp'">로그인</a>
                                <%--<a class="box_eft_02" onclick="location.href='/mypage/mypage.jsp?stateCode=${stateCode}'">마이페이지</a>--%>
                                <c:if test="${stateCode == '1'}">
                                    <a class="box_eft_02"
                                       onclick="location.href='/mypage/mypage.jsp?stateCode=${stateCode}'">마이페이지</a>
                                </c:if>
                                <%--<c:if test="${stateCode == null}">
                                    <a class="box_eft_02" onclick="location.href='/login/login.jsp'">마이페이지</a>
                                </c:if>--%>
                                <a class="box_eft_02" onclick="location.href='/mypage/mypage.jsp'">마이페이지</a>
                            </li>
                            <li class="col-5 user_home_02">
                                <span>300P</span>
                                <a class="logout" onclick="location.href='/login/logout.jsp'"
                                   title="Logout icons created by Pixel perfect - Flaticon"></a>
                                <c:if test="${stateCode == '0'}">
                                    <button type="button" class="admin_page_btn box_eft_02"
                                            onclick="location.href='/admin/securityAdmin.jsp'">관리자 페이지로 넘어가기
                                    </button>
                                </c:if>
                                <%--<button type="button" class="admin_page_btn box_eft_02" onclick="location.href='/admin/securityAdmin.jsp'">관리자 페이지로 넘어가기</button>--%>
                                <%--<c:if test="${stateCode == '0'}"> <!--적용 안됨;;;-->
                                    <button type="button" class="admin_page_btn box_eft_02" onclick="location.href='/admin/securityAdmin.jsp'">관리자 페이지로 넘어가기</button>
                                </c:if>--%>
                            </li>
                        </ul>
                    </div>
                    <div class="col-12 user_login_bottom">
                        <!--
                        TODOLIST: 사용설명서
                        1. 체크 박스를 누르면 할 일 완료
                        2. 할 일을 더블클릭하면
                        2. 할 일을 클릭하면 완료
                        3. x 버튼 누르면 삭제
                        -->
                        <div class="col-12 title">TODOLIST</div>
                        <div class="to-dos" id="toDoList">
                            <form id="A17-todo" style="margin-bottom: 10px;">
                                <input type="text" class="box_eft_01" placeholder="할 일 작성하기" required/>
                                <input type="submit" value="추가" class="box_eft_02"/>
                            </form>
                            <ol id="A17-todo-list"></ol>
                        </div>  <!-- id = inputField에 할일이 입력되고 + 버튼이 눌리면 할일이 나타날 공간 만들기-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-12 mainvisual_wrap">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide slide01" onclick="location.href='/notice/notice.jsp'">
                    <span>공지사항(ver.22/12/31)</span>
                </div>
                <div class="swiper-slide slide02"><img src="/img/notice_img_ex.jpeg"></div>
                <div class="swiper-slide slide03">Slide 3</div>
                <div class="swiper-slide slide04">Slide 4</div>
            </div>
            <div class="swiper-pagination"></div>
        </div>
    </div>
    <section class="col-12 sub_swiper_wrap mb">
        <canvas id="nigthSky"></canvas>
        <div class="col-12 col-md-8 sub_swiper_con"><!-- https://lpla.tistory.com/149 -->
            <div class="col-6 sub_swiper_list">
                <div class="swiper-container mySwiper">
                    <div class="swiper-wrapper">
                        <!-- 이미지로 넣으면 x -->
                        <div class="swiper-slide slide01">
                            <div class="col-12 swiper_title"
                                 onclick="location.href='https://www.youtube.com/watch?v=VyEJs-u3Wyk';">
                                오늘 하루 <br class="br_hidden"><span class="music">추천곡</span>을<br>들으면서 시작해보면 어떨까요?
                            </div>
                        </div>
                        <div class="swiper-slide slide02">
                            <div class="col-12 swiper_title"
                                 onclick="location.href='https://www.youtube.com/watch?v=yiS5jtvH0zU';">
                                요즘은 <span class="dog">OOO</span>를<br>보고 <i>"힐링"</i>한다구!
                            </div>
                        </div>
                        <div class="swiper-slide slide03">
                            <div class="col-12 swiper_title">
                                Q. 요즘 유행하는 <span>당근게임</span> 들어봤어?
                            </div>
                        </div>
                        <div class="swiper-slide slide04">
                            <div class="col-12 swiper_title">
                                흐엉 아이디어 고갈
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="col-12 main">
        <div class="col-12 wiseSaying_wrap mb">
            <div class="col-3 title">오늘의 명언</div>
            <div class="col-9 wiseSaying_con">명언 연결</div>
        </div>
        <jsp:include page="/community/boardList2.jsp"></jsp:include><!--보기만 가능한 게시판-->
        <div class="col-12 community_wrap mb">
            <div class="col-12 col-lg-7 moble_mb">
                <div class="col-12 community_normal box_eft_00">
                    <ul class="col-12 main_community_menu">
                        <li class="box_eft_01 mb active">일상</li>
                        <li class="box_eft_01 mb">취미</li>
                        <li class="box_eft_01 mb">유머</li>
                        <li class="box_eft_01 mb">음식</li>
                        <li class="box_eft_01">정보</li>
                        <li class="box_eft_01">취업/진로</li>
                        <li class="box_eft_01">기타</li>
                        <span></span>
                    </ul>
                    <div class="content_table">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th style="width: auto;">제목</th>
                                <th style="width: 10%;">댓글수</th>
                            </tr>
                            </thead>
                            <tbody id="main_community_table"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-5 pl">
                <div class="col-12 community_editor box_eft_00">
                    <div class="col-12 community_menu" id="community_menu_02">에디터 칼럼</div>
                    <div class="content_table" id="main_editor_table">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 advice_wrap">
            <ul style="margin-bottom: 15px;">
                <li class="col-0 col-md-3 box_eft_02" onclick="location.href='/advice/advice.jsp';">일반고민</li>
                <li class="col-0 col-md-3 box_eft_02" onclick="location.href='/advice/advice.jsp';">대인관계/가족</li>
                <li class="col-0 col-md-3 box_eft_02" onclick="location.href='/advice/advice.jsp';">정신건강</li>
            </ul>
            <ul>
                <li class="col-0 col-md-3 box_eft_02" onclick="location.href='/advice/advice.jsp';">직장</li>
                <li class="col-0 col-md-3 box_eft_02" onclick="location.href='/advice/advice.jsp';">성소수자</li>
                <li class="col-0 col-md-3 box_eft_02" onclick="location.href='/advice/advice.jsp';">여성</li>
            </ul>
        </div>
        <div class="col-12 fixed" id="fixed">
            <div class="comment" id="fixed_comment">
                <a href="https://frogue.danbee.ai/?chatbot_id=6e82d227-24d2-4b8d-b68c-9d7b995d48cc&force_welcome=Y">챗봇 상담하러
                    가기(클릭)</a>
            </div>
        </div>
    </div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/main.js"></script>
</body>
</html>