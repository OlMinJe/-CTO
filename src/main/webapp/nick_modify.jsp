<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.helloproject.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
<script>
    /* ajax를 통한 닉네임 수정처리 */
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
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
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
</script>
</head>
<body>
<h1>닉네임 변경 페이지입니다.</h1>
<form action='<c:url value='/register'/>' method="post">
    <div style="display: none;">아이디<input type="text" name="mb_id" id="mb_id" value="${modifyId}" readonly="readonly"></div>
    <div>현재 닉네임<input type="text" name="mb_nick" id="mb_nick" value="${modifyNick}" readonly="readonly"></div>
    <div>닉네임<input type="text" name="nick" id="nick">
        <button type="button" onclick="nickCheck()">닉네임 중복확인</button></div>
</form>
<button type="button" onclick="updateNick()">닉네임 변경</button>
<button type="button" onclick="location.href='/boardList?stateCode=${stateCode}'">처음으로</button>

</body>
</html>