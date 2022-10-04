<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String context = request.getContextPath();
%>
<body>
	<c:if test="${result > 0 }">
		<c:if test="${user_gubun > 0 }">
			<script type="text/javascript">
				location.href = "main.do";
			</script>
		</c:if>
		<c:if test="${user_gubun == 0 }">
			<script type="text/javascript">
				location.href = "admain.do";
			</script>
		</c:if>
	</c:if>
	
	<c:if test="${result == 0 }">
		<script type="text/javascript">
		alert("암호가 틀립니다");
		location.href = "ch/loginForm.jsp";
		</script>
	</c:if>
	
	<c:if test="${result < 0 }">
		<script type="text/javascript">
		alert("등록되지 않은 아이디입니다")
		location.href = "ch/loginForm.jsp";
		</script>
	</c:if>
	
	<script type="text/javascript">
		function chk(){
			var id = document.getElementById('id').value;
			var pass = document.getElementById('pass').value;
			var name = document.getElementById('name').value;
			location.href = "jsRunTestResult.jsp?id=" + id + "&dpass=" + pass + "&name=" + name;
		}
	
	</script>
	
</body>
</html>