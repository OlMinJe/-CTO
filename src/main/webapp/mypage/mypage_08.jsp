<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.helloproject.vo.MemberVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    pageEncoding="UTF-8"%>
<%@ page import="com.project.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원 탈퇴</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/header.css"> <!-- 헤더 -->
    <link rel="stylesheet" type="text/css" href="/css/fixed/footer.css"> <!--푸터-->
    <link rel="stylesheet" type="text/css" href="/css/mypage/mypage.css">
    <script type="text/javascript" src="/js/includeHtml.js"></script>
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
                    url: "/memberDelete",
                    dataType: "text",
                    contentType: "application/json; charset=UTF-8",
                    success: function (data) {
                        if (data == "success") {
                            alert("탈퇴가 처리되었습니다.");
                            location.href = "/main";
                        } else {
                            alert("비밀번호가 맞지 않습니다.");
                        }
                    },
                    error: function (request, status, error) {
                        alert("code:" + request.status + "\n" +
                            "message:" + request.responseText + "\n" + "error:" + error);
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
<h2>[회원탈퇴]</h2>
<form action='<c:url value='/register'/>' method="post">
    <div>아이디<input type="text" name="mb_id" id="mb_id" value="${modifyId}" readonly="readonly"></div>
    <div>비밀번호<input type="password" name="pw" id="pw"></div>
</form>
<button type="button" onclick="deleteMember()">회원탈퇴</button>
<button type="button" onclick="location.href='/boardList?stateCode=${stateCode}'">처음으로</button>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>