<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
<%
	session.removeAttribute("member");
	session.removeAttribute("stateCode");
	response.sendRedirect("/");
%>
</body>
</html>
