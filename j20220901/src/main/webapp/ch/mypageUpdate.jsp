<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
<c:import url="${context}/header.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR+Ligth:wght@300;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageInsert.css?after">
</head>
<script type="text/javascript" src = "<%=context%>/js/jquery.js"></script>
<script type="text/javascript">

/* 이미지 클릭시 파일선택 창 나오게 만들기 */
$(function() {
	$('#target_img').on('click', function() {
	    $('#profile').trigger('click');
	});
});

/* 이미지 미리보기 */
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('target_img').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('target_img').src = "";
	  }
	}


/* 휴대폰 번호 - 자동입력 및 문자,- 방지 */
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}

/* 이메일 자동 선택 부분 */

function email_check() {
    if (document.frm.eMailForm.options[document.frm.eMailForm.selectedIndex].value == "1") {
        document.frm.user_email2.disabled = false;
        document.frm.user_email2.value = "";
        document.frm.user_email2.focus();
    } else {
        document.frm.user_email2.disabled = true;
        document.frm.user_email2.value= 
            document.frm.eMailForm.options[document.frm.eMailForm.selectedIndex].value;
    }
}

$(function(){
	var eMailForm = $('#eMailForm').val()
	$('input[name=user_email2]').attr('value',eMailForm);
})

/* submit시 설정 */
function disableOff(){

	document.frm.user_email2.disabled = false;
}
/* 비밀번호 변경버튼 누르면 인풋화면 나옴 */
function passwordUpdate(){
	if($('#oldPassword').css('display') == 'none'){
		$('#oldPassword').show();
		$('#newPassword1').show();
		$('#newPassword2').show();
		$('#newPassword3').show();
	}else{
		$('#oldPassword').hide();
		$('#newPassword1').hide();
		$('#newPassword2').hide();
		$('#newPassword3').hide();

	}
}
/* 현재 패스워드와 일치한지, 공백인지 유효성검사 */
function fn_submit(){	
	var f = document.pw;
	var pw = ${user_pw};
	if(f.pass1.value == ""){
		alert("현 암호를 입력해주세요.");
		f.pass1.focus();
		return false;
	}
	if(f.pass2.value == ""){
		alert("새로운 암호를 입력해주세요.");
		f.pass2.focus();
		return false;
	}
	if(f.pass3.value == ""){
		alert("새 암호를 재입력해주세요.");
		f.pass4.focus();
		return false;
	}
	if(f.pass2.value != f.pass3.value){
		alert("새로운 암호와 재설정이 일치하지 않습니다.");
		f.pass3.focus();
		return false;
	}
	if(f.pass1.value != pw){
		alert("현재암호와 다릅니다.")
		f.pass1.focus();
		return false;
	}
	f.submit();
}


/* const email_change = (target) => {
	if(target.options[target.selectedIndex].value == '1'){
		document.user.email2.disabled = false;
	} 
} */

/* function email_change(){
	if(document.user.email.options[document.user.email.selectedIndex].value == '1'){
		document.user.user_email2.disabled = false;
		document.user.user_email2.focus();
		document.user.user_email2.value = "";
	}
	else
		document.user.user_email2.disable = true;
		document.user.user_email2.value = document.user.email.options[document.user.email.selectedIndex].value;
}  */


