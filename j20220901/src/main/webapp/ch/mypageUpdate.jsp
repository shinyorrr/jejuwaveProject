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
<c:import url="${context}/headerLogin.jsp"></c:import>
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
						<img id="target_img" src="<%=context%>/images/vector_profile_default.svg">
						</c:if>
						<c:if test="${member.user_img != null}">
						<img id="target_img" src="<%=context%>${member.user_img}" width = "200px">
						</c:if>
					</div>
					<form name = "user" action="" method="post" enctype="multipart/form-data">
						<input type="file" id = "profile" name = "profile" style= "display:none;">
						<input type = "hidden" name ="target_url">
						<h3 class = "mypage_menu_h3">소개글</h3>
						<textarea class="input_user" id = "user_info" value = "${member.user_info } name = "user_info" 
						placeholder="소개글을 입력해주세요(1000자 이내)" cols="50" rows="10"></textarea>
						<%-- <input type="text" class="input_user" id = "user_info" name = "user_info" value = "${member.user_info }"
							placeholder="소개글을 입력해주세요(1000자 이내)"> --%>
						<h3 class = "mypage_menu_h3">생년월일</h3>
						<input type="text" class="input_user" id = "user_birth" name = "user_birth" value ="${member.user_birth }">
						<h3 class = "mypage_menu_h3">핸드폰</h3>
						<input type="text" class="input_user" id = "user_tel" name = "user_tel" value ="${member.user_tel }">
						<h3 class = "mypage_menu_h3">이메일</h3>
						<input type="text" class="input_user" id = "user_email" name = "user_email" value ="${member.user_email }"><p>
						<div class = "submit">
							<input type="submit" id = "submit" value = "수정완료">
						</div>
					</form>	
				</div>
				<button class="pw_search" onclick = "location.href='userPassword.jsp'">비밀번호찾기</button>
			</div>
		</div>
	</div>
<footer class="py-5 bg-dark" style="margin-top: 100px;">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2022</p>
	</div>
</footer>
</main>
</body>
</html>