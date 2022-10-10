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
<!-- google font -->
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
<!-- fontawesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

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
				<div class="Headers__HeaderTopInnerDiv-sc-1la7hl4-3 dnYUeR">
					<div class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
						<span class="CommonIconSet QjNCN"></span>
						<button type="submit" onclick="searchTravel()"></button>
						<input id = "searchTravelCont" type="text" placeholder="동행을 찾아보세요!"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '동행을 찾아보세요!'" required />
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
								<a href="<%=context%>/joinForm.do">회원가입</a>
							</button>
						</div>
					</c:if>
					<!-- 로그인 상태 -->
					<c:if test="${user_id !=null }">
						<div class="Button__ButtonWrapper-sc-1vcxcg6-0 oIYRc">
							<button class="user-imfo usImfo">
								<c:if test="${img ==null }">
									<img src="<%=context%>/images/vector_profile_default.svg"
										style="vertical-align: middle; width: 50px; height: 50px; border-radius: 60%;">
								</c:if>
								<c:if test="${img != null }">
									<img src="<%=context%>/${img}"
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
					</c:if>
				</div>
				<div class="Button_dropdown oIYRb">
					<button width="100px" height="40px" font-style="" type="button"
						class="ButtonStyle kRVxKH">글쓰기</button>
					<div class="Popups__HeaderWritePopupDiv cymdDn">
						<button onClick="location.href='<%=context%>/travelWrite.do'"
							class="Popups__HeaderWritePopupOptionButton-sc-1socb7k-1 cAHljB">
							<img src="images/tw/letter_color.svg" alt="이미지"
								style="width: 33px; height: 24px;">
							<p>여행친구 찾기</p>
						</button>
						<button onclick="location.href='<%=context%>/qnaWriteForm.do'"
							class="Popups__HeaderWritePopupOptionButton-sc-1socb7k-1 cAHlmB">
							<img src="images/tw/magnifier_color.svg" alt="이미지"
								style="width: 33px; height: 24px;">
							<p>여행 질문하기</p>
						</button>
						<button onclick="location.href='<%=context%>/commuWriteForm.do'"
							class="Popups__HeaderWritePopupOptionButton-sc-1socb7k-1 cAHlmB">
							<img src="images/tw/history.png" alt="이미지"
								style="width: 33px; height: 24px;">
							<p>여행 기록하기</p>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="Headers__HeaderContentWrapper iEbwCp">
			<button width="auto" font-size="16px" font-weight="bold"
				class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 leGRAZ"
				onClick="location.href='<%=context%>/main.do'">홈</button>
			<button width="auto" font-size="16px" font-weight="400"
				class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdv"
				onClick="location.href='<%=context%>/travelListForm.do'">동행</button>
			<button width="auto" font-size="16px" font-weight="400"
				class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdc"
				onClick="location.href='<%=context%>/qnaList.do'">Q&amp;A</button>
			<button width="auto" font-size="16px" font-weight="400"
				class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdf"
				onClick="location.href='<%=context%>/commuList.do'">여행 기록</button>
		</div>
	</header>
</body>
<script type="text/javascript">
//조회조건 엔터시 바로 조회
function searchTravel() {
	
	let searchTravelCont = $('#searchTravelCont').val()
	alert(searchTravelCont);
	
	$.ajax({    type : 'post',           // 타입 (get, post, put 등등)   
				url : './ajax',           // 요청할 서버url         
			    dataType : 'text',       // 데이터 타입 (html, xml, json, text 등등)    
				data : JSON.stringify({ "searchTravelCont" : searchTravelCont}),     // 보낼 데이터 (Object , String, Array)
				success : function(result) { // 결과 성공 콜백함수        
				console.log(result);    
				},    
				error : function(request, status, error) { // 결과 에러 콜백함수       
				console.log(error)    
				}})
}


</script>
</html>