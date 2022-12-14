<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>상담 게시물 작성</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/advice/advice.css">
    <!--써머노트-->
    <script src="/SummerNote/summernote-lite.js"></script>
    <script src="/SummerNote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="/SummerNote/summernote-lite.css">
    <script>
        $(document).ready(function () {
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
            var title = $("#talk_title").val().trim();
            var content =  $("#talk_content").val().trim();

            if(title == "" || title ==null) {
                alert("제목을 입력해주세요.");
                return false;
            } else if(content == ""|| content ==null) {
                alert("내용을 입력해주세요.");
                return false;
            }

            if(title != "" && title != "") {
                location.href="/talkWrite";
                return true;
            }
            //location.href='/community/community?stateCode=${stateCode}&category=${category}';
        }
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 board_wrap">
    <form action='<c:url value='/talkWrite'/>' method="post"  onsubmit="return confirm()" enctype="multipart/form-data">
    <div class="col-12 col-lg-10 board_con">
        <div class="col-12 board_title">글 작성</div>
        <div class="col-12 board_list">
            <div class="col-12 write_title">
                <dl>
                    <dt class="col-12 col-sm-2">제목</dt>
                    <dd class="col-12 col-sm-10"><input type="text" placeholder="제목 입력" id="talk_title" name="talk_title" class="box_eft_01"></dd>
                </dl>
            </div>
            <div class="col-12 write_info">
                <dl>
                    <dt class="col-12 col-sm-2">카테고리</dt>
                    <dd class="col-12 col-sm-10">
                        <select name="talk_category" id="talk_category" class="box_eft_01">
                            <option value="0">[일반] 일반고민</option>
                            <option value="1">[일반] 대인관계/가족</option>
                            <option value="2">[일반] 정신건강</option>
                            <option value="3">[일반] 직장</option>
                            <option value="4">[일반] 성소수자</option>
                            <option value="5">[여성] 성추행</option>
                            <option value="6">[여성] 출산/육아</option>
                            <option value="7">[여성] 섭식장애</option>
                            <option value="8">[여성] 외모 강박증</option>
                        </select>
                    </dd>
                </dl>
                <!--
                        <select name="talk_category" id="talk_category" class="box_eft_01">
                            <option value="01">[일반] 일반고민</option>
                            <option value="02">[일반] 대인관계/가족</option>
                            <option value="03">[일반] 정신건강</option>
                            <option value="04">[일반] 직장</option>
                            <option value="04">[일반] 성소수자</option>
                            <option value="04">[여성] 성추행</option>
                            <option value="04">[여성] 출산/육아</option>
                            <option value="04">[여성] 섭식장애</option>
                            <option value="04">[여성] 외모 강박증</option>
                        </select>
                -->
            </div>
            <div class="col-12 write_content">
                <form method="post">
                    <!--<textarea id="summernote" name="editordata"></textarea>-->
                    <textarea placeholder="자유롭게 내용을 작성해주세요!" name="talk_content" id="talk_content"></textarea>
                </form>
            </div>

                <div class="filebox">
                    <label class="box_back" for="talk_photo">파일찾기</label>
                    <input class="upload-name box_eft_01" value="첨부파일" placeholder="첨부파일">
                    <input type="file" name="file" id="talk_photo">
                </div>

        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="stateCode" id="stateCode" value="${stateCode}">
        <input type="hidden" name="category" value="${category}"/>
        <input type="hidden" name="mb_nick" value="${modifyNick}">
        <div class="col-12 btn_wrap">
            <!--
            <a onclick="location.href='/advice/advice_view.jsp';" class="on box_eft_02">등록</a>
            <a onclick="location.href='/advice/advice.jsp';" class="box_eft_02">취소</a>-->
            <button type="submit" class="on box_eft_02">글 등록</button>
            <a onclick="location.href='/advice/advice?stateCode=${stateCode}&category=${category}';" class="box_eft_02">목록</a>
        </div>
    </div>
    </form>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>
