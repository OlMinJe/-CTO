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
    <script type="text/javascript" src="/js/event.js"></script>
    <script>
        function btn() {
            alert('제출이 완료되었습니다.\n 50포인트가 적립되었습니다.');
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
                                                   class="col-12 event_btn purple rounded" style="background-color: #cb99c5;">독서감상대회</a></li>
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
                        <h3 style="text-align: left;">꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</h3>
                        <div class="col-12 event_content_top">
                            <div class="event_detail_box">응모중</div>
                            <p style="text-align: left;">기간 : 2022.07.27 ~ 2022.12.31</p>
                        </div>
                    </div>
                    <hr/>
                    <div class="col-12" style="padding: 20px;">
<%--                        <input class="col-12 box_eft_01"--%>
<%--                               style="margin-bottom: 20px; padding: 10px 10px;"--%>
<%--                               type=“text” placeholder=제목(보류)>--%>
                        <select name="event_book1" class="col-12"
                                style="margin-bottom: 20px; padding: 10px 10px; border-radius: 5px; border: 1px solid #dcc5df;">
                            <option value="book0">선택하세요.</option>
                            <option value="book1">꽃말의 틴생 : 서양 문화로 읽는 매혹적인 꽃 이야기</option>
                        </select>


                        <input class="col-12 box_eft_01"
                               style="padding: 10px 10px; min-height: 300px;" type=“text”
                               placeholder=내용>
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
                <!-- 참여내역 -->
                <div class="col-12 content-dis">
                    <div class="col-12 event_content">
                        <ul>
                            <li class="book_title">
                                <div class="col-12 col-sm-5" style="display:inline-block; vertical-align:top;">
                                    <img src="/img/Event_book/event_book.jpeg" width="auto;" height="300px;"
                                         alt="event_book1"/>
                                </div>
                                <div class="col-12 col-sm-7">
                                    <p style="font-size: 20px; line-height: 26px; text-align: left;"><b
                                            style="font-size: 20px; line-height: 26px;">책 제목</b> : 꽃말의 틴생 : 서양 문화로 읽는 매혹적인 꽃 이야기 </p>
                                    <p style="font-size: 20px; line-height: 26px; text-align: left;"><b
                                            style="font-size: 20px; line-height: 26px;">저자/출판사</b> :샐리 쿨타드 저/박민정 역 | 동양북스(동양books)</p>
                                </div>
                            </li>
                        </ul>

                        <p style="border: 1px solid #dcc5df; margin-bottom: 30px;"></p>

                              <div class="w3-responsive">
                                <table class="w3-table-all">
                                    <tr>
                                        <th>번호</th>
                                        <th>책 제목</th>
                                        <th>작성일</th>
                                        <th>작성자</th>
                                        <th>조회수</th>
                                    </tr>
                                    <tr>
                                        <td>16</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.20</td>
                                        <td>강생이</td>
                                        <td>39</td>
                                    </tr>
                                    <tr>
                                        <td>15</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.15</td>
                                        <td>째짜니</td>
                                        <td>42</td>
                                    </tr>
                                    <tr>
                                        <td>14</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.14</td>
                                        <td>녕서</td>
                                        <td>23</td>
                                    </tr>
                                    <tr>
                                        <td>13</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.11</td>
                                        <td>쥬냥이</td>
                                        <td>15</td>
                                    </tr>
                                    <tr>
                                        <td>12</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.11</td>
                                        <td>빵훈</td>
                                        <td>88</td>
                                    </tr>
                                    <tr>
                                        <td>11</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.08</td>
                                        <td>짝재</td>
                                        <td>13</td>
                                    </tr>
                                    <tr>
                                        <td>10</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.08</td>
                                        <td>상그이</td>
                                        <td>14</td>
                                    </tr>
                                    <tr>
                                        <td>9</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.08</td>
                                        <td>서누</td>
                                        <td>41</td>
                                    </tr>
                                    <tr>
                                        <td>8</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.05</td>
                                        <td>지창큐</td>
                                        <td>15</td>
                                    </tr>
                                    <tr>
                                        <td>7</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.05</td>
                                        <td>불량콥</td>
                                        <td>53</td>
                                    </tr>
                                    <tr>
                                        <td>6</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.05</td>
                                        <td>김너네나잘해라</td>
                                        <td>21</td>
                                    </tr>
                                    <tr>
                                        <td>5</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.04</td>
                                        <td>밸런타인 보이</td>
                                        <td>14</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.02</td>
                                        <td>제우스</td>
                                        <td>19</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.01</td>
                                        <td>김대성</td>
                                        <td>50</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.01</td>
                                        <td>애옹이</td>
                                        <td>82</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>꽃말의 탄생 : 서양 문화로 읽는 매혹적인 꽃 이야기</td>
                                        <td>2022.11.01</td>
                                        <td>풀썬</td>
                                        <td>66</td>
                                    </tr>

                                </table>
                            </div>

                            <br>

                            <div class="w3-center">
                                <ul class="w3-pagination">
                                    <li><a href="#">&laquo;</a></li>
                                    <li><a class="w3-pale-red" href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </div>


<%--                        <div class="content-table">--%>
<%--                            <table class="table table-hover table-bordered">--%>
<%--                                <thead>--%>
<%--                                <tr>--%>
<%--                                    <th style="width: 10%;">No.</th>--%>
<%--                                    <th style="width: 10%;">작성자</th>--%>
<%--                                    <th style="width: auto;">제목</th>--%>
<%--                                    <th style="width: 10%;">댓글수</th>--%>
<%--                                </tr>--%>
<%--                                </thead>--%>
<%--                                <tbody id="event-table"></tbody>--%>
<%--                            </table>--%>
<%--                            <ul class="pagination">--%>
<%--                                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>--%>
<%--                                <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                                <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                                <li class="page-item active"><a class="page-link" href="#">3</a></li>--%>
<%--                                <li class="page-item"><a class="page-link" href="#">4</a>--%>
<%--                                <li class="page-item"><a class="page-link" href="#">5</a></li>--%>
<%--                                <li class="page-item"><a class="page-link" href="#">Next</a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../fixed/footer.jsp"></jsp:include>

</body>
</html>