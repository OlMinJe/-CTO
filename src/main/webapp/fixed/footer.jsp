<!-- #00695C -->
<!-- TODO: 링크 연결 onclick 이벤트로 바꾸기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/fixed/footer.css">
<footer>
    <div class="col-12 footer">
        <div class="col-12 footer_top">
            <div class="col-12 footer_con">
                <div class="col-12 col-lg-3 footer_left">
                    <div class="col-12 title">#CTO</div>
                    <ul class="col-12">
                        <li class="col-12">서울특별시 종로구 필운대로 1길 34 스마트IT과</li>
                        <li class="col-12">전화번호: 02.000.0000</li>
                        <li class="col-12">전화번호: 02.000.0000</li>
                    </ul>
                    <div class="col-12 call">
                        <span>고객센터</span><br><span>02-000-0000</span>
                    </div>
                </div>
                <div class="col-12 col-lg-8 footer_right">
                    <ul class="col-2 community">
                        <li>커뮤니티</li>
                        <li>일상</li>
                        <li>취미</li>
                        <li>유머</li>
                        <li>음식</li>
                        <li>정보</li>
                        <li>취업/진로</li>
                        <li>기타</li>
                        <li>에디터 칼럼</li>
                    </ul>
                    <ul class="col-2 advice">
                        <li>일반고민</li>
                        <li>대인관계/가족</li>
                        <li>정신건강</li>
                        <li>직장</li>
                        <li>성소수자</li>
                        <li>성추행</li>
                        <li>출산/육아</li>
                        <li>섭식장애</li>
                        <li>외모 강박증</li>
                    </ul>
                    <ul class="col-2 location">
                        <li>위치기반</li>
                    </ul>
                    <ul class="col-2 ent">
                        <li>엔터테인먼트</li>
                    </ul>
                    <ul class="col-2 evnet">
                        <li>이벤트</li>
                        <li>삼행시</li>
                        <li>독서감상대회</li>
                        <li>독서퀴즈대회</li>
                    </ul>
                    <ul class="col-2 report">
                        <li>신고</li>
                        <li>유저신고</li>
                        <li>댓글/게시판신고</li>
                        <li>페이지오류신고</li>
                        <li>저작권/명예회손</li>
                        <li>기타</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-12 footer_bottom">
            <div class="col-12 footer_con">
                <ul class="col-6 popup">
                    <li>
                        <button type="button" onclick="onClickEvent01();">개인정보처리방침</button>
                    </li>
                    <li>
                        <button type="button" onclick="onClickEvent02();">이용약관</button>
                    </li>
                    <li>
                        <button type="button" onclick="location.href='/notice/notice.html'">공지사항</button>
                    </li>
                </ul>
                <ul class="col-0 sns">
                    <li class="home"><a href="/"></a></li>
                    <li class="kakao"><a href="/"></a></li>
                    <li class="insta"><a href="/"></a></li>
                </ul>
            </div>
        </div>
        <!-- popup content -->
        <div class="modal_wrap" id="modal01">
            <div class="modal_close"><a href="#" onclick="offClickEvent();">close</a></div>
            <div class="popup_content">
                <div class="col-12 title">개인정보처리방침</div>
                <div class="col-12 contents">내용</div>
            </div>
        </div>
        <div class="modal_wrap" id="modal02">
            <div class="modal_close"><a href="#" onclick="offClickEvent();">close</a></div>
            <div class="popup_content">
                <div class="col-12 title">ㅇㅣ용약관</div>
                <div class="col-12 contents">내용</div>
            </div>
        </div>
    </div>
</footer>