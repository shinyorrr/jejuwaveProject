<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU WAVE 동행찾기</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href="travelContent.do?t_num=" + ${t_num};
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("내용을 입력해주세요")
		location.href="travelContent.do?t_num=" + ${t_num};
	</script>
</c:if>

</body>
</html>