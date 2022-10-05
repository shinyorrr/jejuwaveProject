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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

</script>
<c:import url="${context }/header.jsp"></c:import>
</head>
<body>

		<tbody>
		<div class="joinform" style="margin-top:200px; margin-left: 30%;">
	<form  action="<%=context %>/pwFindPro.do" method="post" id="frm" name="frm">
		<table>
		<thead>
			<tr>
				<th colspan="3" style=" text-align: center;"><h3>아이디</h3></th>
		</thead>
			<tr><td><p></td></tr>
			<tr><td><p></td></tr>
			<tr>
				<td style="width: 120px;">비밀번호</td>
				<td><input value="${pw }"></td>
			</tr>
			
		</table>
		<br>
		<div style="text-align: center;">
			<input type="button" value="아이디찾기" onclick="location.href = '<%=context %>/idFindForm.do'">
			<input type="reset" value="뒤로가기" onclick="location.href = '<%=context %>/pwFindForm.do'">
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