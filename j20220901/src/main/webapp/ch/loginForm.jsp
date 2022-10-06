<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
   String context = request.getContextPath();
%>
<title>Insert title here</title>
<link rel="stylesheet" href="<%= context %>/css/ch/loginForm.css">
<script src="<%= context %>/js/jquery.js"></script>
<script>

function Checkform() {

    if( frm.user_id.value == "" ) {
    
        frm.user_id.focus();
        document.getElementById("input_not").textContent="아이디를 입력하세요";
        
        return false;
    }
    if( frm.user_pw.value == "" ) {
    
        frm.user_pw.focus();
        document.getElementById("input_not").textContent="비밀번호를 입력하세요";
        
        return false;
    }
    
    
}
$(document).ready(function(){

	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	var userInputId = getCookie("userInputId");

	$("input[name='user_id']").val(userInputId);  
 
	if($("input[name='user_id']").val() != ""){ // 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		$("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	}

	$("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
		if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
			var userInputId = $("input[name='user_id']").val();
			setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		}else{ // ID 저장하기 체크 해제 시,
			deleteCookie("userInputId");
		}
	});

	// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	$("input[name='user_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
			var userInputId = $("input[name='user_id']").val();
			setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		}
	});
});
 
  
<%-- 쿠키 설정 --%>
function setCookie(cookieName, value, exdays){
	var exdate = new Date();

	exdate.setDate(exdate.getDate() + exdays);

	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());

	document.cookie = cookieName + "=" + cookieValue;
}

<%-- 쿠키 삭제 --%>
function deleteCookie(cookieName){
	var expireDate = new Date();

	expireDate.setDate(expireDate.getDate() - 1);

	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

 
<%-- 쿠키 호출 --%>
function getCookie(cookieName) {

	cookieName = cookieName + '=';

	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';

	if(start != -1){
		start += cookieName.length;

		var end = cookieData.indexOf(';', start);

		if(end == -1)end = cookieData.length;

		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
</script>

</head>

<body>

<div class = "container">
	<div class = "login-form-box">
		<form action="<%=context%>/loginAction.do" name = frm id = "loginForm" onsubmit="return Checkform()">
				<div class = "login-form-box-img">
					<img alt="" src="<%=context%>/images/logo.png">
				</div>
				<div class = "login-form-box-inputid">
					<input type = "text" id = "user_id" name = "user_id" placeholder="id" value="">
				</div>
				<div class = "login-form-box-input-pass">
					<input type = "password" id = "user_pw" name = "user_pw" placeholder="password" value="">
				</div>
				<span id = "input_not" 
				 style="
				 color : rgb(204,0,153);
				 padding-top: 20px;
				 font-family: 'korean';
				 display: flex;
				 padding-left: 35%;
				 "></span>
				<div class = "login box">
					<input type="submit" class="login-button" value = "로그인">
				</div>
				<div class = "login id_checkbox" style="color: black;display: flex;padding-left: 80px;padding-top: 5px;font-family: 'korean';font-size: small;">
					<input type="checkbox" id = "idSaveCheck" >아이디 저장
				</div>
		</form>
		<div class = "login-form-box-join">아직 계정이 없으신가요? <a href="<%=context%>/joinForm.do">회원가입</a></div><p>
		<div class = "login-form-box-idsearch">아이디를 모르시나요? <a href="<%=context%>/idFindForm.do">아이디찾기</a></div><p>
		<div class = "login-form-box-pwsearch">비밀번호를 모르시나요? <a href="<%=context%>/pwFindForm.do">비밀번호찾기</a></div><p>
	</div> 
</div>
<footer>
</footer>
</body>
</html>