<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>엔터테인먼트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/Entertainment/Entertainment.css">
    <script>
        function confirm() {
            location.href="/pointModify";
            return true;
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 Enter-container">
    <form action='<c:url value='/pointModify'/>' method="post" onsubmit="return confirm()" enctype="multipart/form-data">
        <div class="col-12 col-md-10 Ent_main">
            <input type="radio" id="Ent_tab-1" name="show" checked/>
            <input type="radio" id="Ent_tab-2" name="show"/>
            <div class="Ent_menu">
                <label class="col-md-6 box_eft_01" for="Ent_tab-1">게임</label>
                <label class="col-md-6 box_eft_01" for="Ent_tab-2">테스트</label>
            </div>


            <div class="col-12 Ent_content">
                <div class="col-12 content-dis" style="height: 100%;">
                    <div class="col-12 Ent_main_content">
                        <div class="col-12 Enter_list_wrap">
                            <ul>
                                <li class="col-12 col-sm-6 col-md-4 Enter_item item1">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_Game/Enter_TetrisGame.png"></div>
                                        <div class="Enter_content">
                                            <strong>테트리스</strong>
                                            <p>간단하게 무료 퍼즐 게임을 즐겨보세요!</p>
                                            <a href="Enter_tetris.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-md-4 Enter_item item2">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_Game/Enter_typingGame.png"></div>
                                        <div class="Enter_content">
                                            <strong>타이핑 게임</strong>
                                            <p>차근 차근 타자 실력을 키워보세요!</p>
                                            <a href="Enter_TypingGame.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-md-4 Enter_item item3">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_Game/Enter_2048_Game.png"></div>
                                        <div class="Enter_content">
                                            <strong>2048</strong>
                                            <p>최종 숫자 2048을 만들어보세요!</p>
                                            <a href="Game2048.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                               <li class="col-12 col-sm-6 col-md-4 Enter_item item4">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_Game/Ent_RPSGame.png"></div>
                                        <div class="Enter_content">
                                            <strong>가위바위보 게임</strong>
                                            <p>컴퓨터와 가위바위보 해보세요!</p>
                                            <a href="RSPGame.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="col-12 content-dis" style="height: 100%;">
                    <div class="col-12 Ent_main_content">
                        <div class="col-12 Enter_list_wrap">
                            <ul>
                                <li class="col-12 col-sm-6 col-md-4 Enter_item item5">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_jadoo_test/Enter_jadoo_title_image.png"></div>
                                        <div class="Enter_content">
                                            <strong>안녕자두야 MBTI</strong>
                                            <p>내가 안녕자두야 속 캐릭터라면?</p>
                                            <a href="/Entertainment/Enter_mbti_jadoo.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-md-4 Enter_item item6">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_animal_test/Enter_ani_test_title.jpg"></div>
                                        <div class="Enter_content">
                                            <strong>반려견 테스트</strong>
                                            <p>나의 반려견 유형은?</p>
                                            <a href="/Entertainment/Enter_animal_test.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-md-4 Enter_item item7">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_trip_test/Enter_trip_test_title.jpg"></div>
                                        <div class="Enter_content">
                                            <strong>여행지 테스트</strong>
                                            <p>나의 여행스타일과 잘 맞는 국내 여행지는?</p>
                                            <a href="/Entertainment/Enter_trip_test.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-md-4 Enter_item item8">
                                    <div class="col-12 Enter_item_border">
                                        <div><img class="Enter_image"
                                                  src="/img/Enter_HarryPotter_test/Enter_HarryPotter.jpeg"></div>
                                        <div class="Enter_content">
                                            <strong>해리포터 속으로 들어간다면?</strong>
                                            <p>호그와트 미리 체험하기</p>
                                            <a href="/Entertainment/Enter_test_potter.jsp">바로가기</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="btn_wrap">
                    <a href="/event/event_detail_bookQ.jsp" class="box_eft_02">이벤트 참여하기</a>
                </div>

            </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="stateCode" value="${stateCode}"/>
        <input type="hidden" name="mb_nick" id="mb_nick" value="${data.mb_nick}">
    </form>
</div>

<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/Entertainment.js"></script>
</body>
</html>


<%--<div class="col-12 Enter-container">
    <div class="col-12 col-md-10 Ent_main">
        <input type="radio" id="Ent_tab-1" name="show" checked/>
        <input type="radio" id="Ent_tab-2" name="show"/>
        <div class="Ent_menu">
            <label class="col-md-6 box_eft_01" for="Ent_tab-1">게임</label>
            <label class="col-md-6 box_eft_01" for="Ent_tab-2">테스트</label>
        </div>


        <div class="col-12 Ent_content">
            <div class="col-12 content-dis" style="height: 100%;">
                <div class="col-12 Ent_main_content">
                    <div class="col-12 Enter_list_wrap">
                        <ul>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item1">
                                <div class="col-12 Enter_item_border">
                                    <div> <img class="Enter_image"
                                               src="/img/Enter_Game/Enter_TetrisGame.png"></div>
                                    <div class="Enter_content">
                                        <strong>테트리스</strong>
                                        <p>간단하게 무료 퍼즐 게임을 즐겨보세요!</p>
                                        <a href="Enter_tetris.jsp">바로가기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item2">
                                <div class="col-12 Enter_item_border">
                                    <div ><img class="Enter_image"
                                               src="/img/Enter_Game/Enter_typingGame.png"></div>
                                    <div class="Enter_content">
                                        <strong>타이핑 게임</strong>
                                        <p>차근 차근 타자 실력을 키워보세요!</p>
                                        <a href="Enter_TypingGame.jsp">바로가기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item3">
                                <div class="col-12 Enter_item_border">
                                    <div ><img class="Enter_image"
                                               src="/img/Enter_Game/Enter_2048_Game.png"></div>
                                    <div class="Enter_content">
                                        <strong>2048</strong>
                                        <p>최종 숫자 2048을 만들어보세요!</p>
                                        <a href="Game2048.jsp">바로가기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item4">
                                <div class="col-12 Enter_item_border">
                                    <div ><img class="Enter_image"
                                               src="/img/Enter_Game/Enter_game_image.jpeg"></div>
                                    <div class="Enter_content">
                                        <strong>게임 제목1</strong>
                                        <p>게임 내용 소개</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="col-12 content-dis" style="height: 100%;">
                <div class="col-12 Ent_main_content">
                    <div class="col-12 Enter_list_wrap">
                        <ul>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item5">
                                <div class="col-12 Enter_item_border">
                                    <div><img class="Enter_image"
                                              src="/img/Enter_jadoo_test/Enter_jadoo_title_image.png"></div>
                                    <div class="Enter_content">
                                        <strong>안녕자두야 MBTI</strong>
                                        <p>내가 안녕자두야 속 캐릭터라면?</p>
                                        <a href="/Entertainment/Enter_mbti_jadoo.jsp">바로가기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item6">
                                <div class="col-12 Enter_item_border">
                                    <div><img class="Enter_image" src="/img/Enter_animal_test/Enter_ani_test_title.jpg"></div>
                                    <div class="Enter_content">
                                        <strong>반려견 테스트</strong>
                                        <p>나의 반려견 유형은?</p>
                                        <a href="/Entertainment/Enter_animal_test.jsp">바로가기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item7">
                                <div class="col-12 Enter_item_border">
                                    <div> <img class="Enter_image" src="/img/Enter_trip_test/Enter_trip_test_title.jpg"></div>
                                    <div class="Enter_content">
                                        <strong>여행지 테스트</strong>
                                        <p>나의 여행스타일과 잘 맞는 국내 여행지는?</p>
                                        <a href="/Entertainment/Enter_trip_test.jsp">바로가기</a>
                                    </div>
                                </div>
                            </li>
                            <li class="col-12 col-sm-6 col-md-4 Enter_item item8">
                                <div class="col-12 Enter_item_border">
                                    <div> <img class="Enter_image" src="/img/Enter_HarryPotter_test/Enter_HarryPotter.jpeg"></div>
                                    <div class="Enter_content">
                                        <strong>해리포터 속으로 들어간다면?</strong>
                                        <p>호그와트 미리 체험하기</p>
                                        <a href="/Entertainment/Enter_test_potter.jsp">바로가기</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="btn_wrap">
                <a href="/event/event_detail_bookQ.jsp" class="box_eft_02">이벤트 참여하기</a>
            </div>

        </div>
    </div>
</div>--%>
