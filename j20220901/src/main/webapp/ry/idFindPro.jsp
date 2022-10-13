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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JEJU WAVE 아이디찾기</title>
<style type="text/css">
 	 body {
 	 /* overflow : visible;
 	  background-size: contain;
	  background-repeat : no repeat;
      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);  */
    } 
	.kRVxKH {
	color: rgb(255, 255, 255);
	background-color: #FF3500;;
	width: 100px;
	height: 40px;
	border-radius: 4px;
	cursor: pointer;
	transition: all 0.1s ease-out 0s;
}
    .input-form {
      max-width: 280px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
    }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

</script>
<c:import url="${context }/header.jsp"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<c:if test="${id != null}">
	<div class="container1" style="padding: auto;">
    <div class="input-form-backgroud row" style="margin-top: 300px;">
      <div class="input-form col-md-3 mx-auto">
        <h4 class="mb-3" style="text-align: center;">아이디 찾기</h4>
	        <form class="validation-form">
	          <div class="row">
	            <div class="" >
	           	 <label for="name" style="padding-left: 45%"></label>
	              <input type="text" style=" text-align:center; border: none; background: transparent;" value="${id }" class="form-control">
	            </div>
	          </div>
	          <div class="col" style="margin-top: 10px; text-align: center;">
	          <button class="ButtonStyle kRVxKH" type="button" onclick="location.href = '<%=context %>/pwFindForm.do'">비밀번호찾기</button>
	          <button class="ButtonStyle kRVxKH" type="button" onclick="location.href = '<%=context %>/idFindForm.do'">뒤로가기</button>
	          </div>
	        </form>
      </div>
    </div>
  </div>
</c:if>
<c:if test="${id == null}">
	<div class="container1" style="padding: auto;">
    <div class="input-form-backgroud row" style="margin-top: 300px;">
      <div class="input-form col-md-4 mx-auto">
      <br>
        <h4 class="mb-3" style="text-align: center;">아이디 찾기 실패</h4>
        <form class="validation-form">
          <div class="col" style="margin-top: 10px; text-align: center;">
          <br>
          <button class="ButtonStyle kRVxKH" type="button" onclick="location.href = '<%=context %>/pwFindForm.do'">비밀번호찾기</button>
          <button class="ButtonStyle kRVxKH" type="button" onclick="location.href = '<%=context %>/idFindForm.do'">뒤로가기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</c:if>
		<%-- <tbody>
		<div class="joinform" style="margin-top:200px; margin-left: 30%;">
	<form  action="<%=context %>/idFindPro.do" method="post" id="frm" name="frm" onsubmit="return chk()">
		<table>
		<thead>
			<tr>
				<th colspan="3" style=" text-align: center;"><h3>아이디</h3></th>
		</thead>
			<tr><td><p></td></tr>
			<tr><td><p></td></tr>
			<tr>
				<td style="width: 120px;">아이디</td>
				<td><input type="hidden" value="${id }"></td>
			</tr>
			
		</table>
		<br>
		<div style="text-align: center;">
			<input type="button" value="비밀번호찾기" onclick="location.href = '<%=context %>/pwFindForm.do'">
			<input type="reset" value="뒤로가기" onclick="location.href = '<%=context %>/idFindForm.do'">
		</div>
	</form>	
		</div>
	</tbody> --%>
	<div style="margin-top: 25%;"></div>
	<footer class="py-5 bg-dark" style="bottom: 0;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your	Website 2022</p>
		</div>
	</footer>
</body>
</html>