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
            <li class="col-6 active box_eft_01" id="community_normal" onclick="li_active_01();"> <!-- normal_event(); -->커뮤니티</li>
            <li class="col-6 box_eft_01" id="community_editor">에디터 칼럼</li>
        </ul>
        <div class="col-12 menu-con" id="sub-menu">
            <ul class="col-12 menu-box-01 div1"><!--id="sub-menu"-->
                <c:if test="${sessionScope.stateCode ne 1}">
                    <li class="box_eft_01 active" onclick="location.href='/com?category=10'">전체</li>
                    <li class="box_eft_01" onclick="location.href='/com?category=0'">일상</li>
                    <li class="box_eft_01" onclick="location.href='/com?category=1'">취미</li>
                    <li class="box_eft_01" onclick="location.href='/com?category=2'">유머</li>
                    <li class="box_eft_01" onclick="location.href='/com?category=3'">음식</li>
                    <li class="box_eft_01" onclick="location.href='/com?category=4'">정보</li>
                    <li class="box_eft_01" onclick="location.href='/com?category=5'">취업/진로</li>
                    <li class="box_eft_01" onclick="location.href='/com?category=6'">기타</li>
                </c:if>
                <c:if test="${sessionScope.stateCode eq 1}"> <!--https://liufeier.tistory.com/22-->
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    <%--<li class="box_eft_01 active"><a href="/community/community?stateCode=${stateCode}&category=10">전체</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=0">일상</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=1">취미</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=2">유머</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=3">음식</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=4">정보</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=5">취업/진로</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=6">기타</a></li>--%>
                </c:if>
                <%--<c:if test="${sessionScope.stateCode == 1}">
                    <c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
                    <c:choose>
                    <c:when test="${data.com_category == 10}">
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    <c:when test="${data.com_category == 0}">
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    <c:when test="${data.com_category == 1}">
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    <c:when test="${data.com_category == 2}">
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    <c:when test="${data.com_category == 3}">
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    <c:when test="${data.com_category == 4}">
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    <c:when test="${data.com_category == 5}">
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    <c:when test="${data.com_category == 6}">
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=10'">전체</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=0'">일상</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=1'">취미</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=2'">유머</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=3'">음식</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=4'">정보</li>
                        <li class="box_eft_02" onclick="location.href='/community/community?stateCode=${stateCode}&category=5'">취업/진로</li>
                        <li class="box_eft_02 active" onclick="location.href='/community/community?stateCode=${stateCode}&category=6'">기타</li>
                    </c:when>
                    </c:choose>
                </c:if>--%>

                <%--<c:if test="${sessionScope.stateCode ne 1}">
                    <li class="box_eft_01 active"><a href="/com?category=10">전체</a></li>
                    <li class="box_eft_01"><a href="/com?category=0">일상</a></li>
                    <li class="box_eft_01"><a href="/com?category=1">취미</a></li>
                    <li class="box_eft_01"><a href="/com?category=2">유머</a></li>
                    <li class="box_eft_01"><a href="/com?category=3">음식</a></li>
                    <li class="box_eft_01"><a href="/com?category=4">정보</a></li>
                    <li class="box_eft_01"><a href="/com?category=5">취업/진로</a></li>
                    <li class="box_eft_01"><a href="/com?category=6">기타</a></li>
                </c:if>
                <c:if test="${sessionScope.stateCode ==1}">
                    <li class="box_eft_01 active"><a href="/community/community?stateCode=${stateCode}&category=10">전체</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=0">일상</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=1">취미</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=2">유머</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=3">음식</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=4">정보</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=5">취업/진로</a></li>
                    <li class="box_eft_01"><a href="/community/community?stateCode=${stateCode}&category=6">기타</a></li>
                </c:if>--%>
            </ul>
        </div>
    </div>
    <div class="col-12 col-lg-10 content">
        <!--검색-->
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>
        <!--테이블-->
        <div class="content-table">
            <%-- 일반 --%>
            <table class="table table-hover table-bordered" id="community-table">
                <tr>
                    <%--<th>자동순번</th>--%>
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
                            <%--<td>${no}</td>--%>
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
                                <small><b>[&nbsp;<c:out value="${data.com_comment}"/>&nbsp;]</b></small>
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
            <!-- 에디터 -->
            <div class="col-12" id="editor_content">
                <div data-include-path="/community/editor.jsp"></div>
            </div>
            <%--<button type="button" class="btn btn-outline-success box_eft_02" onclick="location.href='/community/community_write'">글쓰기</button><br>--%>
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
            <!--페이징-->
            <ul class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item active"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </div>
    </div>
    <div class="btn_wrap">
        <c:if test="${stateCode == 1}">
            <a onclick="location.href='/community/community_write';" class="on box_eft_02">글쓰기</a>
        </c:if>
        <c:if test="${stateCode == 0}">
            <a onclick="location.href='/community/community_write.jsp';" class="on box_eft_02">글쓰기</a>
        </c:if>
        <!--<a href="#">수정</a>-->
    </div>
</div>
<jsp:include page="../fixed/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="/js/community.js"></script>
</html>
