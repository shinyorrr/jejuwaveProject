<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%String context = request.getContextPath();%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result >0 }">
		<script type="text/javascript">
			alert("삭제완료!");
			location.href="<%=context %>/qnaWriteCheck.do?b_num=${b_num}";
		</script>
	</c:if>
	<c:if test="${result ==0 }">
		<script type="text/javascript">
			alert("삭제안됐어요");
			location.href="<%=context %>/qnaWriteCheck.do?b_num=${b_num}";	
		</script>
	</c:if>
</body>
