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
            <li class="col-6 box_eft_01" id="community_editor" <%--onclick="li_active_02();"--%> onclick="location.href='/editor/editor?stateCode=${stateCode}&category=0'">에디터 칼럼</li>
            <!--stateCode 가지고 갈수 없음(페이지 안열림)아마도 카테고리가 문제를 일으킨 듯 함-->
        </ul>
        <div class="col-12 menu-con" id="sub-menu">
            <ul class="col-12 menu-box-01"><!--id="sub-menu"-->
                <c:if test="${sessionScope.stateCode ne 1}">
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=10&sort=bno';">전체</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=0&sort=bno';">일상</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=1&sort=bno';">취미</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=2&sort=bno';">유머</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=3&sort=bno';">음식</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=4&sort=bno';">정보</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=5&sort=bno';">취업/진로</li>
                    <li class="box_eft_01 div2" onclick="location.href='/com?category=6&sort=bno';">기타</li>
                </c:if>
                <c:if test="${sessionScope.stateCode eq 1}"> <!--https://liufeier.tistory.com/22-->
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=10&sort=bno';">전체</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=0&sort=bno';">일상</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=1&sort=bno';">취미</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=2&sort=bno';">유머</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=3&sort=bno';">음식</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=4&sort=bno';">정보</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=5&sort=bno';">취업/진로</li>
                    <li class="box_eft_01 div2" onclick="location.href='/community/community?stateCode=${stateCode}&category=6&sort=bno';">기타</li>
                </c:if>
            </ul>
        </div>
    </div>
    <%-- 필터링--%>
    <div class="col-12 col-lg-10 filter">
        <!--<c:if test="${sessionScope.stateCode eq 1}">
        <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&sort=viewCount'" class="box_eft_01 div3">조회순</button>
        <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&sort=replyCount'" class="box_eft_01 div3" data-bs-toggle="button" >댓글순</button>
        <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&sort=bno'" class="box_eft_01 div3 active">최신순</button>
        </c:if>-->
        <c:if test="${sessionScope.stateCode eq 1}">
        <c:if test="${paging.cri.type != null}"> <!-- 검색을 하지 않은 경우-->
            <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&type=${paging.cri.type}&keyword=${paging.cri.keyword}&sort=viewCount'" class="box_eft_01 div3" >조회순</button>
            <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&type=${paging.cri.type}&keyword=${paging.cri.keyword}&sort=replyCount'" class="box_eft_01 div3" data-bs-toggle="button" >댓글순</button>
            <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&type=${paging.cri.type}&keyword=${paging.cri.keyword}&sort=bno'" class="box_eft_01 div3 active">최신순</button>

        </c:if>
        <c:if test="${paging.cri.type == null}">
            <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&sort=viewCount'" class="box_eft_01 div3" >조회순</button>
            <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&sort=replyCount'" class="box_eft_01 div3" data-bs-toggle="button">댓글순</button>
            <button type="button" onclick="location.href='/community/community?stateCode=${stateCode}&category=${category}&sort=bno'"class="box_eft_01 div3 active">최신순</button>
        </c:if>
        </c:if>

        <c:if test="${sessionScope.stateCode ne 1}">
            <c:if test="${paging.cri.type != null}"> <!-- 검색을 하지 않은 경우-->
                <button type="button" onclick="location.href='/com?category=${category}&type=${paging.cri.type}&keyword=${paging.cri.keyword}&sort=viewCount'" class="box_eft_01 div3" >조회순</button>
                <button type="button" onclick="location.href='/com?category=${category}&type=${paging.cri.type}&keyword=${paging.cri.keyword}&sort=replyCount'" class="box_eft_01 div3" data-bs-toggle="button" >댓글순</button>
                <button type="button" onclick="location.href='/com?category=${category}&type=${paging.cri.type}&keyword=${paging.cri.keyword}&sort=bno'" class="box_eft_01 div3 active">최신순</button><%--class="btn btn-outline-dark float-right "--%>

            </c:if>
            <c:if test="${paging.cri.type == null}">
                <button type="button" onclick="location.href='/com?category=${category}&sort=viewCount'" class="box_eft_01 div3" >조회순</button>
                <button type="button" onclick="location.href='/com?category=${category}&sort=replyCount'" class="box_eft_01 div3" data-bs-toggle="button" >댓글순</button>
                <button type="button" onclick="location.href='/com?category=${category}&sort=bno'" class="box_eft_01 div3 active">최신순</button><%--class="btn btn-outline-dark float-right "--%>

            </c:if>
            </c:if>
    </div>
    <%-- 글 구조 바꾸지마 --%>
    <div class="col-12 col-lg-10 content">
        <!-- 여기서부터 content로 들어가는 부분-->
        <div class="content-table">
            <%-- 커뮤니티 - 일반 --%>
            <table class="table table-hover table-bordered" id="community-table">
                <tr>
                    <th class="displayNo">글번호</th>
                    <th class="displayNo">카테고리</th>
                    <th class="displayNo">작성자</th>
                    <th>제목</th>
                    <th class="displayNo">작성시간</th>
                    <th>조회수</th>
                    <th>좋아요</th>
                </tr>
                <c:set var="no" value="${paging.totalCount - cri.getPageStart()}"/>
                <c:forEach items="${list}" var="data">
                    <tr>
                        <td class="displayNo">${data.com_num}</td>
                        <div>
                            <c:choose>
                                <c:when test="${data.com_category == 0}">
                                    <td class="displayNo">일상</td>
                                </c:when>
                                <c:when test="${data.com_category == 1}">
                                    <td class="displayNo">취미</td>
                                </c:when>
                                <c:when test="${data.com_category == 2}">
                                    <td class="displayNo">유머</td>
                                </c:when>
                                <c:when test="${data.com_category == 3}">
                                    <td class="displayNo">음식</td>
                                </c:when>
                                <c:when test="${data.com_category == 4}">
                                    <td class="displayNo">정보</td>
                                </c:when>
                                <c:when test="${data.com_category == 5}">
                                    <td class="displayNo">취업/진로</td>
                                </c:when>
                                <c:when test="${data.com_category == 6}">
                                    <td class="displayNo">기타</td>
                                </c:when>
                            </c:choose>
                        </div>
                        <td class="displayNo">${data.mb_nick}</td>
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
                        <td class="displayNo"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.com_date}"/></td>
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
        <!--
        <c:if test="${sessionScope.stateCode eq 1}">
            <ul class="pagination" style="margin-bottom: 20px;">
                <c:if test="${paging.prev}">
                    <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${paging.startPage-1}">Previous</a></li>
                     </c:if>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                    <c:choose>
                        <c:when test="${paging.cri.page == num}">
                            <li class="page-item active"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${num}">${num}</a></li>
                            </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${num}">${num}</a></li>
                            </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${paging.next && paging.endPage>0}">
                    <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${paging.endPage+1}">Next</a></li>
                    </c:if>
            </ul>
        </c:if>-->
        <c:if test="${sessionScope.stateCode eq 1}">
            <c:if test="${paging.cri.type != null}"> <!-- 검색을 하지 않은 경우-->
            <ul class="pagination" style="margin-bottom: 20px;">
                <c:if test="${paging.prev}">
                    <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${paging.startPage-1}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">Previous</a></li>
                </c:if>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                    <c:choose>
                        <c:when test="${paging.cri.page == num}">
                            <li class="page-item active"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${num}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">${num}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${num}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">${num}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${paging.next && paging.endPage>0}">
                    <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${paging.endPage+1}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">Next</a></li>
                </c:if>
            </ul>
            </c:if>
            <c:if test="${paging.cri.type == null}">
                <ul class="pagination" style="margin-bottom: 20px;">
                    <c:if test="${paging.prev}">
                        <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${paging.startPage-1}">Previous</a></li>
                    </c:if>
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                        <c:choose>
                            <c:when test="${paging.cri.page == num}">
                                <li class="page-item active"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${num}">${num}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${num}">${num}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${paging.next && paging.endPage>0}">
                        <li class="page-item"><a class="page-link" href="/community/community?stateCode=${stateCode}&sort=${cri.sort}&category=${category}&page=${paging.endPage+1}">Next</a></li>
                    </c:if>
                </ul>
            </c:if>
        </c:if>

        <c:if test="${sessionScope.stateCode ne 1}">
            <c:if test="${paging.cri.type != null}">
                <ul class="pagination" style="margin-bottom: 20px;">
                    <c:if test="${paging.prev}">
                        <li class="page-item"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${paging.startPage-1}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">Previous</a></li>
                    </c:if>
                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                        <c:choose>
                            <c:when test="${paging.cri.page == num}">
                                <li class="page-item active"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${num}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">${num}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${num}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">${num}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${paging.next && paging.endPage>0}">
                        <li class="page-item"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${paging.endPage+1}&type=${paging.cri.type}&keyword=${paging.cri.keyword}">Next</a></li>
                    </c:if>
                </ul>
            </c:if>
            <c:if test="${paging.cri.type == null}">
            <ul class="pagination" style="margin-bottom: 20px;">
                <c:if test="${paging.prev}">
                    <li class="page-item"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${paging.startPage-1}">Previous</a></li>
                </c:if>
                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                    <c:choose>
                        <c:when test="${paging.cri.page == num}">
                            <li class="page-item active"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${num}">${num}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${num}">${num}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${paging.next && paging.endPage>0}">
                    <li class="page-item"><a class="page-link" href="/com?category=${category}&sort=${cri.sort}&page=${paging.endPage+1}">Next</a></li>
                </c:if>
            </ul>
            </c:if>
        </c:if>
        <!--프론트 페이징 디자인
        <ul class="pagination" style="margin-bottom: 20px;">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item active"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">5</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>-->
        <!--검색
        <form class="d-flex">
            <input class="form-control me-2 box_eft_01" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success box_eft_02" type="submit">Search</button>
        </form>-->
        <c:if test="${sessionScope.stateCode eq 1}">
        <form id="searchForm" action="/community/community" method="get" class="d-flex">
            <select name="type">
                <option value=""
                        <c:out value='${paging.cri.type == null? "selected": ""}'/>>--</option>
                <option value="T"
                        <c:out value='${paging.cri.type eq "T"?"selected": "" }'/>>제목</option>
                <option value="C"
                        <c:out value='${paging.cri.type eq "C"?"selected": "" }'/>>내용</option>
                <option value="W"
                        <c:out value='${paging.cri.type eq "W"?"selected": "" }'/>>작성자</option>
            </select>

            <input type="text" name="keyword" class="form-control me-2 box_eft_01" value="<c:out value='${paging.cri.keyword}'/>">

            <input type="hidden"  name="page" value="<c:out value='${paging.cri.page}'/>">
            <!--<input type="hidden" name="perPageNum"value="<c:out value='${paging.cri.perPageNum}' />">-->
            <input type="hidden" name="stateCode" value="${stateCode}">
            <input type="hidden" name="category" value="${category}">
            <input type="hidden" name="sort" value="<c:out value='${paging.cri.sort}'/>">
            <button class="btn btn-outline-success box_eft_02">검색</button>
        </form>
        </c:if>
        <c:if test="${sessionScope.stateCode ne 1}">
            <form id="searchForm" action="/com" method="get" class="d-flex">
                <select name="type">
                    <option value=""
                            <c:out value='${paging.cri.type == null? "selected": ""}'/>>--</option>
                    <option value="T"
                            <c:out value='${paging.cri.type eq "T"?"selected": "" }'/>>제목</option>
                    <option value="C"
                            <c:out value='${paging.cri.type eq "C"?"selected": "" }'/>>내용</option>
                    <option value="W"
                            <c:out value='${paging.cri.type eq "W"?"selected": "" }'/>>작성자</option>
                </select>

                <input type="text" name="keyword" class="form-control me-2 box_eft_01" value="<c:out value='${paging.cri.keyword}'/>">

                <input type="hidden"  name="page" value="<c:out value='${paging.cri.page}'/>">
                <!--<input type="hidden" name="perPageNum"value="<c:out value='${paging.cri.perPageNum}' />">-->
                <input type="hidden" name="category" value="${category}">
                <input type="hidden" name="sort" value="<c:out value='${paging.cri.sort}'/>">
                <button class="btn btn-outline-success box_eft_02">검색</button>
            </form>
        </c:if>
        <script>
            var searchForm = $('#searchForm');
            $('#searchForm button').on('click', function(e) {
                if (!searchForm.find('option:selected').val()) {
                    alert('검색종류를 선택하세요');
                    return false;
                }
                if (!searchForm.find('input[name="keyword"]').val()) {
                    alert('키워드를 입력하세요');
                    return false;
                }
                e.preventDefault();
                searchForm.find('input[name="page"]').val('1');
                searchForm.submit();
            });
        </script>
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
