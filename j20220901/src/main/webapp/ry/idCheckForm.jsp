<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
   String context = request.getContextPath();
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JEJU WAVE 중복체크</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
   function winop() {
      function winop() {
         window.open("<%=context %>/idCheckPro.do?=user_id"+$(user_id).val(), "kkk",   "width=300 height=300");
      }  
   }
   function setParentText(){            
       opener.document.getElementById("user_id").value = document.getElementById("user_id").value     
       window.close(); 
        }
   
</script>
<style type="text/css">
.kRVxKH {
	color: rgb(255, 255, 255);
	background-color: #FF3500;;
	width: 80px;
	height: 30px;
	border : none;
	border-radius: 4px;
	cursor: pointer;
	transition: all 0.1s ease-out 0s;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
   <h3 style="text-align: center;">아이디 중복 체크</h3>
      <hr>
      <br>
         <form action="<%=context %>/idCheckPro.do" name="frm" id="frm">
         <div style="text-align: center; width: 50%;" class="container">
         <input type="text" class="form-control" id="user_id" name="user_id" value="${user_id }"><br>
         </div>
         <div style="text-align: center; border: none;">
         <button class="ButtonStyle kRVxKH" type="submit" >중복체크</button>
         <button class="ButtonStyle kRVxKH" id="useBtn" type="submit" onclick="setParentText()">사용하기</button>
         </div>
         </form>

</body>
</html>