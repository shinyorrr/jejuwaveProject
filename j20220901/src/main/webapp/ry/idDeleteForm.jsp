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
<title>JEJU WAVE 회원탈퇴</title>
<c:import url="${context }/header.jsp"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
    .kRVxKH {
	color: rgb(255, 255, 255);
	background-color: #FF3500;;
	width: 80px;
	height: 40px;
	border-radius: 4px;
	cursor: pointer;
	transition: all 0.1s ease-out 0s;
}
</style>
</head>
<body>
<body style="overflow: visible; height: 300px;">
		 <div class="container1" style="padding: auto;">
    <div class="input-form-backgroud row" style="margin-top: 10%;">
      <div class="input-form col-md-6 mx-auto">
        <h4 class="mb-3" style="text-align: center;">회원 탈퇴</h4>
        <form class="validation-form" action="<%=context %>/idDeletePro.do">
          <div class="row">
            <div class="" ><!-- col-md-3 mb-3 -->
              <label for="name" style="padding-left: 10px;">비밀 번호</label>
              <input type="password" class="form-control" id="user_pw"  name="user_pw" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
          </div>
          <div class="col" style="margin-top: 10px; text-align: center;">
          <button class="ButtonStyle kRVxKH" type="submit" value="확인">확인</button>
          <button class="ButtonStyle kRVxKH" type="reset" value="취소" onclick="location.href='mypageUpdate.do'">취소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
<%-- <tbody>
		<div class="form-box" style="margin-top:200px; margin-left: 35%; margin-bottom: 50px;">
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
</tbody> --%>
	<footer class="py-5 bg-dark" style="margin-top: 26%;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your	Website 2022</p>
		</div>
	</footer>
</body>
</html>