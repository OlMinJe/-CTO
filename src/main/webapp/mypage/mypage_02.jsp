<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 이용내역</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
    <script type="text/javascript" src="/js/mypage.js"></script>
    <script type="text/javascript" src="/js/mypage_02.js"></script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 mypage">
    <div class="col-12 title" style="float: left">
        <a class="col-12" id="tab_0" onclick="location.href='/mypage/mypage.jsp'">내정보</a>
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
            <div class="col-12 content_box" id="tab_2_content">
                <!------------------------------------------>
                <div class="col-12" id="sub_title">커뮤니티 이용내역</div>
                <div class="col-12 filter_wrap">
                    <div class="col-12 filter_con">
                        <div class="col-12 community_date_box">
                            <div class="filter_sub_title">기간 선택</div>
                            <ul>
                                <li><input type="date" id="startDate" name="startDate" min="2022-01-01"
                                           max="2022-12-31"></li>
                                <li><span>~</span><input type="date" id="endDate" name="startDate" min="2022-01-01"
                                                         max="2022-12-31"></li>
                            </ul>
                        </div>
                        <div class="col-12 community_category_box">
                            <div class="filter_sub_title">카테고리</div>
                            <div class="col-0" style="display: flex; flex-direction: column;">
                                <ul>
                                    <li><input type="checkbox" value="0" class="filter_all" checked><label
                                            class="filter01 all">전체</label></li>
                                    <li><input type="checkbox" value="1" class="filter_normal" checked><label
                                            class="filter01 normal">일반</label></li>
                                    <li><input type="checkbox" value="2" class="filter_editor" checked><label
                                            class="filter01">에디터</label></li>
                                </ul>
                                <ul class="col-0 inner_normal"></ul>
                            </div>
                        </div>
                        <div class="community_comment_box">
                            <div class="filter_sub_title">댓글 작성</div>
                            <ul class="filter_list">
                                <li><input type="checkbox" checked><label class="filter02 All">전체</label></li>
                                <li><input type="checkbox" checked><label class="filter02">Y</label></li>
                                <li><input type="checkbox" checked><label class="filter02">N</label></li>
                            </ul>
                        </div>
                        <div class="community_writer_box">
                            <div class="filter_sub_title">글 작성</div>
                            <ul class="filter_list">
                                <li><input type="checkbox" checked><label class="filter03 All">전체</label></li>
                                <li><input type="checkbox" checked><label class="filter03">Y</label></li>
                                <li><input type="checkbox" checked><label class="filter03">N</label></li>
                            </ul>
                        </div>
                        <div class="col-12 btn" style="text-align: right;">
                            <p><input type="submit" class="btn-style" value="검색">
                                <button type="button" class="resetBtn btn-style" onclick="resetBtn()">초기화</button>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-12 community_table" id="sub_table">
                    <table class="table table-hover table-bordered">
                        <thead>
                        <tr>
                            <th style="width: 10%;">No.</th>
                            <th style="width: 10%;">카테고리</th>
                            <th style="width: auto;">제목</th>
                            <th style="width: 10%;">댓글수</th>
                            <th style="width: 10%;">글작성</th>
                            <th style="width: 10%;">댓글참여</th>
                        </tr>
                        </thead>
                        <tbody id="community_table">
                        </tbody>
                    </table>
                </div>
                <!------------------------------------------>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>

</body>
</html>