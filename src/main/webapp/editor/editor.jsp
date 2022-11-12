<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.project.vo.BoardVO" %>
<%@page import="com.project.vo.MemberVO" %>
<%@page import="com.project.vo.EditorVO" %>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>커뮤니티 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/community/community.css">
    <%--<script type="text/javascript" src="/js/community.js"></script>--%>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/community.js"></script>--%>
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 community">
    <div class="col-12 col-lg-10 menu">
        <ul class="menu-wrap">
            <li class="col-6 active box_eft_01" id="community_normal" <%--onclick="li_active_01();"--%> onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">커뮤니티</li>
            <li class="col-6 box_eft_01" id="community_editor"<%-- onclick="li_active_02();"--%> onclick="location.href='/editor/editor.jsp?stateCode=${stateCode}'">에디터 칼럼</li>
            <!--stateCode 가지고 갈수 없음(페이지 안열림)아마도 카테고리가 문제를 일으킨 듯 함-->
        </ul>
    </div>
    <%-- 글 구조 바꾸지마 --%>
    <div class="col-12 col-lg-10 content">
        <div class="content-table">
            <!-- 커뮤니티 - 에디터 -->
            <table class="table table-hover table-bordered" id="community-table">
                <tr>
                    <th>글번호</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                </tr>
                <c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
                <c:forEach items="${list}" var="data">
                    <tr>
                        <td>${data.edit_num}</td>
                        <td>${data.mb_nick}</td>
                        <%--<td>${data.mb_seq}</td>--%>
                        <td>
                            <a href="/editor/editor_view?edit_num=${data.edit_num}&stateCode=${stateCode}&category=${data.edit_category}">${data.edit_title}</a>
                            <c:if test="${data.edit_comment ne 0}">
                                <small>[&nbsp;<c:out value="${data.edit_comment}"/>&nbsp;]</small>
                            </c:if>
                        </td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.edit_date}"/></td>
                        <td>${data.edit_hit}</td>
                        <td>${data.edit_like}</td>
                    </tr>
                    <c:set var="no" value="${no-1}"></c:set>
                </c:forEach>
            </table>
            <%--<input type="hidden" name="category" value="${category}"/>--%>
            <!--페이징 디자인-->
            <ul class="pagination" style="margin-bottom: 20px;">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item active"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
            <!--검색-->
            <form class="d-flex">
                <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
            </form>
        </div>
        <!--의사 여부에 따른 글쓰기 버튼 보이기 여부 : db에 없어서 안됨(일단 다 보이게)-->
        <div class="btn_wrap">
            <%--<c:if test="${data.mb_doctor == 1}">
                <a onclick="location.href='/editor/editor_write';" class="on box_eft_02">글쓰기</a>
            </c:if>--%>
            <a onclick="location.href='/editor/editor_write';" class="on box_eft_02">글쓰기</a>
        </div>
    </div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/js/community.js"></script>
</html>

<!-- 커뮤니티 - 에디터 -->
<%--
<div class="col-12" id="editor_content">
    &lt;%&ndash;<div data-include-path="/community/editor_view.jsp"></div>&ndash;%&gt;
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
                &lt;%&ndash; 글 1개의 구조 &ndash;%&gt;
                <div class="col-12 content_card">
                    <div class="col-12 col-md-4 img"><img src></div>
                    <ul class="col-0 right">
                        &lt;%&ndash; 카테고리가 column 이라는 뜻 &ndash;%&gt;
                        <li class="col-12 column">column</li>
                        <li class="col-12 sub_title">글 제목</li>
                        <li class="col-12 sub_content">
                            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세.
                            남산 위에 저 소나무, 철갑을 두른 듯 바람서리 불변함은 우리 기상일세.
                            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.
                            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세
                            무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세
                        </li>
                        <li class="col-4 col-md-3 col-lg-2 username">작성자<span>작성자명</span></li>
                        <li class="col-4 col-md-3 col-lg-2 comment_num">댓글수<span>댓글수</span></li>
                    </ul>
                </div>
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
    </div>
</div>--%>



<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.project.vo.BoardVO" %>
<%@page import="com.project.vo.MemberVO" %>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>커뮤니티 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> <!-- 부트스트랩 -->
    <script type="text/javascript" src="/js/jquery-3.6.0.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css" href="/css/common.css"> <!-- 공통 css -->
    <link rel="stylesheet" type="text/css" href="/css/community/community.css">
    &lt;%&ndash;<script type="text/javascript" src="/js/community.js"></script>&ndash;%&gt;
    &lt;%&ndash;<script type="text/javascript" src="${pageContext.request.contextPath}/js/community.js"></script>&ndash;%&gt;
