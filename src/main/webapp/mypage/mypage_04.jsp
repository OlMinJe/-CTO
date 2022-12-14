<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>테스트 참여내역</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/mypage.js"></script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 mypage">
    <div class="col-12 title" style="float: left">
        <a class="col-12" id="tab_0" name="menu_tab" onclick="location.href='/mypage/mypage.jsp'">내정보</a>
    </div>
    <div class="col-12 mypage_con">
        <!--왼쪽 메뉴 -->
        <div class="col-12 col-lg-3 mypage_menu">
            <div class="col-0 menu_list mt">
                <div class="col-12 menu_title" onclick="mobile_menu();">활동내역</div>
                <ul class="col-12" id="menu_list_01">
                    <li class="col-12" onclick="location.href='/mypage/mypage_01.jsp?stateCode=${stateCode}'">이벤트 참여내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_02.jsp?stateCode=${stateCode}'">커뮤니티 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_03.jsp?stateCode=${stateCode}'">위치기반 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_04.jsp?stateCode=${stateCode}'">테스트 결과 내역</li>
                </ul>
                <div class="col-12 col-lg-0 menu_list" id="menu_list_02">
                    <div class="menu_title mt">정보변경</div>
                    <ul>
                        <li class="col-12" onclick="location.href='/mypage/mypage_05?stateCode=${stateCode}'">비밀번호 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_06?stateCode=${stateCode}'">닉네임 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_07?stateCode=${stateCode}'">프로필 사진 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_08?stateCode=${stateCode}'">회원탈퇴</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 오른쪽 컨텐츠-->
        <div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_4_content">
                <!------------------------------------------>
                <div class="col-12" id="sub_title">테스트 참여내역</div>
                <div class="col-12 webTest_table" id="sub_table">
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 10%;">No.</th>
                            <th style="width: auto;">참여 테스트</th>
                            <th style="width: 20%;">테스트 바로가기</th>
                        </tr>
                        </thead>
                        <tbody id="webTest_table">
                        </tbody>
                    </table>
                </div>
                <!------------------------------------------>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        mypage_04();
    });

    function mypage_04() {
        var e = document.getElementById('webTest_table');

        for (var i = 0; i < 1; i++) { /* 저장된 seq의 값만큼 돌아가도록 변경하기*/
            e.innerHTML += '<tr>' +
                '<td class="diplay_no"><span>' + (i + 1) + '</span></td>' +
                '<td class="webTest"><span>' + '안녕 자두야 MBTI' + '</span></td>' +
                '<td class="webTest_result"><a href="/Entertainment/Enter_mbti_jadoo.jsp" >' + '바로가기' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no"><span>' + (i + 2) + '</span></td>' +
                '<td class="webTest"><span>' + '여행지 테스트' + '</span></td>' +
                '<td class="webTest_result"><a href="/Entertainment/Enter_trip_test.jsp" >' + '바로가기' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no"><span>' + (i + 3) + '</span></td>' +
                '<td class="webTest"><span>' + '반려견 테스트' + '</span></td>' +
                '<td class="webTest_result"><a href="/Entertainment/Enter_animal_test.jsp" >' + '바로가기' + '</a></td>' +
                '</tr>';
            e.innerHTML += '<tr>' +
                '<td class="diplay_no"><span>' + (i + 4) + '</span></td>' +
                '<td class="webTest"><span>' + '해리포터 속으로 들어간다면?' + '</span></td>' +
                '<td class="webTest_result"><a href="/Entertainment/Enter_test_potter.jsp" >' + '바로가기' + '</a></td>' +
                '</tr>';
            /*document.querySelector('.webTest_table .diplay_no').innerHTML = '<span>' + (i+1) + '</span>';
            document.querySelector('.webTest_table .webTest').innerHTML = '<span>' + '테스트 이름' + '</span>';
            document.querySelector('.webTest_table .webTest_result').innerHTML = '<a href="https://m.blog.naver.com/dasol825/220672901113" >' + '결과(클릭하면 상세)' + '</a>';*/
        }
    }
</script>
</body>
</html>