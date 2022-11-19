<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/mypage.js"></script>
    <script>
        /* ajax를 통한 탈퇴처리 */
        function deleteMember() {

            var pw = $("#pw").val();

            if (pw.trim() != '') {

                var mb_id = $("#mb_id").val();
                var param = {"mb_id": mb_id, "mb_pw": pw}

                $.ajax({
                    async: true,
                    type: 'POST',
                    data: JSON.stringify(param),
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    url: "/mypage/mypage_08",
                    dataType: "text",
                    contentType: "application/json; charset=UTF-8",
                    success: function (data) {
                        if (data == "success") {
                            alert("탈퇴가 처리되었습니다.");
                            location.href = "/main?stateCode=${stateCode}";
                        } else {
                            alert("비밀번호가 맞지 않습니다.");
                        }
                    },
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" +
                            "message:" + request.responseText + "\n" + "error:" + error);
                    }
                })
                //location.href='/mypage/mypage_08_1';
            } else {
                alert("비밀번호를 입력해주세요.");
            }
        }

        function done() {
            alert("설문에 응해주셔서 감사합니다.");
            return true;
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<%--
<h2>[회원탈퇴]</h2>
<form action='<c:url value='/register'/>' method="post">
    <div>아이디<input type="text" name="mb_id" id="mb_id" value="${modifyId}" readonly="readonly"></div>
    <div>비밀번호<input type="password" name="pw" id="pw"></div>
</form>
<button type="button" onclick="deleteMember()">회원탈퇴</button>
<button type="button" onclick="location.href='/boardList?stateCode=${stateCode}'">처음으로</button>
--%>
<div class="col-12 mypage">
    <div class="col-12 title" style="float: left">
        <a class="col-12" id="tab_0" name="menu_tab" onclick="location.href='/mypage/mypage.jsp'">내정보</a>
    </div>
    <div class="col-12 mypage_con">
        <!--왼쪽 메뉴 -->
        <div class="col-12 col-lg-3 mypage_menu">
            <div class="col-0 menu_list mt">
                <div class="col-12 menu_title">활동내역</div>
                <ul class="col-12" id="menu_list_01">
                    <li class="col-12" onclick="location.href='/mypage/mypage_01.jsp?stateCode=${stateCode}'">이벤트 참여내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_02.jsp?stateCode=${stateCode}'">커뮤니티 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_03.jsp?stateCode=${stateCode}'">위치기반 사용내역</li>
                    <li class="col-12" onclick="location.href='/mypage/mypage_04.jsp?stateCode=${stateCode}'">테스트 결과 내역</li>
                </ul>
                <div class="col-12 col-lg-12 menu_list" id="menu_list_02">
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

<!-- mypage_08.jsp와 mypage_08_01.jsp 합치기 -->
        <div class="col-12 col-lg-9">
            <div class="col-12 no_user">
                <div class="col-10 no_user_title">&lt;서비스 사용 인식 정보 수집용 설문조사 &gt;<br>
                    <span class="col-12 col-md-3">이 설문조사의 결과는 더 나은 서비스 '너나들이'를 제공하기 위한 목적으로 사용될 예정입니다.</span>
                </div>

                <form class="col-10">
                    <ul>
                        <li>- '너나들이'에서 회원탈퇴하는 이유는 무엇입니까?</li>
                        <li><input type="checkbox" checked>특별한 이유 없음</li>
                        <li><input type="checkbox">사이트에 대한 불만</li>
                        <li><input type="checkbox">제공하는 서비스 부족</li>
                        <li><input type="checkbox">제공하는 컨텐츠 부족</li>
                        <li><input type="checkbox">타 서비스 이용을 위해서</li>
                        <li class="flex__"><span>기타</span><input type="text" checked></li>
                        <li class="float__"><button type="button" class="no_user_btn box_eft_02" onclick="done()">설문 완료</button></li>
                    </ul>
                </form>
            </div>
            <div class="col-12 col-lg-9 content">
                <div class="col-12 content_box" id="tab_8_content">
                    <div class="col-12" id="sub_title">회원 탈퇴 진행창</div>
                    <span class="col-12 col-md-3">가입 당시 작성한 비밀번호를 정확하게 입력해주세요.</span>
                    <div class="col-12 col-md-8 col-lg-6" style="text-align: center;margin-left: auto; margin-right: auto;padding-top: 70px;">
                        <form action='<c:url value='/login/register'/>' method="post">
                            <ul>
                                <li>
                                    <span class="col-12 col-md-3">아이디</span>
                                    <input type="text" name="mb_id" id="mb_id" class="box_eft_01" value="${modifyId}" readonly="readonly">
                                </li>
                                <li>
                                    <span class="col-12 col-md-3">비밀번호</span>
                                    <input type="password" name="pw" id="pw" class="box_eft_01">
                                </li>
                            </ul>
                        </form>
                        <button type="button" class="box_eft_02" onclick="deleteMember()">회원탈퇴</button>
                        <button type="button" class="box_eft_02" onclick="location.href='/main?stateCode=${stateCode}'">처음으로</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>