<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<%
   String context = request.getContextPath();
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>탈퇴하려면 암호를 입력해주세요</h2>
	<form action="<%=context %>/pwFindPro.do">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="user_id" value="${user_id }">
		암호 <input type="text" name="user_pw"><p>
		<input type="submit" value="확인">
		<input type="reset"  value="취소" onclick="window.close()">
	</form>
</body>
</html>