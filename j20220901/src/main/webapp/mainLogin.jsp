<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- Style -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/TrList.css">
<link rel="stylesheet" href="css/header_main.css">
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


</head>
<%
	String context = request.getContextPath();
%>
<body>
	<div class="wrapper">
		<header id="header" class="Headers_HeaderMainHeader burgkU">
			<div class="Headers__InnerSection bQvPOR">
				<div class="Headers__HeaderTopWrapDiv kKJwFS">
					<div class="Headers_HeaderTopInnerDiv cMXtHR">
						<img src="images/brand_logo.png" alt="logo"
							class="WebHeader_LogoImg hsELiP"
							onClick="location.href='<%= context%>/main.do'">
					</div>
					<div class="Headers__HeaderTopInnerDiv-sc-1la7hl4-3 dnYUeR">
						<div width="300px"
							class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
							<span
								class="CommonIconSet__InitialIcon-sc-15eoam-0 CommonIconSet__MagnifierGrayIconContent-sc-15eoam-1 jZNHYY QjNCN"></span>
							<button></button>
							<input placeholder="동행을 찾아보세요!" value="">
						</div>
						<div class="Button__ButtonWrapper-sc-1vcxcg6-0 oIYRb">
							<button class="user-imfo usImfo">
								<img src="images/vector_profile_default.svg"
									style="vertical-align: middle;">
							</button>
							<div class="header-mypage-logout">
								<div style="display: flex; border-bottom: 1px solid #dfdfdf;">
									<button onClick="location.href='<%= context %>/mypageUpdate.do'"
										class="header-mypage">
										<p>${user_id }</p>
										<p style="margin-left: 50px;">마이페이지</p>
									</button>
								</div>
								<div>
									<button onclick="location.href='<%= context%>/tw/logout.jsp'"
										class="header-logout">
										<p style="margin-bottom: 0px; margin-top: 15px;">로그아웃</p>
									</button>
								</div>
							</div>
						</div>
						<div class="Button_dropdown oIYRb">
							<button width="100px" height="40px" font-style="" type="button"
								class="ButtonStyle kRVxKH">글쓰기</button>
							<div class="Popups__HeaderWritePopupDiv cymdDn">
								<button onClick="location.href='content.jsp'"
									class="Popups__HeaderWritePopupOptionButton-sc-1socb7k-1 cAHljB">
									<img src="images/letter_color.svg" alt="이미지"
										style="width: 33px; height: 24px;">
									<p>여행친구 찾기</p>
								</button>
								<button onclick="location.href='list.jsp'"
									class="Popups__HeaderWritePopupOptionButton-sc-1socb7k-1 cAHlmB">
									<img src="images/magnifier_color.svg" alt="이미지"
										style="width: 33px; height: 24px;">
									<p>여행 질문하기</p>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="Headers__HeaderContentWrapper-sc-1la7hl4-4 iEbwCp"
					style="justify-content: flex-start; margin: 0px 12px;">
					<button width="auto" font-size="16px" font-weight="bold"
						class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 leGRAZ"
						onClick="location.href='main.do'">홈</button>
					<button width="auto" font-size="16px" font-weight="400"
						class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdv"
						onClick="location.href='content.jsp'">동행</button>
					<button width="auto" font-size="16px" font-weight="400"
						class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdc"
						onClick="location.href='#.jsp'">Q&amp;A</button>
					<button width="auto" font-size="16px" font-weight="400"
						class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdc"
						onClick="location.href='commuList.do'">여행 기록</button>
				</div>
			</div>
		</header>
		<!-- Section-->
		<main class="main_page">
			<div class="magin_image_box mibox">
				<img class="main_img" src="images/main.jpg">
			</div>
			<section class="py-1">
				<div class="container px-4 px-lg-5 mt-5">
					<div
						class="row gx-4 gx-lg-3 row-cols-2 row-cols-md-3 row-cols-xl-4 ">

						<div class="col mb-5">
							<div class="card h-70">
								<!-- Content image-->
								<div id="pic">
									<img class="card-img-top" src="images/jeju01.jpg" alt="..." />
								</div>
								<!-- Content details-->
								<div class="card-body p-4">
									<div class="text-left">
										<!-- Content text-->
										<p class="fw-bolder" id="title">
											<b style="color: #ff3500;">모집중</b>&nbsp&nbsp제주도 동행 구해요~ 15일날
											애월에서 서핑해요
										</p>
										<p id="content">남2 여1 동행하려고 대기중입니다. 다들 초면이고 여성분은 혼자셔서 이왕이면
											여성분끼리 어울릴수 있게 되었으면 해서 같이 동행하실 여성분 있으실까 해서 글 올려봅니다.</p>
										<p id="IdComment">
											<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
												src="images/tangerine.png">kk2k2 <span id="comment"><img
												style="width: 16px; height: 16px;"
												src="images/comm_icon.png">11</span>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="col mb-5">
							<div class="card h-70">
								<!-- Content image-->
								<div id="pic">
									<img class="card-img-top" src="images/jeju02.jpg" alt="..." />
								</div>
								<!-- Content details-->
								<div class="card-body p-4">
									<div class="text-left">
										<!-- Content text-->
										<p class="fw-bolder" id="title">
											<b style="color: #ff3500;">모집중</b>&nbsp&nbsp제주도 동행 구해요~ 15일날
											애월에서 서핑해요
										</p>
										<p id="content">남2 여1 동행하려고 대기중입니다. 다들 초면이고 여성분은 혼자셔서 이왕이면
											여성분끼리 어울릴수 있게 되었으면 해서 같이 동행하실 여성분 있으실까 해서 글 올려봅니다.</p>
										<p id="IdComment">
											<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
												src="images/tangerine.png">kk2k2 <span id="comment"><img
												style="width: 16px; height: 16px;"
												src="images/comm_icon.png">11</span>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="col mb-5">
							<div class="card h-70">
								<!-- Content image-->
								<div id="pic">
									<img class="card-img-top" src="images/jeju03.jpg" alt="..." />
								</div>
								<!-- Content details-->
								<div class="card-body p-4">
									<div class="text-left">
										<!-- Content text-->
										<p class="fw-bolder" id="title">
											<b style="color: #ff3500;">모집중</b>&nbsp&nbsp제주도 동행 구해요~ 15일날
											애월에서 서핑해요
										</p>
										<p id="content">남2 여1 동행하려고 대기중입니다. 다들 초면이고 여성분은 혼자셔서 이왕이면
											여성분끼리 어울릴수 있게 되었으면 해서 같이 동행하실 여성분 있으실까 해서 글 올려봅니다.</p>
										<p id="IdComment">
											<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
												src="images/tangerine.png">kk2k2 <span id="comment"><img
												style="width: 16px; height: 16px;"
												src="images/comm_icon.png">11</span>
										</p>
									</div>
								</div>
							</div>
						</div>

						<div class="col mb-5">
							<div class="card h-70">
								<!-- Content image-->
								<div id="pic">
									<img class="card-img-top" src="images/jeju04.jpg" alt="..." />
								</div>
								<!-- Content details-->
								<div class="card-body p-4">
									<div class="text-left">
										<!-- Content text-->
										<p class="fw-bolder" id="title">
											<b style="color: #ff3500;">모집중</b>&nbsp&nbsp제주도 동행 구해요~ 15일날
											애월에서 서핑해요
										</p>
										<p id="content">남2 여1 동행하려고 대기중입니다. 다들 초면이고 여성분은 혼자셔서 이왕이면
											여성분끼리 어울릴수 있게 되었으면 해서 같이 동행하실 여성분 있으실까 해서 글 올려봅니다.</p>
										<p id="IdComment">
											<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
												src="images/tangerine.png">kk2k2 <span id="comment"><img
												style="width: 16px; height: 16px;"
												src="images/comm_icon.png">11</span>
										</p>
									</div>
								</div>
							</div>
						</div>
						<!--  <div class="col mb-5">
                        <div class="card h-70">
                            Content image
                            <div id="pic">
                            <img class="card-img-top" src="images/jeju08.jpg" alt="..." />
                            </div>
                            Content details
                            <div class="card-body p-4">
                                <div class="text-left">
                                    Content text
                                    <p class="fw-bolder" id="title"><b style="color:#ff3500;">모집중</b>&nbsp&nbsp제주도 동행 구해요~ 15일날 애월에서 서핑해요</p>
                                    <p id="content">남2 여1 동행하려고 대기중입니다. 다들 초면이고 여성분은 혼자셔서 이왕이면 여성분끼리 어울릴수 있게 되었으면 해서 같이 동행하실 여성분 있으실까 해서 글 올려봅니다.</p>
									<p id="IdComment"><img style="width: 20px; height: 20px; margin: 0 5px 6px 0;" src="images/tangerine.png">kk2k2 <span id="comment"><img style="width: 16px; height: 16px;"src="images/comm_icon.png">11</span></p>
                            	</div>
                            </div>
                        </div>
                    </div> -->
					</div>
					<!-- paging section-->
					<nav aria-label="Page navigation example"
						class="d-flex justify-content-center">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
				<!-- Notice board section -->
			</section>
			<section class="board">
				<div class="board_content">
					<div class="board_title"
						style="font-weight: bold; position: relative; width: 33%; margin-bottom: 15px;">
						<a href="list.jsp">여행정보 공유해요!</a>
					</div>
					<div class="content_first">
						<!-- Content text-->
						<p class="" id="">
							<b style="color: #ff3500;">숙박</b>
						</p>
						<p id="">제주 동쪽 숙박 추천받아요!</p>
						<p id="IdComment">
							<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
								src="images/tangerine.png">kkk2k
						</p>
					</div>
					<div class="content_second">
						<!-- Content text-->
						<p class="" id="">
							<b style="color: #ff3500;">레저</b>
						</p>
						<p id="">제주 동쪽 레저 추천받아요!</p>
						<p id="IdComment">
							<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
								src="images/tangerine.png">kkk3k
						</p>
					</div>
				</div>
				<div class="weather">
					<div style="font-weight: bold; position: relative; width: 33%;">
						제주날씨</div>
					<div id="weather_result"
						style="text-align: center; width: 80%; min-height: 255px; display: inline-block; border: 2px solid;">
					</div>
				</div>
			</section>
		</main>

	</div>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script src="js/index.js" defer="defer"></script>
</body>
</html>