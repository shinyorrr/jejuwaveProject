<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
String context = request.getContextPath();
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/header_content.css">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
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
<script src="js/index.js" defer="defer"></script>
</head>
<body>
	<header id="header" class="Headers_HeaderMainHeader burgkU">
		<div class="Headers__InnerSection bQvPOR">
			<div class="Headers__HeaderTopWrapDiv kKJwFS">
				<div class="Headers_HeaderTopInnerDiv cMXtHR">
					<img src="images/brand_logo.png" alt="logo"
						class="WebHeader_LogoImg hsELiP"
						onClick="location.href='<%=context%>/main.do'">
				</div>
				<div class="Button__ButtonWrapper-sc-1vcxcg6-0 oIYRb">
					<button class="user-imfo usImfo">
						<c:if test="${img ==null }">
							<img src="<%=context%>/images/vector_profile_default.svg"
								style="vertical-align: middle; width: 50px; height: 50px; border-radius: 60%;">
						</c:if>
						<c:if test="${img != null }">
							<img src="<%=context%>${img}"
								style="vertical-align: middle; width: 50px; height: 50px; border-radius: 60%;">
						</c:if>
						<img src="images/form_arrow_black_fill.svg">
					</button>
					<div class="header-mypage-logout">
						<div style="display: flex; border-bottom: 1px solid #dfdfdf;">
							<button onClick="location.href='<%=context%>/mypageUpdate.do'"
								class="header-mypage" style="display: flex;">
								<div class="header-mypage-icon">
									<c:if test="${img == null }">
										<img src="<%=context%>/images/vector_profile_default.svg"
											style="vertical-align: middle; width: 38px; height: 38px; border-radius: 60%; margin: 10px 0px 0px 15px;">
									</c:if>
									<c:if test="${img != null }">
										<img src="<%=context %>${img}"
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
			</div>
		</div>
	</header>
</body>
</html>