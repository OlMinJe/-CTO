<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>닉네임 변경</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/mypage.js"></script>

    <%--<script type="text/javascript">
        function updateNick() {

            var mb_id = $("#mb_id").val();
            var nick = $("#nick").val();

            var param = {"mb_id":mb_id, "mb_nick":nick}
            var stateCode = '?stateCode=1';

            if(nick == '') {
                alert("새 닉네임을 올바르게 입력해주세요.");
            } else {
                $.ajax({
                    async:true,
                    type:'POST',
                    data: JSON.stringify(param),

                    url:"/nick_modify",
                    dataType: "text",
                    contentType: "application/json; charset=UTF-8",
                    success : function() {
                        alert("닉네임 변경이 완료되었습니다.");
                        location.href="/boardList"+stateCode;
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert("ERROR : " + textStatus + " : " + errorThrown);
                    }
                })
            }

        }

        /* 닉네임 중복 체크 : ajax 비동기처리 */
        function nickCheck() {

            var mb_nick = $("#nick").val();

            if(mb_nick.search(/\s/) != -1) {
                alert("닉네임에는 공백이 들어갈 수 없습니다.");
            } else {
                if(mb_nick.trim().length != 0) {
                    console.log(mb_nick.trim().length);
                    $.ajax({
                        async : true,
                        type : 'POST',
                        data: mb_nick,

                        url: "/nickCheck",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        success: function(count) {
                            if(count > 0) {
                                alert("해당 닉네임 존재");
                                window.location.reload();
                            } else {
                                alert("사용가능 닉네임");

                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(errorThrown + " " + textStatus);
                            alert("닉네임을 입력해주세요.");
                        }
                    });
                } else {
                    alert("닉네임을 입력해주세요.");
                }
            }
        }
    </script>--%>
    <script>
        function updateNick() {

            var mb_id = $("#mb_id").val();
            var nick = $("#nick").val();

            var param = {"mb_id":mb_id, "mb_nick":nick}
            var stateCode = '?stateCode=1';

            if(nick == '') {
                alert("새 닉네임을 올바르게 입력해주세요.");
            } else {
                $.ajax({
                    async:true,
                    type:'POST',
                    data: JSON.stringify(param),
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    url:"/mypage/mypage_06",
                    dataType: "text",
                    contentType: "application/json; charset=UTF-8",
                    success : function() {
                        alert("닉네임 변경이 완료되었습니다.");
                        location.href="/"+stateCode;
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        alert("ERROR : " + textStatus + " : " + errorThrown);
                    }
                })
            }

        }

        /* 닉네임 중복 체크 : ajax 비동기처리 */
        function nickCheck() {

            var mb_nick = $("#nick").val();

            if(mb_nick.search(/\s/) != -1) {
                alert("닉네임에는 공백이 들어갈 수 없습니다.");
            } else {
                if(mb_nick.trim().length != 0) {
                    console.log(mb_nick.trim().length);
                    $.ajax({
                        async : true,
                        type : 'POST',
                        data: mb_nick,
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                        },
                        url: "/nickCheck",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        success: function(count) {
                            if(count > 0) {
                                alert("해당 닉네임은 이미 존재합니다.");
                                window.location.reload();
                            } else {
                                alert("사용가능한 닉네임입니다.");

                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log(errorThrown + " " + textStatus);
                            alert("닉네임을 입력해주세요.");
                        }
                    });
                } else {
                    alert("닉네임을 입력해주세요.");
                }
            }
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 mypage">
    <div class="col-12 title" style="float: left">
        <a class="col-12" id="tab_0" name="menu_tab" onclick="location.href='/mypage/mypage?stateCode=${stateCode}'">내정보</a>
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

        <div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_6_content">
                <div class="col-12" id="sub_title">닉네임 변경</div>
                <div class="col-12 col-md-10 col-lg-8" style="text-align: center;  margin-left: auto; margin-right: auto;padding-top: 70px;">
                    <form action='<c:url value='/login/register'/>' method="post" style="margin-bottom: 30px;">
                        <ul>
                            <li style="display: none;">
                                <span class="col-12 col-md-3">아이디</span>
                                <input type="text" name="mb_id" id="mb_id" class="box_eft_01" value="${modifyId}" readonly="readonly">
                                <%--<input type="text" name="mb_id" id="mb_id" value="${modifyId}" readonly="readonly">--%>
                            </li>
                            <li>
                                <span class="col-12 col-md-3">기존 닉네임</span>
                                <input type="text" name="mb_nick" id="mb_nick" class="box_eft_01" value="${modifyNick}" readonly="readonly">
                                <%--<input type="text" name="mb_nick" id="mb_nick" value="${modifyNick}" readonly="readonly">--%>
                            </li>
                            <li>
                                <span class="col-12 col-md-3">새 닉네임</span>
                                <div class="col-12 col-me-9" style="text-align: left;">
                                    <input type="text" name="nick" id="nick" class="col-9 box_eft_01">
                                    <button type="button" class="col-3 box_eft_02" onclick="nickCheck()">중복확인</button>
                                </div>
                            </li>
                        </ul>
                    </form>
                    <button type="button" id="submit" class="box_eft_02" onclick="updateNick()">변경하기</button>
                    <button type="button" class="box_eft_02" onclick="location.href='/main?stateCode=${stateCode}'">처음으로</button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>
