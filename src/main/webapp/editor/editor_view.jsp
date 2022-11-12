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
        <div class="col-12 category_title">에디터 칼럼</div>
        <div class="col-12 view_list">
            <div class="col-12 board_view_title">${data.edit_title}</div>
            <div class="col-12 board_view_info">
                <dl>
                    <dt>번호</dt>
                    <dd>${data.edit_num}</dd>
                </dl>
                <dl>
                    <dt>작성자</dt>
                    <dd>${data.mb_nick}</dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.edit_date}"/></dd>
                </dl>
                <dl>
                    <dt>조회수</dt>
                    <dd>${data.edit_hit}</dd>
                </dl>
                <dl>
                    <dt>좋아요 수</dt>
                    <dd>${data.edit_like}</dd>
                </dl>
            </div>
            <div class="col-12 board_view_content">
                <pre>${data.edit_content}</pre>
                <%--${data.com_photo}--%>
            </div>
        </div>
        <div class="col-12 btn_wrap">
            <!--좋아요 버튼 -->
            <div id="like">
                <c:choose>
                    <c:when test="${like_check == 0}">
                        <button type="button" id="likebtn" onclick="window.location.reload();" style="background-image: url('/static/img/heart_icon_3.png');">1</button>
                        <%--출처: Heart icons created by Vlad Szirka - Flaticon--%>
                        <input type="hidden" id="likecheck" value="${like_check }">
                    </c:when>
                    <c:when test="${like_check == 1}">
                        <button type="button" id="likebtn" onClick="history.go(0);" style="background-image: url('/static/img/heart_icon_2.png');">2</button>
                        <%--출처:Heart icons created by Vlad Szirka - Flaticon--%>
                        <input type="hidden" id="likecheck" value="${like_check }">
                    </c:when>
                </c:choose>
            </div>
            <a onclick="location.href='/editor/editor?stateCode=${stateCode}&category=0';" class="on box_eft_02">목록</a>
        </div>

        <div>
            <c:if test="${membervo.mb_nick == data.mb_nick}">
                <button class="box_eft_02" id="modify" onclick="location.href='/editor/editor_modify?edit_num=${data.edit_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'">수정</button>
                <button class="box_eft_01" id="delete" onclick="location.href='/editorDelete?edit_num=${data.edit_num}&stateCode=${stateCode}&category=${category}&writer=${data.mb_nick}'">삭제</button>
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
                    edit_num = $('#edit_num').val(),
                    count = $('#likecheck').val(),
                    data = {"mb_nick" : mb_nick,
                        "edit_num" : edit_num,
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
                            location.reload();//추가
                        }else if(count == 0){
                            console.log("좋아요!");
                            $('#likecheck').val(1);
                            $('#likebtn').attr('class','box_eft_02');
                            location.reload();//추가
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
            <div class="col12 comment_num ">댓글 수<span>${data.edit_comment}</span></div><!--댓글 수 0만 출력됨-->
            <c:if test="${sessionScope.stateCode ne null}">
                <div class="col-12 comment_writer">
                    <form name="commentInsertForm" method="post">
                        <div class="col-12 input_box">
                            <input type="hidden" name="edit_num" id="edit_num" value="${data.edit_num}"/>
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
            <%--<%@include file="../community/comment.jsp"%>--%>
        </div>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
</html>





















<%--
<div class="col-12 editor_wrap">
    <div class="col-12 editor_con">
        <!--<div class="col-12 menu">
            <ul class="menu-wrap">
                <li class="col-6 box_eft_01" id="community_normal">
                    커뮤니티
                    <img src="/22_ig031/src/main/resources/static/img/icon_01.png" alt="모바일 아이콘" onclick="imgClick();">
                </li>
                <li class="col-6 active  box_eft_01" id="community_editor">
                    에디터 칼럼
                    <img src="/22_ig031/src/main/resources/static/img/icon_01.png" alt="모바일 아이콘" onclick="imgClick();">
                </li>
            </ul>
        </div>-->
        <div class="col-12 title">Editor</div>
        <div class="col-12 content_list">
            <!-- 스크립트로 돌릴 부분
            <% for(int i =0; i < 3; i++){  %>-->
            <div class="col-12 content_card">
                <div class="col-12 col-md-4 img"><img></div>
                <ul class="col-0 right">
                    <li class="col-12 column">column</li>
                    <li class="col-12 sub_title">글 제목</li>
                    <li class="col-12 sub_content">
                        동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세.
                        남산 위에 저 소나무, 철갑을 두른 듯 바람서리 불변함은 우리 기상일세.
                        가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.
                        이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세
                        무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세
                    </li>
                    <li class="col-4 col-md-3 col-lg-2 username">작성자<span><% 변수 %></span></li>
                    <li class="col-4 col-md-3 col-lg-2 comment_num">댓글수<span><% 변수 %></span></li>
                </ul>
            </div>
            <!--<% } %>-->
        </div>
        <!--<ul class="pagination">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item active"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>-->
    </div>
</div>--%>
