<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <li class="col-6 box_eft_01" id="community_editor" <%--onclick="li_active_02();"--%> onclick="location.href='/editor/editor.jsp?stateCode=${stateCode}'">에디터 칼럼</li>
            <!--stateCode 가지고 갈수 없음(페이지 안열림)아마도 카테고리가 문제를 일으킨 듯 함-->
        </ul>
        <div class="col-12 menu-con" id="sub-menu">
            <ul class="col-12 menu-box-01"><!--id="sub-menu"-->
                <c:if test="${sessionScope.stateCode ne 1}">
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=10';">전체</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=0';">일상</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=1';">취미</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=2';">유머</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=3';">음식</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=4';">정보</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=5';">취업/진로</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=6';">기타</li>
                </c:if>
                <c:if test="${sessionScope.stateCode eq 1}"> <!--https://liufeier.tistory.com/22-->
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=10';">전체</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=0';">일상</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=1';">취미</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=2';">유머</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=3';">음식</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=4';">정보</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=5';">취업/진로</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=6';">기타</li>
                </c:if>
            </ul>
        </div>
    </div>
    <%-- 글 구조 바꾸지마 --%>
    <div class="col-12 col-lg-10 content">
        <!-- 여기서부터 content로 들어가는 부분-->
        <div class="content-table">
            <%-- 커뮤니티 - 일반 --%>
            <table class="table table-hover table-bordered" id="community-table">
                <tr>
                    <th>글번호</th>
                    <th>카테고리</th>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>작성시간</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                </tr>
                <c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
                <c:forEach items="${list}" var="data">
                    <tr>
                        <td>${data.com_num}</td>
                        <div>
                            <c:choose>
                                <c:when test="${data.com_category == 0}">
                                    <td>일상</td>
                                </c:when>
                                <c:when test="${data.com_category == 1}">
                                    <td>취미</td>
                                </c:when>
                                <c:when test="${data.com_category == 2}">
                                    <td>유머</td>
                                </c:when>
                                <c:when test="${data.com_category == 3}">
                                    <td>음식</td>
                                </c:when>
                                <c:when test="${data.com_category == 4}">
                                    <td>정보</td>
                                </c:when>
                                <c:when test="${data.com_category == 5}">
                                    <td>취업/진로</td>
                                </c:when>
                                <c:when test="${data.com_category == 6}">
                                    <td>기타</td>
                                </c:when>
                            </c:choose>
                        </div>
                        <td>${data.mb_nick}</td>
                        <td>
                            <c:if test="${sessionScope.stateCode ne 1}">
                                <a href="/com/com_view?com_num=${data.com_num}&category=${data.com_category}">${data.com_title}</a>
                            </c:if>
                            <c:if test="${sessionScope.stateCode ==1}">
                                <a href="/community/community_view?com_num=${data.com_num}&stateCode=${stateCode}&category=${data.com_category}">${data.com_title}</a>
                            </c:if>
                            <c:if test="${data.com_comment ne 0}">
                                <small>[&nbsp;<c:out value="${data.com_comment}"/>&nbsp;]</small>
                            </c:if>
                        </td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.com_date}"/></td>
                        <td>${data.com_hit}</td>
                        <td>${data.com_like}</td>
                    </tr>
                    <c:set var="no" value="${no-1}"></c:set>
                </c:forEach>
            </table>
            <input type="hidden" name="category" value="${category}"/>

            <!-- 커뮤니티 - 에디터 : 주소창 옮기고 새 페이지 생성 -->

        </div>
        <!--백엔드 페이징 삭제-->
        <%--<ul class="paging">
            <c:if test="${paging.prev}">
                <span><a href='<c:url value="/community/community?stateCode=${stateCode}&page=${paging.startPage-1}"/>'>이전</a></span>
            </c:if>
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                <span><a href='<c:url value="/community/community?stateCode=${stateCode}&page=${num}"/>'>${num}</a></span>
            </c:forEach>
            <c:if test="${paging.next && paging.endPage>0}">
                <span><a href='<c:url value="/community/community?stateCode=${stateCode}&page=${paging.endPage+1}"/>'>다음</a></span>
            </c:if>
        </ul>--%>
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
    <div class="btn_wrap">
        <c:if test="${stateCode == 1}">
            <a onclick="location.href='/community/community_write';" class="on box_eft_02">글쓰기</a>
        </c:if>
        <c:if test="${stateCode == 0}">
            <a onclick="location.href='/community/community_write.jsp';" class="on box_eft_02">글쓰기</a>
        </c:if>
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
