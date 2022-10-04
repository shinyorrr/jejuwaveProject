<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<!-- Main 이미지 -->
		<main class="main_page">
			<div class="magin_image_box mibox">
				<img class="main_img" src="images/main.jpg">
			</div>
			<!-- Section-->
			<section class="py-1">
				<div class="container px-4 px-lg-5 mt-3">

					<div
						class="row gx-4 gx-lg-3 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
						<c:if test="${totCnt > 0}">
							<c:forEach var="travel" items="${travelList}">
								<c:if test="${travel.t_relevel == 0}">

									<div class="col mb-5">
										<div class="card h-70" style="cursor: pointer;"
											onclick="location.href='travelContent.do?t_num=${travel.t_num}&pageNum=${currentPage}';">


											<!-- Content 이미지-->
											<div id="pic">

												<img src="<%=context %>${travel.t_img}"
													class="card-img-top" />

											</div>


											<!-- Content details-->
											<div class="card-body p-4">
												<div class="text-left">
													<!-- Content text-->
													<p class="fw-bolder" id="title">
														<c:choose>
															<c:when test="${travel.t_dealstatus == 0}">
																<b style="color: #ff3500; width: 64px;">모집중</b>&nbsp&nbsp
												</c:when>
															<c:otherwise>
																<b style="color: #A6A6A6; width: 64px;">모집완료</b>&nbsp&nbsp
												</c:otherwise>
														</c:choose>


														<!-- 제목 짜르기 -->
														<span> <c:choose>
																<c:when test="${fn:length(travel.t_title) > 12}">
																	<c:out value="${fn:substring(travel.t_title,0,11)}" />...
												</c:when>
																<c:otherwise>
																	<c:out value="${travel.t_title}" />
																</c:otherwise>
															</c:choose>
														</span>
													</p>

													<!-- 본문 짜르기 -->

													<p id="content">
														<c:choose>
															<c:when test="${fn:length(travel.t_content) > 35}">
																<c:out value="${fn:substring(travel.t_content,0,34)}" />...
												</c:when>
															<c:otherwise>
																<c:out value="${travel.t_content}" />
															</c:otherwise>
														</c:choose>
													</p>

													<p id="IdComment">
														<img src="yn_images/user_icon01.png" width="20"
															height="20" style="margin: 0 5px 6px 0;"
															class="userIconColor-1 rounded-circle me-2  align-center ">
														${travel.user_id}

														<!-- 댓글개수 -->

														<c:if test="" var="commCnt"></c:if>
														<span id="comment"> <img
															style="width: 16px; height: 16px; margin: 0 5px;"
															src="yn_images/comm_icon.png">${travel.reply_cnt}
														</span>
													</p>
												</div>
											</div>
										</div>
									</div>

								</c:if>
								<c:set var="startNum" value="${startNum -1}" />
							</c:forEach>
						</c:if>
					</div>
					<!-- paging section-->

				</div>
			</section>
			<!-- Notice board section -->
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
								<b style="color: #ff3500;"><a href='qnaWriteCheck.do?b_num=${board.b_num}' style="color: #ff3500;">
								<c:choose>
									<c:when test="${fn:length(board.b_title) > 40}">
										<c:out value="${fn:substring(board.b_title,0,39)}" />...
									</c:when>
									<c:otherwise>
										<c:out value="${board.b_title}"/>
									</c:otherwise>
								</c:choose>
								</a></b>
							</p>
							<p>
								<c:choose>
									<c:when test="${fn:length(board.b_content) > 40 }">
										<c:out value="${fn:substring(board.b_content,0,39)}" />...
								</c:when>
									<c:otherwise>
										<c:out value="${board.b_content}" />
									</c:otherwise>
								</c:choose>
							</p>
							<p id="IdComment">
								<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;"
									src="images/tangerine.png">${board.user_id}
							</p>
						</div>
					</c:forEach>
				</div>
				<!-- 날씨 API -->
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
						<span style="position: relative; padding: 10px 0px 200px 60px; font-weight: bolder;">주간
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