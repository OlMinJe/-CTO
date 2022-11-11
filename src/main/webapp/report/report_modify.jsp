<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" report_content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/report/report.css">
</head>

<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<!--<div class="col-12 report_board_wrap">
  <div class="col-12 report_board_title">
    <strong>신고게시판</strong>
  </div>
  <div class="col-12 board_write_wrap">
    <div class="col-12 report_board_write">
      <div class="col-12 report_write_title">
        <dl>
          <dt>제목</dt>
          <dd><input type="text" placeholder="제목 입력"></dd>
        </dl>
      </div>
      <div class="col-12 report_write_info">
        <dl class="col-6">
          <dt>글쓴이</dt>
          <dd><input type="text" placeholder="글쓴이 입력"></dd>
        </dl>
        <dl class="col-6">
          <dt>비밀번호</dt>
          <dd><input type="password" placeholder="비밀번호 입력"></dd>
        </dl>
      </div>
      <div class="col-12 report_write_content">
        <textarea placeholder="내용 입력"></textarea>
      </div>
      <form action="" method="post" enctype="multipart/form-data">
        <input type="file">
      </form>
    </div>
    <div class="col-12 report_bt_wrap">
      <a href="report_view.html" class="on">등록</a>
      <a href="report.html">취소</a>
    </div>
  </div>
</div>-->
<script>
    function confirm() {
        var title = $("#re_title").val().trim();
        var content =  $("#re_content").val().trim();

        if(title == "" || title ==null) {
            alert("제목을 입력해주세요.");
            return false;
        } else if(content == ""|| content ==null) {
            alert("내용을 입력해주세요.");
            return false;
        }

        if(title != "" && title != "") {
            location.href="/reportModify";
            return true;
        }
    }
</script>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 board_wrap">
    <form action='<c:url value='/reportModify'/>' method="post"  onsubmit="return confirm()" enctype="multipart/form-data">
        <div class="col-12 col-lg-10 board_con">
            <div class="col-12 board_title">글 수정</div>
            <div class="col-12 board_list">
                <div class="col-12 write_title">
                    <dl>
                        <dt class="col-12 col-sm-2">제목</dt>
                        <dd class="col-12 col-sm-10"><input type="text" value="${data.re_title}" id="re_title" name="re_title" class="box_eft_01"></dd>
                    </dl>
                </div>
                <div class="col-12 write_info">
                    <dl>
                        <dt class="col-12 col-sm-2">카테고리</dt>
                        <dd class="col-12 col-sm-10">
                            <c:choose>
                                <c:when test="${data.report_category == 0}">
                                    <label name="category" readonly="readonly">유저신고</label>
                                </c:when>
                                <c:when test="${data.report_category == 1}">
                                    <label name="category" readonly="readonly">댓글/게시판신고</label>
                                </c:when>
                                <c:when test="${data.report_category == 2}">
                                    <label name="category" readonly="readonly">페이지오류신고</label>
                                </c:when>
                                <c:when test="${data.report_category == 3}">
                                    <label name="category" readonly="readonly">저작권/명예훼손</label>
                                </c:when>
                                <c:when test="${data.report_category == 4}">
                                    <label name="category" readonly="readonly">기타</label>
                                </c:when>
                            </c:choose>
                            <!--
                            <select name="report_category" id="report_category" class="box_eft_01">
                                <option value="0">유저신고</option>
                                <option value="1">댓글/게시판신고</option>
                                <option value="2">페이지오류신고</option>
                                <option value="3">저작권/명예회손</option>
                                <option value="4">기타</option>
                            </select>

                            <select name="category" form="" class="box_eft_01">
                                <option value="01">유저신고</option>
                                <option value="02">댓글/게시판신고</option>
                                <option value="03">페이지오류신고</option>
                                <option value="04">저작권/명예회손</option>
                                <option value="05">기타</option>
                            </select> -->
                        </dd>
                    </dl>
                </div>
                <div class="col-12 write_content">
                    <form method="post">
                        <!--<textarea id="summernote" name="editordata"></textarea>-->
                        <textarea placeholder="자유롭게 내용을 작성해주세요!" name="re_content" id="re_content">${data.re_content}</textarea>
                    </form>
                </div>
                <form name="file" action="" method="post" enctype="multipart/form-data">
                    <div class="filebox">
                        <label class="box_back" for="re_photo">파일찾기</label>
                        <input class="upload-name box_eft_01" value="첨부파일" placeholder="첨부파일">
                        <input type="file" id="re_photo">
                    </div>
                </form>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="stateCode" id="stateCode" value="${stateCode}">
            <input type="hidden" name="category" value="${category}"/>
            <input type="hidden" name="mb_seq" id="mb_seq" value="${data.mb_seq}">
            <input type="hidden" name="re_num" value="${data.re_num}">
            <div class="col-12 btn_wrap">
                <button type="submit" class="on box_eft_02">글 수정</button>
                <a onclick="location.href='/report/report?stateCode=${stateCode}&category=${category}';" class="box_eft_02">목록</a>
                <!--
                <a onclick="location.href='/advice/advice_view.jsp';" class="on box_eft_02">등록</a>
                <a onclick="location.href='/advice/advice.jsp';" class="box_eft_01">취소</a>-->
            </div>
        </div>
    </form>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
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
</script>
</body>
</html>