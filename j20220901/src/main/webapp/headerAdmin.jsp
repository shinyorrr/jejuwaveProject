<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String context = request.getContextPath();
%>
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">
<!-- main css -->
	<link rel="stylesheet" id="chacss" href="css/header_main.css">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="images/tangerine.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/index2.js" defer="defer"></script>
<script type="text/javascript">
function chk() {
	location.href='<%=context%>/commuList.do';
	$('.cFXvdf').reomveClass('cFXvdf')
} 
</script>
</head>
<body>
	<header id="header" class="Headers_HeaderMainHeader burgkU">
		<div class="Headers__InnerSection bQvPOR">
			<div class="Headers__HeaderTopWrapDiv kKJwFS">
				<div class="Headers_HeaderTopInnerDiv cMXtHR">
					<img src="images/brand_logo.png" alt="logo"
						class="WebHeader_LogoImg hsELiP"
						onClick="location.href='<%=context%>/admain.do'">
				</div>
				<div class="Headers__HeaderTopInnerDiv-sc-1la7hl4-3 dnYUeR">
					<div class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
					</div>
					<!-- 비 로그인 상태 -->
					<c:if test="${user_id == null }">
						<div class="Button__ButtonWrapper-sc-1vcxcg6-0 oIYRa">
							<button type="button"
								class="Button__ButtonStyle-sc-1vcxcg6-1 eVZkjB">
								<a href="<%=context%>/login.do">로그인</a>
							</button>
							<button width="" height="" font-style="" type="button"
								class="Button__ButtonStyle-sc-1vcxcg6-1 jRRCxU">
								<a href="<%=context%>/joinForm.do ">회원가입</a>
							</button>
						</div>
					</c:if>
					<!-- 로그인 상태 -->
					<c:if test="${user_id !=null }">
						<div class="Button__ButtonWrapper-sc-1vcxcg6-0 oIYRc">
							<button class="user-imfo usImfo">
								<c:if test="${img_sub eq 'null' }">
									<img src="<%=context%>/images/vector_profile_default.svg"
										style="vertical-align: middle; width: 50px; height: 50px; border-radius: 60%;">
								</c:if>
								<c:if test="${img_sub ne 'null' }">
									<img src="<%=context%>/${img}"
										style="vertical-align: middle; width: 50px; height: 50px; border-radius: 60%;">
								</c:if>
								<img src="images/form_arrow_black_fill.svg">
							</button>
							<div class="header-mypage-logout">
								<div style="display: flex; border-bottom: 1px solid #dfdfdf;">
									<button onClick="location.href='<%=context%>/admain.do'"
										class="header-mypage" style="display: flex;">
										<div class="header-mypage-icon">
											<c:if test="${img == null }">
												<img src="<%=context%>/images/vector_profile_default.svg"
													style="vertical-align: middle; width: 38px; height: 38px; border-radius: 60%; margin: 10px 0px 0px 15px;">
											</c:if>
											<c:if test="${img != null }">
												<img src="<%=context %>/${img}"
													style="vertical-align: middle; width: 38px; height: 38px; border-radius: 60%; margin: 10px 0px 0px 15px;">
											</c:if>
										</div>
										<div style="text-align: left; margin-left: 15px;">
											<p style="margin-bottom: 5px;">${user_id }</p>
											<p style="font-size: 13px; color: #FF3500;">마이페이지 ></p>
										</div>
									</button>
								</div>
								<div>
									<button onclick="location.href='<%=context%>/tw/logout.jsp'"
										class="header-logout">
										<p style="margin-bottom: 0px; margin-top: 15px;">로그아웃</p>
									</button>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</header>
</body>
</html>