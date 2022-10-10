<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result != 0 }">
		<script type="text/javascript">
			alert("수정완료");
			location.href="mypageUpdate.do";
		</script>	
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("암호변경실패");
			history.back();
		</script>	
	</c:if>
</body>
</html>