<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>독서 퀴즈 대회</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/event/event_detail.css">
    <script type="text/javascript" src="/js/event.js"></script>
    <script>
        function btn(str) {
            alert('이벤트 참여가 완료되었습니다.\n 50포인트가 적립되었습니다.');
        }
        function bookQ1(Q1) {
            alert(' 내가 선택한 값 : ' + Q1 + '\n정답 : 아몬드');
        }
        function bookQ2(Q2) {
            alert('내가 선택한 값 : ' + Q2 + '\n정답 : 이수창 ');
        }
        function bookQ3(Q3) {
            alert('내가 선택한 값 : ' + Q3 + '\n정답 : 어떤책');
        }

    </script>
<%--    <script>--%>
<%--        function btn() {--%>
<%--            var bookQ1 = document.getElementById("bookQ1");--%>
<%--            var bookQ2 = document.getElementById("bookQ2");--%>
<%--            var bookQ3 = document.getElementById("bookQ3");--%>
<%--            var value1 = (bookQ1.options[bookQ1.selectedIndex].value);--%>
<%--            var value2 = (bookQ2.options[bookQ2.selectedIndex].value);--%>
<%--            var value3 = (bookQ3.options[bookQ3.selectedIndex].value);--%>
<%--            alert('이벤트 참여가 완료되었습니다. <br/> 정답 : 아몬드 선택한 값 ' + value1 );--%>

<%--        }--%>
<%--    </script>--%>

</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 event_detail">
    <div class="col-12 col-md-10" id="event-container">
        <!-- 카테고리 메뉴 -->
        <div class="col-12" id="event_top">
            <div class="col-12 event_wrap">
                <ul>
                    <li class="col-12 col-md-4"><a href="/event/event_detail.jsp"
                                                   class="col-12 event_btn pink rounded">삼행시</a></li>
                    <li class="col-12 col-md-4"><a href="/event/event_detail_book.jsp"
                                                   class="col-12 event_btn purple rounded">독서감상대회</a></li>
                    <li class="col-12 col-md-4"><a href="/event/event_detail_bookQ.jsp"
                                                   class="col-12 event_btn blue rounded">?</a></li>
                </ul>
            </div>
        </div>
        <!-- 해당 카테고리 화면 -->
        <div class="col-12 event-detail-main">
            <input type="radio" id="event_tab-1" name="show" checked/>
            <input type="radio" id="event_tab-2" name="show"/>
            <div class="event_menu">
                <label style="width: 100vh;" class="col-md-6 box_eft_01" for="event_tab-1">참여하기</label>
                <label style="width: 100vh;" class="col-md-6 box_eft_01" for="event_tab-2">지난 이벤트</label>
            </div>
            <!-- content 영역-->
            <div class="col-12 event-detail-content">
                <!-- 참여하기 -->
                <div class="col-12 content-dis">
                    <div class="col-12 col-md-10 event_content" style="min-height: 400px;">
                        <h1 style="padding : 20px 0 30px 0">너나들이 독서 퀴즈</h1>
                        <div class="event_book_Q_div">
                            <p style="padding-top: 10px;">다음 책의 표지를 보고 책 제목을 맞춰주세요 !</p>
                            <img style="width: 200px; height: 200px; padding : 20px 0 20px 0;" src="/img/Enter_list_bookQ/event_bookQ_1.jpeg">
<%--                            <select name="event_bookQ1" onchange="btn(this.value)">--%>
                                <select name="event_bookQ1" class="event_bookQ1" onchange="bookQ1(this.value)">
                                <option value="bookQ_1">&nbsp; 선택하세요 &nbsp; </option>
                                <option value="아버지">아버지</option>
                                <option value="아몬드">아몬드</option>
                                <option value="아수라">아수라</option>
                            </select>
                        </div>
                        <div class="event_book_Q_div">
                        <p style="padding-top: 10px;">다음 책의 표지를 보고 책의 저자를 맞춰주세요 !</p>
                        <img style="width: 200px; height: 200px; padding : 20px 0 20px 0;" src="/img/Enter_list_bookQ/event_bookQ_2.png">
                        <select name="event_bookQ2" class="event_bookQ1" onchange="bookQ2(this.value)">
                            <option value="bookQ_2">&nbsp; 선택하세요 &nbsp;</option>
                            <option value="이수창">이수창</option>
                            <option value="이수정">이수정</option>
                            <option value="이수찬">이수찬</option>
                        </select>
                        </div>
                        <div class="event_book_Q_div">
                            <p style="padding-top: 10px;">다음 책의 표지를 보고 책의 출판사를 맞춰주세요 !</p>
                            <img style="width: 200px; height: 200px; padding : 20px 0 20px 0;" src="/img/Enter_list_bookQ/event_bookQ_3.png">
                            <select name="event_bookQ3" class="event_bookQ1" onchange="bookQ3(this.value)">
                                <option value="bookQ_3">&nbsp; 선택하세요 &nbsp;</option>
                                <option value="이런책">이런책</option>
                                <option value="저런책">저런책</option>
                                <option value="어떤책">어떤책</option>
                            </select>
                        </div>
                    </div>
                    <!-- 참여하기 버튼 -->
                    <%--<div class="btn_wrap">
