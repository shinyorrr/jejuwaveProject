<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
<c:import url="${context}/header.jsp"></c:import>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR+Ligth:wght@300;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageInsert.css?after">
</head>
<script type="text/javascript" src = "<%=context%>/js/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#target_img').on('click', function() {
	    $('#profile').trigger('click');
	});
});


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



const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}


</script>
<body>
<main id = "content" style="background-color: rgb(248,248,248);">
	<div class = "mypage_set">
		<div class="Mypage_Main">
			<div class="Menu_section">
				<div class="Menu__profile">
					<div class="Profiles_image">
						<c:if test="${member.user_img == null}">
						<img class = "profile_img" src="<%=context%>/images/vector_profile_default.svg" style="vertical-align:middle;">
						</c:if>
						<c:if test="${member.user_img != null}">
						<img class = "profile_img" src="<%=context%>${member.user_img}" style="vertical-align:middle;">
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
								<span class="mypage_name">계정관리</span>
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
				<h2 class = "mypage_menu_h2">계정관리<span class="user_out"><button class="user_out_button" onclick = "location.href='user_out.jsp'">회원탈퇴</button></span></h2>
				<div class = "user_updateinfo_main">
					<div class = "image_insert">
						<c:if test="${member.user_img == null}">
							<span><img id="target_img" src="<%=context%>/images/vector_profile_default.svg"></span>
						</c:if>
						<c:if test="${member.user_img != null}">
							<span><img id="target_img" src="<%=context%>${member.user_img}" width = "200px"></span>
						</c:if>
					</div>
					<form name = "user" action="<%=context %>/mypageUpdatePro.do" method="post" enctype="multipart/form-data">
						<input type="file" id = "profile" name = "profile" style= "display:none;" onchange="readURL(this);">
						<input type = "hidden" name ="target_url">
						<h3 class = "mypage_menu_h3">소개글</h3>
						<textarea class="input_user" id = "user_info"  name = "user_info"
						placeholder="소개글을 입력해주세요(1000자 이내)" cols="50" rows="10">${member.user_info }</textarea>
						<%-- <input type="text" class="input_user" id = "user_info" name = "user_info" value = "${member.user_info }"
							placeholder="소개글을 입력해주세요(1000자 이내)"> --%>
						<h3 class = "mypage_menu_h3">생년월일</h3>
						<input type="text" class="input_user" id = "user_birth" name = "user_birth" value ="${member.user_birth }">
						<h3 class = "mypage_menu_h3">핸드폰</h3>
						<input type="text" class="input_user" id = "user_tel" name = "user_tel" value ="${member.user_tel }" oninput="autoHyphen2(this)" maxlength="13">
						<h3 class = "mypage_menu_h3">이메일</h3>
						<input type="text" class="input_user" id = "user_email" name = "user_email" value ="${member.user_email }"><p>
						<div class = "submitMain">
							<input type="submit" id = "submit" value = "수정완료">
							<button class="pw_search" onclick = "location.href='userPassword.jsp'">비밀번호찾기</button>
						</div>
					</form>	
				</div>
			</div>
		</div>
	</div>
</main>
<footer class="py-5 bg-dark" style="top : 125%;">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2022</p>
	</div>
</footer>
</body>
</html>