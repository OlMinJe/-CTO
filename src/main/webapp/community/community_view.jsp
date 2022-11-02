<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>커뮤니티 게시물</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/community/community.css">
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<div class="col-12 view_wrap">
    <div class="col-12 col-lg-10 view_con">
        <c:choose>
            <c:when test="${data.com_category == 0}">
                <div class="col-12 category_title">일상</div>
            </c:when>
            <c:when test="${data.com_category == 1}">
                <div class="col-12 category_title">취미</div>
            </c:when>
            <c:when test="${data.com_category == 2}">
                <div class="col-12 category_title">유머</div>
            </c:when>
            <c:when test="${data.com_category == 3}">
                <div class="col-12 category_title">음식</div>
            </c:when>
            <c:when test="${data.com_category == 4}">
                <div class="col-12 category_title">정보</div>
            </c:when>
            <c:when test="${data.com_category == 5}">
                <div class="col-12 category_title">취업/진로</div>
            </c:when>
            <c:when test="${data.com_category == 6}">
                <div class="col-12 category_title">기타</div>
            </c:when>
        </c:choose>
        <div class="col-12 view_list">
            <div class="col-12 board_view_title">${data.com_title}</div>
            <div class="col-12 board_view_info">
                <dl>
                    <dt>번호</dt>
                    <dd>${data.com_num}</dd>
                </dl>
                <dl>
                    <dt>작성자</dt>
                    <dd>${data.mb_nick}</dd>
                </dl>
                <dl>
                    <dt>작성일</dt><!--안 나옴(수정 필수)-->
                    <%--<dd>${data.com_date}</dd>--%>
                    <dd><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.com_date}"/></dd>
                </dl>
                <dl>
                    <dt>조회수</dt>
                    <dd>${data.com_hit}</dd>
                </dl>
                <dl>
                    <dt>좋아요 수</dt>
                    <dd>${data.com_like}</dd>
                </dl>
            </div>
            <div class="col-12 board_view_content">
                <pre>${data.com_content}</pre>
            </div>
        </div>
        <div class="col-12 btn_wrap">
            <!--좋아요 버튼 -->
            <div id="like">
                <c:choose>
                    <c:when test="${like_check ==0}">
                        <button type="button" id="likebtn">1</button>
                        <input type="hidden" id="likecheck" value="${like_check }">
                    </c:when>
                    <c:when test="${like_check ==1}">
                        <button type="button" id="likebtn">2</button>
                        <input type="hidden" id="likecheck" value="${like_check }">
                    </c:when>
                </c:choose>
            </div>
            <!--로그인 유뮤에 따른 목차 주소 반환-->
            <c:if test="${sessionScope.stateCode ne null}">
                <a onclick="location.href='/community/community?stateCode=${stateCode}&category=10';" class="on box_eft_02">목록</a>
            </c:if>
            <c:if test="${sessionScope.stateCode eq null}">
                <a onclick="location.href='/?com&category=10';" class="on box_eft_02">목록</a>
            </c:if>
        </div>

        <div>
            <c:if test="${membervo.mb_nick == data.mb_nick}">
                <button class="box_eft_02" id="modify" onclick="location.href='/community/community_modify?com_num=${data.com_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'">수정</button>
                <button class="box_eft_01" id="delete" onclick="location.href='/boardDelete?com_num=${data.com_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'">삭제</button>
            </c:if>
        </div>
        <script>

            $('#likebtn').click(function(){
                likeupdate();
            });

            function likeupdate(){
                var root = getContextPath(),
                    likeurl = "/like/likeupdate",
                    mb_nick = $('#mb_nick').val(),
                    com_num = $('#com_num').val(),
                    count = $('#likecheck').val(),
                    data = {"mb_nick" : mb_nick,
                        "com_num" : com_num,
                        "count" : count};

                $.ajax({
                    url : "/like/likeupdate",
                    type : 'POST',
                    contentType: "application/json; charset=UTF-8",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    async: false,
                    data : JSON.stringify(data),
                    success : function(result){
                        console.log("수정" + result.result);

                        if(count == 1){
                            console.log("좋아요 취소");
                            $('#likecheck').val(0);
                            $('#likebtn').attr('class','box_eft_01');
                        }else if(count == 0){
                            console.log("좋아요!");
                            $('#likecheck').val(1);
                            $('#likebtn').attr('class','box_eft_02');
                        }
                    }, error : function(result){
                        console.log("에러" + result.result)
                    }

                });
            };

            function getContextPath() {
                var hostIndex = location.href.indexOf( location.host ) + location.host.length;
                return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
            }
        </script>
        <div class="col-12 comment_box">
            <div class="col12 comment_num ">댓글 수
                <span>
                    ${data.com_comment}
                </span>
            </div><!--댓글 수 0만 출력됨-->
            <c:if test="${sessionScope.stateCode ne null}">
            <div class="col-12 comment_writer">

                <form name="commentInsertForm" method="post">
                <div class="col-12 input_box">
                    <input type="hidden" name="com_num" id="com_num" value="${data.com_num}"/>
                    <input type="hidden" name="mb_nick" id="mb_nick" value="${membervo.mb_nick}"/>
                    <input type="hidden" name="mb_seq" value="${membervo.mb_seq}"/>
                    <input type="hidden" name="mb_doctor" value="${membervo.mb_doctor}"/>
                    <!-- TODO : https://tried.tistory.com/95 -->
                    <textarea
                            className={`block whitespace-pre-wrap w-full bg-white text-gray-700 border border-black py-2
                            px-2 mb-3 leading-tight focus:border focus:border-pz-pt-1 `}
                            rows={large ? 5 : 1}
                            placeholder="당신의 의견을 들려주세요."
                            value={text}
                            onChange={handleChange}
                            class="box_eft_01"
                            id="comment_content"
                            name="comment_content"
                    ></textarea>
                    <span class="input-group-btn">
                    <button class="btn btn-outline-success box_eft_02" type="button" name="commentInsertBtn">댓글 등록</button>
                    </span>
                </div>
                </form>

            </div>
            </c:if>
            <div class="col-12 comment_writer"> <!-- 확인용 -->
                <div class="commentList"></div>
            </div>
            <%@include file="../community/comment.jsp"%>
        </div>
        <!-- <form name="commentInsertForm" method="post">
			<div class="input-group">
			<input type="hidden" name="com_num" id="com_num" value="${data.com_num}"/>
			<input type="hidden" name="mb_nick" id="mb_nick" value="${membervo.mb_nick}"/>
			<input type="hidden" name="mb_seq" value="${membervo.mb_seq}"/>
			<input type="hidden" name="mb_doctor" value="${membervo.mb_doctor}"/>
			<input type="text" class="form-control" id="comment_content" name="comment_content" placeholder="내용을 입력하세요.">
			<span class="input-group-btn"><button class="btn btn-default" type="button" name="commentInsertBtn">등록</button></span>
		</div>
		</form>
	</div>
	<div class="container">
		<div class="commentList"></div>
	</div>-->
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>
