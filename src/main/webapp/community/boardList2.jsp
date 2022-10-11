<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>게시판</title>
</head>
<body>
<table border="1">
    <tr>
        <th>글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>내용</th>
        <th>작성시간</th>
    </tr>
    <c:forEach items="${list}" var="data">
        <tr>
            <td>${data.num}</td>
            <td>${data.writer}</td>
            <td>${data.title}</td>
            <td>${data.content}</td>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.regdate}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>