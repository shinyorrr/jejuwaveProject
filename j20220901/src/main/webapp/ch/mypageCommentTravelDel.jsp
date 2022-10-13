<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result != 0}">
		<script type="text/javascript">
			alert("삭제되었습니다");
			location.href = "mypageCommentTravel.do";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert("이미 삭제되었습니다.");
			history.back();
		</script>
	</c:if>
</body>
</html>