<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		location.href="travelContent.do?t_num=" + ${t_num};
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("오류야 ㅠㅠ")
		location.href="travelContent.do?t_num=" + ${t_num};
	</script>
</c:if>

</body>
</html>