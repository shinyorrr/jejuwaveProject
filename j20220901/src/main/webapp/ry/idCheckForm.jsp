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
</head>
<body>
   <h2>아이디 중복 체크</h2>
      <hr>
      <br>
         <form action="<%=context %>/idCheckPro.do">
         아이디 <input type="text" id="user_id" name="user_id" value="${user_id }"><br><br>
         <input type="submit" value="중복체크">
         <input id="useBtn" type="submit" value="사용하기" onclick="setParentText()">
         </form>

</body>
</html>