<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<%
   String context = request.getContextPath();
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JEJU WAVE 중복체크</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
		alert("사용중인 아이디입니다.");
		location.href="<%=context %>/idCheckForm.do?user_id="+'${user_id}';
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
		alert("사용 가능한 아이디입니다.");
		location.href="<%=context %>/idCheckForm.do?user_id="+'${user_id}'; 
		</script>
	</c:if>
</body>
</html>