<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>삼행시</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/event/event_detail.css">
    <script type="text/javascript" src="/js/event.js"></script>
<%--    <script>--%>
<%--        window.onload = function btn() {--%>
<%--            document.getElementById('detail_input1').onsubmit = function () {--%>
<%--                var user = document.createElement("p")--%>
<%--                user.textContent = this.event_detail_label.value()--%>
<%--                document.getElementsByTagName('detail_output')[0].appendChild(user)--%>

<%--                // 내용 처리 후 input 지우는 코드--%>
<%--                this.event_detail_label.value = ""--%>

<%--                return false;--%>
<%--            }--%>
<%--        }--%>
    <script>
        function btn() {
            alert('제출이 완료되었습니다.\n 50포인트가 적립되었습니다.');
            location.href='/event/event_detail.jsp?stateCode=${stateCode}';
            ///event/event_detail.jsp?stateCode=1
        }
    </script>
<%--    <script>--%>
<%--        $(".w3-pagination a").click(function() {--%>

<%--            var selector = $(this);--%>

<%--            var current_index = $(".w3-pagination a").index(this);--%>
<%--            var current_class = selector.attr("class");--%>

<%--            if (current_index != 0 || current_index != 6) {--%>

<%--                $(".w3-pagination a").each(function(index) {--%>

<%--                    if (index == 0 || index == 6) {--%>
<%--                        return true;--%>
<%--                    } else {--%>
<%--                        if (index == current_index) {--%>
<%--                            $(this).addClass("w3-pale-red");--%>
<%--                        } else {--%>
<%--                            $(this).removeClass("w3-pale-red");--%>
<%--                        }--%>
<%--                    }--%>

<%--                });--%>

<%--            }--%>

<%--        });--%>
<%--    </script>--%>

</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<!--부트스트랩 스크립트 설정-->
<!--<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>-->

<!-- col-함수의 경우 기본적으로 padding-left.right 값이 들어가더라구!
    그래서 그냥 최상위 부모한테는 max-width: 1330px;만 줘도 될 거 같아!
    대신 다른 요소에서 col-함수 사용하면 css로 padding값 초기화 시켜주면 될 거 같아~! -->

<!--화면 구조 설계-->

<%-- 삼행시 --%>
<div class="col-12 event_detail">
    <div class="col-12 col-md-10" id="event-container">
        <!-- 카테고리 메뉴 -->
        <div class="col-12" id="event_top">
            <div class="col-12 event_wrap">
                <ul>
                    <li class="col-12 col-md-4"><a href="/event/event_detail.jsp"
                                                   class="col-12 event_btn pink rounded" style="background-color: #cb99c5;">삼행시</a></li>
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
                        <h4 style="text-align: left;"> 제 1회차 삼행시 </h4><!--회차 지정 방법 생각하기-->
                        <div class="col-12 event_content_top">
                            <div class="event_detail_box">응모중</div>
                            <p style="text-align: left;">기간 : 2022.07.27 ~ 2022.12.31</p>
                        </div>
                    <br/>
                        <i  class="sam_detail_i">※ 삼행시 단어를 꼭 포함해서 제출해주세요! ※ </i>

                        <div class="sam_input" style="margin-top: 20px;">
                        <label class="event_detail_label">다<input style="margin-left: 20px;" type="text"> </label>
                        <label class="event_detail_label">온<input style="margin-left: 20px;" type="text"> </label>
                        <label class="event_detail_label">이<input style="margin-left: 20px;" type="text"> </label>
<%--                        <div class="col-12 sam_detail_write">--%>
<%--                            <form class="detail_input1">--%>
<%--                                <label for ="event_detail_label" class="event_detail_label">다 온 이</label>--%>
<%--                                <input type="text"  class="box_eft_01" style="width: 80%; height: 20vh; margin : 20px 0 0 40px; " id="event_detail_label" name="event_detail_label" autocomplete="off" placeholder="입력" />--%>
<%--&lt;%&ndash;                                detail_input&ndash;%&gt;--%>
<%--                            </form>--%>
                        </div>
                        <%--<div class="btn_wrap">
                            <a class="box_eft_02" onclick="javascript:btn()">제출하기</a>
                        </div>--%>
                        <div class="btn_wrap">
                            <%--<a class="box_eft_02" onclick="javascript:btn()">제출하기</a>--%>
                            <c:if test="${sessionScope.stateCode ne null}">
                                <a class="box_eft_02" style="margin-left: 5px;" onclick="location.href='/event/event_point?stateCode=${stateCode}'">제출하기</a>
                            </c:if>
                        </div>

                    </div>
                </div>
                <!-- 참여내역 -->
                <div class="col-12 content-dis">
                    <div class="col-12 event_content">
                        <h4 style="text-align: left;"> 제 1회차 삼행시 </h4>
                        <div class="col-12 event_content_top">
                            <div class="event_detail_box">응모중</div>
                            <p style="text-align: left;">기간 : 2022.07.27 ~ 2022.12.31</p>
                        </div>
                    </div>
                    <hr/>
                    <div class="event_sub_content text">
                        <div style="text-align: left;">
                            <ul class="col-12 detail_output">
                                <ul class="col-12" style="border-bottom: 1px solid #dcc5df; margin-bottom: 10px;">
                                    <li>다온이</li>
                                    <%--<img src="/img/heart.png" style="float: right; margin-right: 35px;" alt="좋아요">--%>
                                    <!-- 데이터 가져오기 ( 수정 예정 )  -->
                                    <li>다양한</li>
                                    <li>온라인 서비스를</li>
                                    <li>이용하고 싶어</li>
                                </ul>

                                <ul class="col-12" style="border-bottom: 1px solid #dcc5df; margin-bottom: 10px;">
                                    <li>다온이</li>
                                    <%--<img src="/img/heart.png" style="float: right; margin-right: 35px;" alt="좋아요">--%>
                                    <li>다시 없는 이 기회가</li>
                                    <li>온 바로 지금</li>
                                    <li>이제 시작하자</li>
                                </ul>
                                <ul class="col-12" style="border-bottom: 1px solid #dcc5df; margin-bottom: 10px;">
                                    <li>다온이</li>
                                    <%--<img src="/img/heart.png" style="float: right; margin-right: 35px;" alt="좋아요">--%>
                                    <li>다같이</li>
                                    <li>온기를 나누는</li>
                                    <li>이 겨울밤</li>
                                </ul>
                                <ul class="col-12" style="border-bottom: 1px solid #dcc5df; margin-bottom: 10px;">
                                    <li>다온이</li>
                                    <%--<img src="/img/heart.png" style="float: right; margin-right: 35px;" alt="좋아요">--%>
                                    <li>다름이 아니라</li>
                                    <li>온전히</li>
                                    <li>이 마음을 전하고 싶어</li>
                                </ul>
                                <ul class="col-12" style="border-bottom: 1px solid #dcc5df; margin-bottom: 10px;">
                                    <li>다온이</li>
                                    <%--<img src="/img/heart.png" style="float: right; margin-right: 35px;" alt="좋아요">--%>
                                    <li>다같이</li>
                                    <li>온정을 나누는</li>
                                    <li>이 마음</li>
                                </ul>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</script>

<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script type="text/javascript" src="/js/event.js"></script>
</body>
</html>