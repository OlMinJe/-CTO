<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>삼행기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/event/event_detail.css">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
    <script type="text/javascript" src="/js/event.js"></script>
    <script>
        function btn() {
            alert('제출이 완료되었습니다.');
        }
    </script>

</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<!--부트스트랩 스크립트 설정-->
<!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->

<!-- col-함수의 경우 기본적으로 padding-left.right 값이 들어가더라구!
    그래서 그냥 최상위 부모한테는 max-width: 1330px;만 줘도 될 거 같아!
    대신 다른 요소에서 col-함수 사용하면 css로 padding값 초기화 시켜주면 될 거 같아~! -->

<!--화면 구조 설계-->


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
            <!-- 서브 메뉴 -->
            <input type="radio" id="event_tab-1" name="show" checked/>
            <input type="radio" id="event_tab-2" name="show"/>
            <div class="event_menu">
                <label style="width: 100vh;" class="col-md-6 box_eft_01" for="event_tab-1">참여하기</label>
                <label style="width: 100vh;" class="col-md-6 box_eft_01" for="event_tab-2">다른 사람들의 참여내역</label>
            </div>
            <!-- content 영역-->
            <div class="col-12 event-detail-content">
                <!-- 참여하기 -->
                <div class="col-12 content-dis">
                    <div class="col-12 col-md-10 event_content">
                        <h4 style="text-align: left;"> 제 n회차 삼행시 </h4>
                        <div class="col-12 event_content_top">
                            <div class="event_detail_box">응모중</div>
                            <p style="text-align: left;">기간 : 2022.07.27 ~ 2022.12.31</p>
                        </div>
                        <i style="text-align:left;">※ 삼행시 단어를 꼭 포함해서 제출해주세요! ※ </i>
                        <label class="event_detail_label">살<input type="text"> </label>
                        <label class="event_detail_label">려<input type="text"> </label>
                        <label class="event_detail_label">줘<input type="text"> </label>
                        <div class="btn_wrap">
                            <a class="box_eft_02" onclick="javascript:btn()">제출하기</a>
                        </div>
                    </div>
                </div>
                <!-- 참여내역 -->
                <div class="col-12 content-dis">
                    <div class="col-12 event_content">
                        <h4 style="text-align: left;"> 제 n회차 삼행시 </h4>
                        <div class="col-12 event_content_top">
                            <div class="event_detail_box">응모중</div>
                            <p style="text-align: left;">기간 : 2022.07.27 ~ 2022.12.31</p>
                        </div>
                    </div>
                    <hr/>
                    <div class="event_sub_content text">
                        <div style="text-align: left;">
                            <ul class="col-12">
                                <li>살려줘</li>
                                <img src="/img/heart.png" style="float: right; margin-right: 35px;" alt="좋아요">
                                <!-- 하트 이모지 변경하여 리액트 구현 예정 -->
                                <!-- 데이터 가져오기 ( 수정 예정 )  -->
                                <li>살려주세요</li>
                                <li>려기 죽어가요</li>
                                <li>줘, 졸업장</li>
                            </ul>
                            <hr/>
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