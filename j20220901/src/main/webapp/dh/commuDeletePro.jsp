<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("삭제 완료");
			location.href="<%=context%>/commuList.do?pageNum=${pageNum }";
		</script>	
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("삭제 실패");
			location.href="<%=context%>/commuList.do?pageNum=${pageNum }";
		</script>	
	</c:if>
</body>
</html>