</head>
<body>
<jsp:include page="../fixed/header.jsp"></jsp:include>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<div class="col-12 community">
    <div class="col-12 col-lg-10 menu">
        <ul class="menu-wrap">
            <li class="col-6 active box_eft_01" id="community_normal" &lt;%&ndash;onclick="li_active_01();"&ndash;%&gt; onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">커뮤니티</li>
            <li class="col-6 box_eft_01" id="community_editor"&lt;%&ndash; onclick="li_active_02();"&ndash;%&gt; onclick="location.href='/editor/editor.jsp'">에디터 칼럼</li>
        </ul>
    </div>
    &lt;%&ndash; 글 구조 바꾸지마 &ndash;%&gt;
    <div class="col-12 col-lg-10 content">
        <div class="content-table">
            <!-- 커뮤니티 - 에디터 -->
            <div class="col-12" id="editor_content">
                <div class="col-12 editor_wrap">
                    <div class="col-12 editor_con">
                        <div class="col-12 title">Editor</div>
                        <div class="col-12 content_list"><!--테이블 리스트-->
                            &lt;%&ndash; 글 1개의 구조 &ndash;%&gt;
                            <div class="col-12 content_card">
                                <div class="col-12 col-md-4 img"><img src></div>
                                <ul class="col-0 right">
                                    &lt;%&ndash; 카테고리가 column 이라는 뜻 : 에디터 창도 카테고리가 필요한가?&ndash;%&gt;
                                    <li class="col-12 column">column</li><!--카테고리 없으면 삭제-->
                                    <li class="col-12 sub_title">글 제목</li>
                                    <li class="col-12 sub_content">
                                        동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세.
                                        남산 위에 저 소나무, 철갑을 두른 듯 바람서리 불변함은 우리 기상일세.
                                        가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.
                                        이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세
                                        무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세
                                    </li>
                                    <li class="col-4 col-md-3 col-lg-2 username">작성자<span>작성자명</span></li>
                                    <li class="col-4 col-md-3 col-lg-2 comment_num">댓글수<span>댓글수</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--백엔드 페이징 삭제-->
        &lt;%&ndash;<ul class="paging">
            <c:if test="${paging.prev}">
                <span><a href='<c:url value="/community/community?stateCode=${stateCode}&page=${paging.startPage-1}"/>'>이전</a></span>
            </c:if>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                <span><a href='<c:url value="/community/community?stateCode=${stateCode}&page=${num}"/>'>${num}</a></span>
            </c:forEach>
            <c:if test="${paging.next && paging.endPage>0}">
                <span><a href='<c:url value="/community/community?stateCode=${stateCode}&page=${paging.endPage+1}"/>'>다음</a></span>
            </c:if>
        </ul>&ndash;%&gt;
        <!--페이징 디자인-->
        <ul class="pagination" style="margin-bottom: 20px;">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item active"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
        <!--검색-->
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>
    </div>
    <!--의사 여부에 따른 글쓰기 버튼 보이기 여부-->
    <div class="btn_wrap">
        <c:if test="${data.mb_doctor == 1}">
            <a onclick="location.href='/editor/editor_write';" class="on box_eft_02">글쓰기</a>
        </c:if>
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/js/community.js"></script>
</html>

<!-- 커뮤니티 - 에디터 -->
&lt;%&ndash;
<div class="col-12" id="editor_content">
    &lt;%&ndash;<div data-include-path="/community/editor_view.jsp"></div>&ndash;%&gt;
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
                &lt;%&ndash; 글 1개의 구조 &ndash;%&gt;
                <div class="col-12 content_card">
                    <div class="col-12 col-md-4 img"><img src></div>
                    <ul class="col-0 right">
                        &lt;%&ndash; 카테고리가 column 이라는 뜻 &ndash;%&gt;
                        <li class="col-12 column">column</li>
                        <li class="col-12 sub_title">글 제목</li>
                        <li class="col-12 sub_content">
                            동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세.
                            남산 위에 저 소나무, 철갑을 두른 듯 바람서리 불변함은 우리 기상일세.
                            가을 하늘 공활한데 높고 구름 없이 밝은 달은 우리 가슴 일편단심일세.
                            이 기상과 이 맘으로 충성을 다하여 괴로우나 즐거우나 나라 사랑하세
                            무궁화 삼천리 화려강산 대한 사람 대한으로 길이 보전하세
                        </li>
                        <li class="col-4 col-md-3 col-lg-2 username">작성자<span>작성자명</span></li>
                        <li class="col-4 col-md-3 col-lg-2 comment_num">댓글수<span>댓글수</span></li>
                    </ul>
                </div>
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
    </div>
</div>&ndash;%&gt;--%>
