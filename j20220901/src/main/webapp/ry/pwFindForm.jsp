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
.form-box{
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
/* $(function(){
	$('#chk').click(function(){
		var id       = $('#id').val();
		var sendData = 'id='+id
		alert('sendData->'+sendData);
		$.ajax({
			url      : 'idCheckForm.do', 
			dataType : 'text',
			data     : sendData,
			success  : function(data1) {
				$('#msg').html(data1);
			}
		});
	});
}); */
</script>
<c:import url="${context }/header.jsp"></c:import>
</head>
<body>

		<tbody>
		<div class="form-box" style="margin-top:300px; margin-left: 38%; margin-bottom: 100px;">
	<form  action="<%=context %>/pwFindPro.do" method="post" id="frm" name="frm" onsubmit="return chk()">
		<table>
		<thead>
			<tr>
				<th colspan="3" style=" text-align: center;"><h3>비밀번호 찾기</h3></th>
		</thead>
			<tr><td><p></td></tr>
			<tr><td><p></td></tr>
			<tr>
				<td style="width: 120px;">아이디</td>
				<td><input type="text" name="user_id" required="required"></td>
			</tr>
			<tr>
				<td style="width: 120px;">이름</td>
				<td><input type="text" name="user_name" required="required"></td>
			</tr>
			<tr>
				<td style="width: 120px;">이메일</td>
				<td><input type="email" name="user_email" required="required" placeholder="example@naver.com" ></td>
			</tr>
		</table>
		<br>
		<div style="text-align: center;">
			<input type="submit" value="비밀번호찾기" >
			<input type="reset" value="취소">
			<input type="button" value="아이디 찾기" onclick="location.href = '<%=context %>/idFindForm.do'">
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