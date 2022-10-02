<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h2>아이디 중복 체크</h2>
		<hr>
		<br>
			<form action="<%=context %>/idCheckPro.do">
			아이디 <input type="text" name="user_id" value="${user_id }">
			<input type="submit" value="중복체크" ><br>
			<input id="useBtn" type="button" value="사용하기" onclick="window.close()">
			<input id="cancleBtn" type="button" value="취소" onclick="window.close()"> 
		
	</form>
</body>
</html>