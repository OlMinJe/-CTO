<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>에디터 게시물 작성 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/community/community.css">
    <!--써머노트-->
    <script src="/SummerNote/summernote-lite.js"></script>
    <script src="/SummerNote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/SummerNote/summernote-lite.css">
    <script>
        $(document).ready(function() {
            //여기 아래 부분
            $('#summernote').summernote({
                height: 300,                 // 에디터 높이
                minHeight: null,             // 최소 높이
                maxHeight: null,             // 최대 높이
                focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",					// 한글 설정
                placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정

            });
        });

        function confirm() {
            var title = $("#edit_title").val().trim();
            var content =  $("#edit_content").val().trim();

            if(title == "" || title ==null) {
                alert("제목을 입력해주세요.");
                return false;
            } else if(content == ""|| content ==null) {
                alert("내용을 입력해주세요.");
                return false;
            }

            if(title != "" && title != "") {
                location.href="/editorWrite";
                return true;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 board_wrap">
    <form action='<c:url value='/editorWrite'/>' method="post" onsubmit="return confirm()" enctype="multipart/form-data">
        <div class="col-12 col-lg-10 board_con">
            <div class="col-12 board_title">에디터 글 작성</div>
            <div class="col-12 board_list">
                <div class="col-12 write_title">
                    <dl>
                        <dt class="col-12 col-sm-2">제목</dt>
                        <dd class="col-12 col-sm-10"><input type="text" placeholder="제목 입력" id="edit_title" name="edit_title" class="box_eft_01"></dd>
                    </dl>
                </div>
                <div class="col-12 write_content">
                    <form method="post">
                        <textarea placeholder="다양한 정보를 통해 사용자들에게 지식을 나눠주세요!" name="edit_content" id="edit_content"></textarea>
                    </form>
                </div>
                <div class="filebox">
                    <input type="file" name="file" value="" title="파일첨부" onchange="changeValue(this)" id="edit_photo">
                    <label class="box_back" for="edit_photo">파일찾기</label>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="stateCode" value="${stateCode}"/>
            <%--<input type="hidden" name="category" value="${category}"/>--%>
            <input type="hidden" name="mb_nick" value="${modifyNick}">
            <div class="col-12 btn_wrap" style="margin-top: 20px;">
                <button type="submit" class="on box_eft_02">글 등록</button>
                <a onclick="location.href='/editor/editor?stateCode=${stateCode}';" class="box_eft_02">목록</a>
            </div>
        </div>
    </form>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>