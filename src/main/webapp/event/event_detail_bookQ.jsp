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
    <link rel="stylesheet" type="text/css" href="/css/fixed/header.css"> <!-- 헤더 -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/footer.css"> <!--푸터-->
    <link rel="stylesheet" type="text/css" href="/css/event/event_detail.css">
    <script type="text/javascript" src="/js/event.js"></script>
    <script type="text/javascript" src="/js/includeHtml.js"></script>
    <script>
        function btn() {
            alert('제출이 완료되었습니다.');
        }
    </script>

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
                        <p>독서 퀴즈 내용</p>
                    </div>
                    <!-- 참여하기 버튼 -->
                    <div class="btn_wrap">
                        <a href="/event/event_detail_bookQ.jsp" class="box_eft_02">이벤트 참여하기</a>
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
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item2">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ2.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item3">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ3.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item4">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ4.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item5">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ5.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item6">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ6.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item7">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ7.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
                                    </div>
                                </li>
                                <li class="col-12 col-sm-6 col-lg-4 Enter_bookQ_item item8">
                                    <img class="Enter_image" src="/img/Enter_list_bookQ/Enter_list_bookQ8.jpeg">
                                    <!-- css로 background:url 안 먹혀서 임시 방편 -->
                                    <div>
                                        <strong>책 제목</strong>
                                        <p>저자/출판사</p>
                                        <a href="#">바로가기</a>
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