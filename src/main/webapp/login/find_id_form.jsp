<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/login/find.css">
    <title>아이디 찾기</title>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 id_form_wrap">
    <div class="col-11 col-sm-8 col-md-6 col-lg-5 result_wrap">
        <div class="title">아이디 찾기</div>
        <form action="/find_id.do" method="get">
            <tbody>
            <tr>
                <span>이메일을 입력해주세요.</span>
                <input class="w3-input" type="text" id="mb_email" name="mb_email" required>
            </tr>
            </tbody>
        </form>
        <div style="text-align: center;">
            <button type="submit" id=findBtn class="box_eft_02">아이디 찾기</button>
            <button type="button" class="box_eft_02" onclick="history.go(-1);">메인으로</button>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>