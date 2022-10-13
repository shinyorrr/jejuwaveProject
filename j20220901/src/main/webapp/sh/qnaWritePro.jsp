<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String context = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JEJU WAVE Q&A</title>
</head>

<body>
	
	<c:if test="${result >0 }">
		<script type="text/javascript">
			alert("입력 완료!");
		 	location.href="<%=context %>/qnaList.do?sort=1"; 
		</script>
	</c:if>
	<c:if test="${result == 0 }"> 
		<script type="text/javascript">
			alert("오류입니다");
			location.href="<%=context %>/qnaWriteForm.do?b_num=${b_num}";		
		</script>
	</c:if>
</body>
</html>