&lt;%&ndash;                        <a href="/event/event_detail_bookQ.jsp" class="box_eft_02">이벤트 참여하기</a>&ndash;%&gt;
                        <a class="box_eft_02" onclick="javascript:btn()">이벤트 참여하기</a>
                    </div>--%>

                    <div class="btn_wrap">
                        <%--<a class="box_eft_02" onclick="javascript:btn()">이벤트 참여하기</a>--%>
                        <c:if test="${sessionScope.stateCode ne null}">
                            <a class="box_eft_02" style="margin-left: 5px;"onclick="location.href='/event/event_point?stateCode=${stateCode}'">제출하기</a>
                        </c:if>
                    </div>
                </div>
                <!-- 참여내역 -->
                <div class="col-12 content-dis">
                    <div class="col-12 event_content">
                        <div class="Enter_list_wrap" style="margin-top: 20px;">
                            <ul>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item1">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ1.jpg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>해리포터 : 죽음의 성물</strong>
                                        <p>저자 : 조앤 K. 롤링<br>출판사 : 문학수첩</p>
<%--                                        <a href="https://terms.naver.com/entry.naver?docId=5739622&cid=43667&categoryId=43667" target='_blank'>바로가기</a>--%>
                                        <a href="event_detail_bookQ_Harry.jsp" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item2">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ2.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책먹는 여우</strong>
                                        <p>저자 : 프란치스카 비어만<br>출판사 : 주니어김영사</p>
                                        <a href="https://search.shopping.naver.com/book/catalog/32464750449?cat_id=50010842&frm=PBOKMOD&query=%EC%B1%85%EB%A8%B9%EB%8A%94+%EC%97%AC%EC%9A%B0&NaPm=ct%3Dl9wtww00%7Cci%3Deb2e4b7d96de0e2ef8ceaffbf0534128a5e9b0eb%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3D7a15e7e6780f2d2fbdf1627904c4d7cd82146c4c" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item3">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ3.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>불편한 편의점</strong>
                                        <p>저자 : 김호연<br>출판사 : 나무옆의자</p>
                                        <a href="https://search.shopping.naver.com/book/catalog/32444990070?cat_id=&frm=PBOKMOD&query=%EB%B6%88%ED%8E%B8%ED%95%9C+%ED%8E%B8%EC%9D%98%EC%A0%90&NaPm=ct%3Dl9wtvdzk%7Cci%3Dd019df0a69c230f0e2b125a05f9f6be188ccf7b8%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3D2b7c46e0a9d0c497b5469869c989ab7109ffa5d8" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item4">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ4.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>시간을 파는 상점</strong>
                                        <p>저자 : 김선영<br>출판사 : 자음과모음</p>
                                        <a href="https://search.shopping.naver.com/book/catalog/32465784576?cat_id=50005708&frm=PBOKMOD&query=%EC%8B%9C%EA%B0%84%EC%9D%84+%ED%8C%8C%EB%8A%94+%EC%83%81%EC%A0%90&NaPm=ct%3Dl9wtuoiw%7Cci%3De1c8cbc7a0dd2f6e0c263d6be09a181aafe06673%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3D71750583c4bdba80f90ef468de9af8b9412cd920" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item5">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ5.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>위저드 베이커리</strong>
                                        <p>저자 : 구병모<br>출판사 : 창비</p>
                                        <a href="https://search.shopping.naver.com/book/catalog/32462364642?cat_id=50010002&frm=PBOKMOD&query=%EC%9C%84%EC%A0%80%EB%93%9C+%EB%B2%A0%EC%9D%B4%EC%BB%A4%EB%A6%AC&NaPm=ct%3Dl9wttvz4%7Cci%3Df12ea07d4af9f03e2a167ea1b3cafd6e98a099f1%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3Da325d7073806ecd19417062c935740bdc0356d62" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item6">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ6.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>벌거벗은 세계사</strong>
                                        <p>저자 : tvn&lt;벌거벗은세계사 &gt;제작팀<br>출판사 : 교보문고</p>
                                        <a href="https://search.shopping.naver.com/book/catalog/33723469618?cat_id=50005872&frm=PBOKMOD&query=%EB%B2%8C%EA%B1%B0%EB%B2%97%EC%9D%80+%EC%84%B8%EA%B3%84%EC%82%AC+%EC%B1%85&NaPm=ct%3Dl9wtt9lk%7Cci%3D055a0327e9c531bc1fd329dad025075854dd8078%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3D2dc019357a50ecccb33b011b90b9197ba3e8745a" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item7">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ7.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>해리포터 : 비밀의 방</strong>
                                        <p>저자 : 조앤 K. 롤링<br>출판사 : 문학수첩</p>
                                        <a href="https://terms.naver.com/entry.naver?docId=5737901&cid=43667&categoryId=43667" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item8">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ8.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>하얼빈</strong>
                                        <p>저자 : 김훈<br>출판사 : 문학동네</p>
                                        <a href="https://search.shopping.naver.com/book/catalog/33684983664?cat_id=50005766&frm=PBOKMOD&section=info&query=%ED%95%98%EC%96%BC%EB%B9%88+%EC%B1%85&NaPm=ct%3Dl9wtni1c%7Cci%3Dd047f311ce785d1c7cdca40118e3776ab86c4628%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3Ded675b334cf9291d1164d2da68f883eb79be2889" target='_blank'>바로가기</a>
                                    </div>
                                </li>
                                <!-- <li class="col-12 col-sm-6 col-md-4 Enter_bookQ_item item8">
                                    <div><img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ8.jpeg">
                                    </div>
                                    <div class="Enter_content">
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>-->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>