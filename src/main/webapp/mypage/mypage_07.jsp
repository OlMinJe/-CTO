<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.helloproject.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>프로필 사진 변경</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/header.css"> <!-- 헤더 -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/footer.css"> <!--푸터-->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
    <script type="text/javascript" src="/js/mypage.js"></script>
    <!--    사진 띄우는거 (참고 사이트) https://velog.io/@minkyeong-ko/HTMLCSSJS-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%97%85%EB%A1%9C%EB%93%9C-%ED%8C%8C%EC%9D%BC%EC%9D%B4%EB%A6%84-%EB%82%98%ED%83%80%EB%82%B4%EA%B8%B0-%ED%99%94%EB%A9%B4%EC%97%90-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EB%B3%B4%EC%97%AC%EC%A3%BC%EA%B8%B0-->
    <script type="text/javascript">

        function guid() {
            function s4() {
                return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
            }

            return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
        }

        function updateImg() {

            //input file 태그.
            var file = document.getElementById('mb_img');
            //파일 경로.
            var filePath = file.value;
            //전체경로를 \ 나눔.
            var filePathSplit = filePath.split('\\');
            //전체경로를 \로 나눈 길이.
            var filePathLength = filePathSplit.length;
            //마지막 경로를 .으로 나눔.
            var fileNameSplit = filePathSplit[filePathLength - 1].split('.');
            //파일명 : .으로 나눈 앞부분
            var fileName = fileNameSplit[0];
            //파일 확장자 : .으로 나눈 뒷부분
            var fileExt = fileNameSplit[1];

            var mb_id = $("#mb_id").val();
            var mb_img = guid() + "_" + fileName + "." + fileExt;

            var param = {"mb_id": mb_id, "mb_img": mb_img}
            var stateCode = '?stateCode=1';

            if (mb_img == '') {
                alert("새 프로필 사진을 선택 해주세요.");
            } else {
                $.ajax({
                    async: true,
                    type: 'POST',
                    data: JSON.stringify(param),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    url: "/profile_modify",
                    dataType: "text",
                    contentType: "application/json; charset=UTF-8",
                    success: function () {
                        alert("프로필 변경이 완료되었습니다.");
                        location.href = "/boardList" + stateCode;
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("ERROR : " + textStatus + " : " + errorThrown);
                    }
                })
            }
        }
    </script>
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
                <div class="col-12 col-lg-12 menu_list" id="menu_list_02">
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

        <div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_7_content">
                <div class="col-12" id="sub_title">프로필 사진 변경</div>
                <div class="col-12 col-md-10 col-lg-8 image_upload" style="text-align: center;padding-top: 70px;">
                    <form action=/register' method="post" enctype="multipart/form-data">
                        <ul>
                            <li>
                                <span class="col-12 col-md-3">아이디</span>
                                <input type="text" name="memberId" id="mb_id" class="box_eft_01" th:value="${modifyId}"
                                       readonly="readonly">
                            </li>
                            <li>
                                <span class="col-12 col-md-3">기존 프로필 사진</span>
                                <input type="type" name="modifyImg" id="modifyImg" class="box_eft_01" th:value="${modifyImg}"
                                       readonly="readonly" size="50"/>
                            </li>
                            <li>
                                <span class="col-12 col-md-3">프로필 사진 선택</span>
                                <input type="file" name="file" id="mb_img" class="box_eft_01" style="display: none;">
                                <label for="mb_img" class="col-12 col-md-7 box_eft_01">프로필 사진 선택하기</label>
                            </li>
                        </ul>
                    </form>
                    <button type="button" class="box_eft_02" id="submit" onclick="updateImg()">변경하기</button>
                    <button type="button" class="box_eft_02" onclick="location.href='/'">처음으로</button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>