</script>
<body>
<main id = "content" style="background-color: rgb(248,248,248);">
	<div class = "mypage_set">
		<div class="Mypage_Main">
			<div class="Menu_section">
				<div class="Menu__profile">
					<div class="Profiles_image">
						<c:if test="${img_sub eq 'null'}">
						<img class = "profile_img" src="<%=context%>/images/vector_profile_default.svg" style="vertical-align:middle;">
						</c:if>
						<c:if test="${img_sub ne 'null'}">
						<img class = "profile_img" src="<%=context%>/${member.user_img}" style="vertical-align:middle;">
						</c:if>
						<span class = "user_id">	
						<c:if test="${user_id != null}">
							${user_id }
						</c:if>
						</span>
					</div>
				</div>
				<div class = "menu_link">
					<ul class="mypage_menu">
						<li class="link_mypage_userinfo">
							<a class="link index_link" href="<%=context%>/mypageUpdate.do">
								<span class="mypage_name" id = "my_side">계정관리</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageTraveler.do">
								<span class="mypage_name">내 동행게시글</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageCommunity.do">
								<span class="mypage_name">내 커뮤니티글</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageBoard.do">
								<span class="mypage_name">내 게시글</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageComment.do">
								<span class="mypage_name">내 코멘트</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 각 화면이 달라지는 부분 -->
			<div class="content_section">
				<h2 class = "mypage_menu_h2">계정관리<span class="user_out"><button class="user_out_button" onclick = "location.href='idDeleteForm.do'">회원탈퇴</button></span></h2>
				<div class = "user_updateinfo_main">
					<div class = "image_insert">
						<c:if test="${img_sub eq 'null'}">
							<span><img id="target_img" src="<%=context%>/images/vector_profile_default.svg"></span>
						</c:if>
						<c:if test="${img_sub ne 'null'}">
							<span><img id="target_img" src="<%=context%>/${img}" width = "200px"></span>
						</c:if>
					</div>
					<form name = "frm" action="<%=context %>/mypageUpdatePro.do" method="post" enctype="multipart/form-data" onsubmit="return disableOff()">
						<input type="file" id = "profile" name = "profile" style= "display:none;" onchange="readURL(this);">
						<input type = "hidden" name ="target_url">
						<h3 class = "mypage_menu_h3">소개글</h3>
						<textarea class="input_user" id = "user_info"  name = "user_info"
						placeholder="소개글을 입력해주세요(1000자 이내)" cols="50" rows="10">${member.user_info }</textarea>
						<%-- <input type="text" class="input_user" id = "user_info" name = "user_info" value = "${member.user_info }"
							placeholder="소개글을 입력해주세요(1000자 이내)"> --%>
						<h3 class = "mypage_menu_h3">생년월일</h3>
						<input type="date" class="input_user" id = "user_birth" name = "user_birth" value ="${member.user_birth }" oninput="autoHypehen1(this)" maxlength = 10>
						<h3 class = "mypage_menu_h3">핸드폰</h3>
						<input type="text" class="input_user" id = "user_tel" name = "user_tel" value ="${member.user_tel }" oninput="autoHyphen2(this)" maxlength="13">
						<h3 class = "mypage_menu_h3">이메일</h3>
						<input type="text" class="input_email" id = "user_email" name = "user_email1" value ="${fn:split(member.user_email,'@')[0]}">@
						<input type="text" class="input_email" name = "user_email2" disabled>
							<select id = "eMailForm" name = "eMailForm" onchange="email_check()">
							  <option value = "${fn:split(member.user_email,'@')[1]}"></option>
							  <option value = "1">직접입력하세요</option>
							  <option value="naver.com" 	
							  	<c:if test = "${fn:split(member.user_email,'@')[1] eq 'naver.com'}"> selected </c:if>>naver.com</option>
							  <option value="google.com" 	
							  	<c:if test = "${fn:split(member.user_email,'@')[1] eq 'google.com'}"> selected </c:if>>google.com</option>
							  <option value="hanmail.net"	
							  	<c:if test = "${fn:split(member.user_email,'@')[1] eq 'hanmail.net'}"> selected </c:if>>hanmail.net</option>
							  <option value="nate.com"
							  	<c:if test = "${fn:split(member.user_email,'@')[1] eq 'nate.com'}"> selected </c:if>>nate.com</option>
							  <option value="kakao.com"
							  	<c:if test = "${fn:split(member.user_email,'@')[1] eq 'kakao.com'}"> selected </c:if>>kakao.com</option>
							  <option value="icloud.com"
							  	<c:if test = "${fn:split(member.user_email,'@')[1] eq 'icloud.com'}"> selected </c:if>>icloud.com</option>
							</select>
							<div class = "submitMain">
								<input type="submit" id = "submit" value = "수정완료">
							</div>
					</form>	
				<button class="pw_search" onclick = "passwordUpdate()">비밀번호수정</button>
					<form action="<%=context %>/pwUpdate.do" name = "pw" method="post">
						<input type="password" id = "oldPassword" name = "pass1" placeholder = "현재 비밀번호를 입력하세요"><br>
						<input type="password" id = "newPassword1" name = "pass2" placeholder="변경한 비밀번호를 입력하세요">
						<input type="password" id = "newPassword2" name = "pass3" placeholder="변경할 비밀번호를 다시 입력하세요"><br>
						<input type="submit" id = "newPassword3" value = "비밀번호 수정완료" onclick="fn_submit();return false;">
					</form>
				</div>
			</div>
		</div>
	</div>
</main>
<footer class="py-5 bg-dark" style="top : 180%;">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2022</p>
	</div>
</footer>
</body>
</html>