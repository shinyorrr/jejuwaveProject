<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<%
String context = request.getContextPath();
%>
<c:import url="header.jsp" />
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
<!-- 날씨 API JQUERY -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	// 현재 날씨
	$
			.getJSON(
					'https://api.openweathermap.org/data/2.5/weather?lat=33.5097&lon=126.5219&appid=6a893cd9f6fd12f3a0920aa11a2462c7&units=metric',
					function(result) {
						var ctemp = result.main.temp;
						$('.ctemp').append(ctemp.toFixed(1) + '°C');

						var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+ result.weather[0].icon +'.png" alt="' + result.weather[0].description+'">'
						$('.icon').html(wiconUrl);

						var ct = result.dt;

						function converntTime(t) {
							var ot = new Date(t * 1000);
							var dt = ot.getDate();
							var hr = ot.getHours();
							var m = ot.getMinutes();

							return dt + '일' + hr + '시' + m + '분'
						}
						var currentTime = converntTime(ct);
						$('.time').append(currentTime);
					});
	// 주간 날씨
	$
			.getJSON(
					'https://api.openweathermap.org/data/2.5/forecast?lat=33.5097&lon=126.5219&appid=6a893cd9f6fd12f3a0920aa11a2462c7&units=metric',
					function(result) {

						for (var i = 0; i < 40; i++) {
							if (i % 8 == 0) {

								var ctime = result.list[i].dt;
								var ctemp = result.list[i].main.temp;

								function converntTime(t) {
									var ot = new Date(t * 1000);
									var dt = ot.getDate();
									/* var ht = ot.getHours(); */
									return dt + '일'
								}
								var currentTime = converntTime(ctime);
								var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+ result.list[i].weather[0].icon +'.png" alt="' + result.list[i].weather[0].description+'">'

								var tableHtml = '<div>' + '<div>' + currentTime
										+ '</div>' + '<br>' + '<div>'
										+ wiconUrl + '</div>' + '<br>'
										+ '<div>' + ctemp.toFixed(1) + '°C'
										+ '</div>' + '</div>';
								$('.week').append(tableHtml);
							}
						}

					});
</script>
</head>
<body>
	<div class="wrapper">
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
						<a href="<%=context%>/qnaList.do">여행정보 공유해요!</a>
					</div>
					<c:forEach var="board" items="${list }">
						<div class="content_first">
							<!-- Content text-->
							<p class="" id="">
								<b style="color: #ff3500;">${b_title}</b>
							</p>
							<p>${b_content}</p>
							<p id="IdComment">
								<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
									src="images/tangerine.png">{user_id}
							</p>
						</div>
					</c:forEach>
				</div>

				<div class="weather">
					<div
						style="font-weight: bold; position: relative; width: 33%; padding-top: 15px;">
						제주날씨</div>
					<div class="today"
						style="display: flex; align-items: center; padding-left: 60px; padding-top: 20px;">

						<div class="icon"></div>
						<div class="ctemp"></div>
					</div>
					<div class="week" id="weather_result"
						style="display: flex; justify-content: space-between; width: 90%; min-height: 255px; align-items: center; padding-right: 10px;">
						<span style="position: relative; padding: 10px 0px 200px 60px;">주간
							날씨</span>
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