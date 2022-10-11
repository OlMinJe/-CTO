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
</head>
<script>
    function guid() {
        function s4() {
            return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
        }
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
    }


    /* ajax를 통한 프로필 수정처리 */
        function updatePro() {

            var file = document.getElementById('mb_img');
            var filePath = file.value;
            //전체경로를 \ 나눔.
            var filePathSplit = filePath.split('\\');
            //전체경로를 \로 나눈 길이.
            var filePathLength = filePathSplit.length;
            //마지막 경로를 .으로 나눔.
            var fileNameSplit = filePathSplit[filePathLength-1].split('.');
            //파일명 : .으로 나눈 앞부분
            var fileName = fileNameSplit[0];
            //파일 확장자 : .으로 나눈 뒷부분
            var fileExt = fileNameSplit[1];

        var mb_id = $("#mb_id").val();
        var mb_img = guid()+"_"+fileName+"."+fileExt;


        var param = {"mb_id":mb_id, "mb_img":mb_img}
        var stateCode = '?stateCode=1';

        if(mb_img == '') {
        alert("수정 프로필 사진을 선택해주세요.");
    } else {
        $.ajax({
        async:true,
        type:'POST',
        data: JSON.stringify(param),
        beforeSend: function(xhr) {
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    },
        url:"/profile_modify",
        dataType: "text",
        contentType: "application/json; charset=UTF-8",
        success : function() {
        alert("프로필 변경이 완료되었습니다.");
        location.href="/boardList"+stateCode;
    },
        error: function(jqXHR, textStatus, errorThrown) {
        alert("ERROR : " + textStatus + " : " + errorThrown);
    }
    })
    }

    }

</script>
<body>
<h1>프로필 변경 페이지입니다.</h1>
<form action='<c:url value='/register'/>' method="post" enctype="multipart/form-data">
    <div>아이디<input type="text" name="mb_id" id="mb_id" value="${modifyId}" readonly="readonly"></div>
    <div>현재 프로필사진<input type="text" name="img" id="img" value="${modifyImg}" readonly="readonly"></div>
    <div>프로필 선택<input type="file" name="mb_img" id="mb_img"></div>
</form>
<button type="button" onclick="updatePro()">프로필 변경</button>
<button type="button" onclick="location.href='/boardList?stateCode=${stateCode}'">처음으로</button>
</body>
</html>