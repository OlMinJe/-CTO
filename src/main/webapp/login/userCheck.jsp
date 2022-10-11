<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
</head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
var code = '${code}';
if(code == "matchesError") {
	alert("비밀번호가 맞지 않습니다.");
} else if(code == "nullError") {
	alert("아이디를 다시 입력해주세요.");
}
document.location.href = "/login/login.jsp";
</script>
<body>
</body>
</html>