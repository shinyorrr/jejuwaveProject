<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
</head>
<body>
	<c:if test="${result > 0}">
		<script type="text/javascript">
		alert("앞으로 잘 부탁드려요!");
		location.href="main.do?pageNum=${pageNum}"
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
		alert("회원가입 실패 ㅠㅠ");
		location.href="joinForm.do?pageNum=${pageNum}"
		</script>
	</c:if>

</body>
</html>