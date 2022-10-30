<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/login/find.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        $(function(){
            $("#findBtn").click(function(){
                $.ajax({
                    url : "/find_pw.do",
                    type : "GET",
                    data : {
                        mb_id : $("#mb_id").val(),
                        mb_email : $("#mb_email").val()
                    },
                    success : function(result) {
                        alert(result);
                        location.href='/login';
                    },
                })
            });
        })

        /*$(function(){
            $("#findBtn").click(function(){
                location.href='/login';
            })
        })*/
    </script>
    <title>비밀번호 찾기</title>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 pw_form_wrap">
    <div class="col-11 col-sm-8 pw_form_wrap">
        <div class="title">비밀번호 찾기</div>
        <i>- 임시 비밀번호를 발급받기 위해서는 가입 시 작성한 회원 정보를 정확히 작성하십시오.</i>
        <p class="p_id">
            <label class="comment">아이디</label>
            <input type="text" class="box_eft_01" id="mb_id" name="id" placeholder="아이디를 입력해주세요." required>
        </p>
        <p class="p_pw">
            <label class="comment">이메일</label>
            <input type="text" class="box_eft_01" id="mb_email" name="email" placeholder="이메일을 입력해주세요." required>
        </p>
        <div>
            <button type="submit" class="box_eft_02" id="findBtn">임시 비밀번호 발급</button>
            <button type="button" class="box_eft_02" onclick="history.go(-1);">취소</button>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>