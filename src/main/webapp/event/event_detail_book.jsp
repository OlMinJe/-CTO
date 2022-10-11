<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>독서 감상 대회</title>
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
                <label style="width: 100vh;" class="col-md-6 box_eft_01" for="event_tab-2">다른 사람들의 참여내역</label>
            </div>
            <!-- content 영역-->
            <div class="col-12 event-detail-content" style="margin-bottom: 40px;">
                <!-- 참여하기 -->
                <div class="col-12 content-dis">
                    <div class="col-12 event_content">
                        <h4 style="text-align: left;"> 독서감상대회 </h4>
                        <h3 style="text-align: left;">9와 4분의 3 승강장에서 너를 기다려</h3>
                        <div class="col-12 event_content_top">
                            <div class="event_detail_box">응모중</div>
                            <p style="text-align: left;">기간 : 2022.07.27 ~ 2022.12.31</p>
                        </div>
                    </div>
                    <hr/>
                    <div class="col-12" style="padding: 20px;">
                        <input class="col-12 box_eft_01"
                               style="margin-bottom: 20px; padding: 10px 10px;"
                               type=“text” placeholder=제목(보류)>

                        <input class="col-12 box_eft_01"
                               style="padding: 10px 10px; min-height: 300px;" type=“text”
                               placeholder=내용>
                    </div>
                    <div class="btn_wrap">
                        <a class="box_eft_02" onclick="javascript:btn()">제출하기</a>
                    </div>
                </div>
                <!-- 참여내역 -->
                <div class="col-12 content-dis">
                    <div class="col-12 event_content">
                        <ul>
                            <li class="book_title">
                                <div class="col-12 col-sm-5" style="display:inline-block; vertical-align:top;">
                                    <img src="/img/event_book1.jpeg" width="auto;" height="300px;"
                                         alt="event_book1"/>
                                </div>
                                <div class="col-12 col-sm-7">
                                    <p style="font-size: 20px; line-height: 26px; text-align: left;"><b
                                            style="font-size: 20px; line-height: 26px;">책 제목</b> : 코스모스 </p>
                                    <p style="font-size: 20px; line-height: 26px; text-align: left;"><b
                                            style="font-size: 20px; line-height: 26px;">저자/출판사</b> : 칼 세이건 지음 홍승수 옮김 /
                                        사이언스북스</p>
                                </div>
                            </li>
                        </ul>
                        <div class="content-table">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th style="width: 10%;">No.</th>
                                    <th style="width: 10%;">작성자</th>
                                    <th style="width: auto;">제목</th>
                                    <th style="width: 10%;">댓글수</th>
                                </tr>
                                </thead>
                                <tbody id="event-table"></tbody>
                            </table>
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item active"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../fixed/footer.jsp"></jsp:include>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>