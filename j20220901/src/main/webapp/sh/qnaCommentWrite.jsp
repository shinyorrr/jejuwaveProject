<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String context = request.getContextPath();%>
<!DOCTYPE html>
<html>
<title>JEJU WAVE Q&A</title>
<head>
<meta charset="UTF-8">




</head>
<body>
<c:if test="${result >0 }">
	<script type="text/javascript">
		
		location.href="<%=context %>/qnaWriteCheck.do?b_num=${b_num}"; 
	</script>
</c:if>
<c:if test="${result ==0 }">
	<script type="text/javascript">
		alert("댓글입력안됐어요");
		location.href="<%=context %>/qnaWriteCheck.do?b_num=${b_num}";
	
	</script>

</c:if>
</body>