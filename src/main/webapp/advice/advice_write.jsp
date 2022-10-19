<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>advice_write</title>
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
    </script>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 board_wrap">
    <div class="col-12 col-lg-10 board_con">
        <div class="col-12 board_title">글 작성</div>
        <div class="col-12 board_list">
            <div class="col-12 write_title">
                <dl>
                    <dt class="col-12 col-sm-2">제목</dt>
                    <dd class="col-12 col-sm-10"><input type="text" placeholder="제목 입력" class="box_eft_01"></dd>
                </dl>
            </div>
            <div class="col-12 write_info">
                <dl>
                    <dt class="col-12 col-sm-2">카테고리</dt>
                    <dd class="col-12 col-sm-10">
                        <select name="category" form="" class="box_eft_01">
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
                    </dd>
                </dl>
            </div>
            <div class="col-12 write_content">
                <form method="post">
                    <!--<textarea id="summernote" name="editordata"></textarea>-->
                    <textarea>내용</textarea>
                </form>
            </div>
            <form name="file" action="" method="post" enctype="multipart/form-data">
                <div class="filebox">
                    <label class="box_back" for="file">파일찾기</label>
                    <input class="upload-name box_eft_01" value="첨부파일" placeholder="첨부파일">
                    <input type="file" id="file">
                </div>
            </form>
        </div>
        <div class="col-12 btn_wrap">
            <a onclick="location.href='/advice/advice_view.jsp';" class="on box_eft_02">등록</a>
            <a onclick="location.href='/advice/advice.jsp';" class="box_eft_02">취소</a>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>