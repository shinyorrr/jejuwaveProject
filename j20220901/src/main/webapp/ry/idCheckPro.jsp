<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
		alert("이미 사용중인 아이디 입니다.");
		location.href="idCheckForm.do?user_id=${user_id}&pageNum=${pageNum}"
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
		alert("사용 가능한 아이디입니다.");
		location.href="idCheckForm.do?user_id=${user_id}&pageNum=${pageNum}"
		</script>
	</c:if>
</body>
</html>