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
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("후기등록 완료!")
		location.href ="travelContent.do?t_num="+${t_num};
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
	alert("한줄평을 남겨주세요")
	location.href ="travelContent.do?t_num="+${t_num};
	</script>
</c:if>
</body>
</html>