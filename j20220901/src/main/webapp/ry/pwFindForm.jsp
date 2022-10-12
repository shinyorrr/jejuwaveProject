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
 	 body {
 	 overflow : visible;
 	  background-size: contain;
	  background-repeat : no repeat;
      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); 
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<body style="overflow: visible; height: 300px;">
		 <div class="container1" style="padding: auto;">
    <div class="input-form-backgroud row" style="margin-top: 300px;">
      <div class="input-form col-md-4 mx-auto">
        <h4 class="mb-3" style="text-align: center;">비밀번호 찾기</h4>
        <form class="validation-form" action="<%=context %>/pwFindPro.do" method="post" id="frm" name="frm">
          <div class="row">
            <div class="" ><!-- col-md-3 mb-3 -->
              <label for="name" style="padding-left: 10px;">아이디</label>
              <input type="text" class="form-control" id="user_id"  name="user_id" placeholder="" value="" required>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="" ><!-- col-md-3 mb-3 -->
              <label for="name" style="padding-left: 10px;">이름</label>
              <input type="text" class="form-control" id="user_name"  name="user_name" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
          </div>
          <div class="row">
          <div class="">
            <label for="email" style="padding-left: 10px;">이메일</label>
            <input type="email" class="form-control" id="user_email" name="user_email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
		 </div>
          <div class="col" style="margin-top: 10px; text-align: center;">
          <button class="btn btn-outline-warning" type="submit">비밀번호 찾기</button>
          <button class="btn btn-outline-warning" type="reset">취소</button>
          <button class="btn btn-outline-warning" type="button" onclick="location.href = '<%=context %>/idFindForm.do'">아이디 찾기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
		<%-- <tbody>
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
	</tbody> --%>
	<div style="margin-top: 15%;"></div>
	<footer class="py-5 bg-dark" style="bottom: 0;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your	Website 2022</p>
		</div>
	</footer>	
</body>
</html>