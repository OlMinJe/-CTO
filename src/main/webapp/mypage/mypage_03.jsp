<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>위치기반 사용내역</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/header.css"> <!-- 헤더 -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/footer.css"> <!--푸터-->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
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
                    <li class="col-12" onclick="location.href='/mypage/mypage_01.jsp'">이벤트 참여내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_02.jsp'">커뮤니티 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_03.jsp'">위치기반 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_04.jsp'">테스트 결과 내역</li>
                </ul>
                <div class="col-12 col-lg-0 menu_list" id="menu_list_02">
                    <div class="menu_title mt">정보변경</div>
                    <ul>
                        <li class="col-12" onclick="location.href='/mypage/mypage_05.jsp'">비밀번호 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_06.jsp'">닉네임 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_07.jsp'">프로필 사진 변경</li>
                        <li class="col-12" onclick="location.href='/mypage/mypage_08.jsp'">회원탈퇴</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 오른쪽 컨텐츠-->
        <div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_3_content">
                <!------------------------------------------>
                <div class="col-12" id="sub_title">위치기반 사용내역</div>
                <div class="col-12 location_table" id="sub_table">
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 10%;">No.</th>
                            <th style="width: 20%;">선택한 카테고리</th>
                            <th style="width: auto;">선택한 장소</th>
                        </tr>
                        </thead>
                        <tbody id="location_table">
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
        mypage_03();
    });

    function mypage_03() {
        var e = document.getElementById('location_table');

        for (var i = 0; i < 1; i++) { /* 저장된 seq의 값만큼 돌아가도록 변경하기*/
            e.innerHTML += '<tr>' +
                '<td class="diplay_no">' + (i + 1) + '</td>' +
                '<td class="select_01">' + '공연' + '</td>' +
                '<td class="select_02"><a href="https://weblin.tistory.com/5">' + '고척스카이돔' + '</a></td>' +
                '</tr>';
            /* document.querySelector('.location_table .diplay_no').innerHTML = '<span>' + (i+1) + '</span>';
             document.querySelector('.location_table .select_01').innerHTML = '<span>' + '공연' + '</span>';
             document.querySelector('.location_table .select_02').innerHTML = '<a href="https://weblin.tistory.com/5">' + '고척스카이돔' + '</a>';*/
        }
    }
</script>
</body>
</html>