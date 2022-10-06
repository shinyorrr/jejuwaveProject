<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head>
<%
   String context = request.getContextPath();
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	caption {
	font-size: 24px;
	}
.joinform{
    box-shadow: 10px 10px 10px 10px rgba(89,89,89,0.39);
    padding:70px 45px 45px 45px;
    display : inline-block;
}
	pre {
	font-size: 8pt;
	font-color: #gray;
}
</style>
<c:import url="${context }/header.jsp"/>
</head>
<body>
<tbody>
		<div class="joinform" style="margin-top:200px; margin-left: 30%; ">
	<h2>탈퇴하려면 암호를 입력해주세요</h2><br>
	<form action="<%=context %>/idDeletePro.do">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="user_id" value="${user_id }">
		<div style="text-align: center;">
		암호 <input type="password" name="user_pw" id="user_pw"><br><br>
		</div>
		<div style="text-align: center;">
		<input type="submit" value="확인">
		<input type="reset"  value="취소" onclick="location.href='mypageUpdate.do'">
		</div>
	</form>
	</div>
</tbody>
<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your	Website 2022</p>
		</div>
	</footer>	
</body>
</html>