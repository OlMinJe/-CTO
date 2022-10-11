<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>서브페이지_b</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/event/event_detail.css">
    <script type="text/javascript" src="/js/event.js"></script>
    <script type="text/javascript" src="/js/includeHtml.js"></script>
</head>

<body>
<!--부트스트랩 스크립트 설정-->
<!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->

<!-- col-함수의 경우 기본적으로 padding-left.right 값이 들어가더라구!
    그래서 그냥 최상위 부모한테는 max-width: 1330px;만 줘도 될 거 같아!
    대신 다른 요소에서 col-함수 사용하면 css로 padding값 초기화 시켜주면 될 거 같아~! -->

<!--화면 구조 설계-->
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 event_detail">
    <div id ="event-container">
        <div id="event_top">
            <div class="col-12 event_wrap">
                <ul>
                    <li class="col-12"><a href="#" class="btn-two pink rounded">삼행시</a></li>
                    <li class="col-12"><a href="#" class="btn-two purple rounded">독서감상대회</a></li>
                    <li class="col-12"><a href="#" class="btn-two blue rounded">?</a></li>
                </ul>
            </div>
        </div>

        <!--
                <div class="event-detail-main">
                    <input type="radio" id="tab-1" name="show" checked/>
                    <input type="radio" id="tab-2" name="show" />
                    <div class="tab">
                        <label for="tab-1">참여하기</label>
                        <label for="tab-2">다른사람들의 참여내역</label>
                    </div>
                    <div class="event-detail-content">
                        <div class="content-dis">
                            참여하기
                        </div>
                        <div class="content-dis">
                            다른사람들의 참여냐역
                        </div>
                    </div>

        -->

        <div class="col-12 col-md-10 menu">
            <ul class="menu-wrap">
                <li class="col-6  box_eft_01" id="active_normal">
                    참여하기
                </li>
                <li class="col-6 active box_eft_01" id="active_woman">
                    다른 사람들의 참여 내역
                </li>
            </ul>


        </div>
        <div class="col-12 col-md-10 event_content"  >
            <div class="col-12 view_wrap">
                <div class="col-12 col-md-10 view_con">
                    <div class="col-12 category_title">카테고리</div>
                    <div class="col-12 view_list">
                        <div class="col-12 board_view_title">글 제목</div>
                        <div class="col-12 board_view_info">
                            <dl>
                                <dt>번호</dt>
                                <dd>1</dd>
                            </dl>
                            <dl>
                                <dt>글쓴이</dt>
                                <dd>김배화</dd>
                            </dl>
                            <dl>
                                <dt>작성일</dt>
                                <dd>2022.07.13</dd>
                            </dl>
                            <dl>
                                <dt>조회</dt>
                                <dd>33</dd>
                            </dl>
                        </div>
                        <div class="col-12 board_view_content">
                            글 내용<br>
                            글 내용<br>
                            글 내용<br>
                            글 내용<br>
                            글 내용<br>
                            글 내용<br>
                            글 내용<br>
                            글 내용
                        </div>
                    </div>
                    <div class="col-12 btn_wrap">
                        <a onclick="location.href='/advice/advice.jsp';" class="on box_eft_02">목록</a>
                    </div>

                    <!-- 여기 댓글 -->
                    <div class="col-12 comment_box">
                        <div class="col12 comment_num ">댓글수<span>카운트해서 넣기</span></div>
                        <div class="col-12 comment_writer">
                            <div class="col-12 input_box">
                                <!-- TODO : https://tried.tistory.com/95 -->
                                <button class="btn btn-outline-success box_eft_02" type="submit">댓글 등록</button>
                            </div>
                        </div>
                    </div>

                </div>

                <button style="margin: auto; display: block;" type="button" name="sam_button"> 더보기 </button>

            </div>
            <jsp:include page="../fixed/footer.jsp"></jsp:include>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>