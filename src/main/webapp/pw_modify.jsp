<%@ page import="com.helloproject.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html>
<head>
<script type="text/javascript">

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
					alert("기존 비밀번호가 일치합니다.");
				} else {
					alert("기존 비밀번호가 맞지 않습니다.");
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

/* ajax를 통한 비밀번호 수정처리 */
function modifyMember() {

	var mb_id = $("#mb_id").val();
	var mb_pw = $("#mb_pw").val();
	var new_pw = $("#pw_check").val();

	var param = {"mb_id":mb_id, "mb_pw":mb_pw}
	var stateCode = '?stateCode=1';

	if(mb_pw != new_pw){
		alert("새비밀번호가 일치하지 않습니다. 다시 한번 확인하세요")
	}else{
		if(mb_pw == '') {
			alert("새비밀번호를 올바르게 입력해주세요.");
		} else {
			$.ajax({
				async:true,
				type:'POST',
				data: JSON.stringify(param),
				beforeSend: function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				url:"/pw_modify",
				dataType: "text",
				contentType: "application/json; charset=UTF-8",
				success : function() {
					alert("비밀번호 변경이 완료되었습니다.");
					location.href="/boardList"+stateCode;
				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert("ERROR : " + textStatus + " : " + errorThrown);
				}
			})
		}
	}

	
}

</script>
</head>
<body>
<h2>[회원정보 수정]</h2>
<form action='<c:url value='/register'/>' method="post">
	<div>이름<input type="text" name="memberName" id="mb_name" value="${modifyName}" readonly="readonly"></div>
	<div>아이디<input type="text" name="memberId" id="mb_id" value="${modifyId}" readonly="readonly"></div>
	<input type="hidden" name="modifyPw" id="modifyPw" value="${modifyPW}"/>
	<div>기존 비밀번호<input type="password" name="pw" id="pw">
	<button type="button" onclick="or_pw_check()">변경하기</button></div>
	<div>새비밀번호<input type="password" name="mb_pw" id="mb_pw"></div>
	<div>비밀번호 확인<input type="password" name="pw_check" id="pw_check"></div>
</form>
	<button type="button" id="submit" onclick="modifyMember()">수정완료</button>
	<button type="button" onclick="location.href='/boardList?stateCode=${stateCode}'">처음으로</button>

</body>
</html>