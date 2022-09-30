<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${result >0 }">
		<script type="text/javascript">
			alert("입력 완료!");
		 	location.href="qnaList.do"; 
		</script>
	</c:if>
	<c:if test="${result == 0 }"> 
		<script type="text/javascript">
			alert("오류입니다");
			location.href="qnaWriteForm.do?b_num=${b_num}";		
		</script>
	</c:if>
</body>
</html>