<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>관리자 페이지</title>
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
            var title = $("#com_title").val().trim();
            var content =  $("#com_content").val().trim();

            if(title == "" || title ==null) {
                alert("제목을 입력해주세요.");
                return false;
            } else if(content == ""|| content ==null) {
                alert("내용을 입력해주세요.");
                return false;
            }

            if(title != "" && title != "") {
                location.href="/communityModify";
                return true;
            }
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 board_wrap">
    <form action='<c:url value='/communityModify'/>' method="post" onsubmit="return confirm()" enctype="multipart/form-data">
        <div class="col-12 col-lg-10 board_con">
            <div class="col-12 board_title">글 수정</div>
            <div class="col-12 board_list">
                <div class="col-12 write_title">
                    <dl>
                        <dt class="col-12 col-sm-2">제목</dt>
                        <dd class="col-12 col-sm-10"><input type="text" value="${data.com_title}" id="com_title" name="com_title" class="box_eft_01"></dd>
                    </dl>
                </div>
                <div class="col-12 write_info">
                    <dl>
                        <dt class="col-12 col-sm-2">카테고리</dt>
                        <dd class="col-12 col-sm-10">
                            <c:choose>
                                <c:when test="${data.com_category == 0}">
                                    <label name="category" readonly="readonly">일상</label>
                                </c:when>
                                <c:when test="${data.com_category == 1}">
                                    <label name="category" readonly="readonly">취미</label>
                                </c:when>
                                <c:when test="${data.com_category == 2}">
                                    <label name="category" readonly="readonly">유머</label>
                                </c:when>
                                <c:when test="${data.com_category == 3}">
                                    <label name="category" readonly="readonly">음식</label>
                                </c:when>
                                <c:when test="${data.com_category == 4}">
                                    <label name="category" readonly="readonly">정보</label>
                                </c:when>
                                <c:when test="${data.com_category == 5}">
                                    <label name="category" readonly="readonly">취업/진로</label>
                                </c:when>
                                <c:when test="${data.com_category == 6}">
                                    <label name="category" readonly="readonly">기타</label>
                                </c:when>
                            </c:choose>
                        </dd>
                    </dl>
                </div>
                <div class="col-12 write_content">
                    <form method="post">
                        <!--<textarea id="summernote" name="editordata"></textarea>-->
                        <textarea placeholder="자유롭게 내용을 작성해주세요!" name="com_content" id="com_content">${data.com_content}</textarea>
                    </form>
                </div>

                <div class="filebox">
                    <label class="box_back" for="com_photo">파일찾기</label>
                    <input class="upload-name box_eft_01" value="첨부파일" placeholder="첨부파일 추가">
                    <input type="file" name="file" id="com_photo">
                </div>

            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="stateCode" value="${stateCode}"/>
            <input type="hidden" name="category" value="${category}"/>
            <input type="hidden" name="mb_nick" id="mb_nick" value="${data.mb_nick}">
            <input type="hidden" name="com_num" value="${data.com_num}">
            <div class="col-12 btn_wrap">
                <%--<a onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}';" class="on box_eft_02">등록</a>--%>
                <button type="submit" class="on box_eft_02">글 수정</button>
                <a onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}';" class="box_eft_02">목록</a>
            </div>
        </div>
    </form>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>