<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/mypage.js"></script>

    <script type="text/javascript">
        /* ajax를 통한 비밀번호 수정처리 */
        function pw_modify() { //3333

            var mb_id = $("#mb_id").val();
            var mb_pw = $("#mb_pw").val();
            var new_pw = $("#pw_check").val();

            var param = {"mb_id":mb_id, "mb_pw":mb_pw}
            var stateCode = '?stateCode=1';

            if(mb_pw != new_pw) {
                alert("새 비밀번호가 일치하지 않습니다. 다시 한 번 확인해주세요.")
            } else {
                if(mb_pw == '') {
                    alert("새 비밀번호를 올바르게 입력해주세요.");
                } else {
                    $.ajax({
                        async:true,
                        type:'POST',
                        data: JSON.stringify(param),
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                        },
                        url:"/mypage/mypage_05",
                        dataType: "text",
                        contentType: "application/json; charset=UTF-8",
                        success : function() {
                            alert("비밀번호 변경이 완료되었습니다.");
                            location.href="/"+stateCode;
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            alert("ERROR : " + textStatus + " : " + errorThrown);
                        }
                    })
                }
            }
        }

        function or_pw_check(){

            var modifyPw = $("#modifyPw").val();
            var pw = $("#pw").val();

            if(pw.trim() != '') {

                var mb_id = $("#mb_id").val();
                var param = {"mb_id":mb_id, "mb_pw":pw}

                $.ajax({
                    async: true,
                    type: 'POST',
                    data: JSON.stringify(param),
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    url: "/pw_check",
                    dataType: "text",
                    contentType: "application/json; charset=UTF-8",
                    success: function(data) {
                        if(data == "success") {
                            alert("기존 비밀번호와 일치합니다.");
                        } else {
                            alert("기존 비밀번호와 일치하지 않습니다.");
                        }
                    },
                    error:function(request, status, error){
                        alert("code:"+request.status+"\n"+
                            "message:"+request.responseText+"\n"+"error:"+error);
                    }
                })
            } else {
                alert("비밀번호를 제대로 입력해주세요.");
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
                    <li class="col-12" onclick="location.href='/mypage/mypage_01?stateCode=${stateCode}'">이벤트 참여내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_02?stateCode=${stateCode}'">커뮤니티 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_03?stateCode=${stateCode}'">위치기반 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_06?stateCode=${stateCode}'">테스트 결과 내역</li>
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
        <!--<div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_5_content">
                <div class="col-12" id="sub_title">비밀번호 변경</div>
                <div class="col-12" style="text-align: center;">
                    <form action='/register' method="post" class="col-11 col-sm-8 col-md-6">
                        <input type="text" class="box_eft_01" id="mb_id" name="mb_id" placeholder="아이디를 입력해주세요.">
                        <input type="password" class="box_eft_01" id="mb_pw" name="mb_pw" placeholder="비밀번호를 입력해주세요.">
                        <div class="col-12" style="margin-bottom: 20px;">
                            <div class="col-7 user_id_pass">
                                <input type="button" title="아이디 찾기" id="find_id_btn" value="아이디 찾기"
                                       onclick="location.href='/login/find_id_form.html'">
                                <input type="button" title="비밀번호 찾기" id="find_pw_btn" value="비밀번호 찾기"
                                       onclick="location.href='/login/find_pw_form.html'">
                            </div>
                            <div class="col-5 new_user">
                                <input type="button" value="회원가입" onclick="location.href='/login/register.html'">
                            </div>
                        </div>
                        <input type="submit" value="로그인" class="btn box_eft_02">
                    </form>
                </div>
                &lt;!&ndash;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&#45;&ndash;&gt;
            </div>
        </div>-->

        <div class="col-12 col-lg-9 content">
            <div class="col-12 content_box" id="tab_5_content">
                <div class="col-12" id="sub_title">비밀번호 변경</div>
                <div class="col-12" style="text-align: center; padding-top: 40px;">
                    <form action='<c:url value='/login/register'/>' method="post" class="col-12 col-md-10 col-lg-8">
                        <ul>
                            <li>
                                <span class="col-12 col-md-4">아이디</span>
                                <input type="text" name="memberId" class="col-12 col-md-8 box_eft_01" id="mb_id" value="${modifyId}" readonly="readonly">

                            </li>
                            <li>
                                <input type="hidden" name="modifyPw" id="modifyPw" value="${modifyPw}"/>
                                <span class="col-12 col-md-4">기존 비밀번호를 입력해주세요.</span>
                                <div class="col-12 col-md-8">
                                    <input type="password" name="pw" id="pw" class="col-11 box_eft_01" placeholder="기존 비밀번호 입력">
                                    <button type="button" class="col-2 btn box_eft_02" onclick="or_pw_check()">확인</button>
                                </div>
                            </li>
                            <li>
                                <span class="col-12 col-md-4">새 비밀번호를 입력해주세요.</span>
                                <input type="password" name="mb_pw" id="mb_pw" class="col-12 col-md-8 box_eft_01" placeholder="새 비밀번호">
                            </li>
                            <li>
                                <span class="col-12 col-md-4">다시 한 번 입력해 주세요.</span>
                                <input type="password" name="pw_check" id="pw_check" class="col-12 col-md-8 box_eft_01" placeholder="새 비밀번호 재입력">
                            </li>
                        </ul>
                    </form>
                    <button type="button" class="btn box_eft_02" id="submit" onclick="pw_modify()">변경하기</button>
                    <button type="button" class="btn box_eft_02" onclick="location.href='/main?stateCode=${stateCode}'">처음으로</button>
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>