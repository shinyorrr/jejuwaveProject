<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String context = request.getContextPath();
%>
<c:import url="../header.jsp"></c:import>
<c:import url="${context}/header.jsp"></c:import>
<link rel="stylesheet" href="yncss/trList.css" type="text/css">


<!------------------ body 영역 ------------>

<!-- Header-->
<header class="py-5 mb-5"
		style="background-image: url('images/travelerList_cate.jpg'); background-size: cover; margin-top:148px;">
	<div class="container px-4 px-lg-5 mt-5 mb-5">
		<div class="text-center text-white">
			<h3 class="display-5 fw-bolder">동행자 게시판</h3>
			<p class="lead fw-normal text-white-40 mb-0">동행과 함께하는 제주</p>
		</div>
	</div>
</header>

<!-- 동행자 검색 -->
<div class="container text-left  px-4 px-lg-5 mt-5">

	<div class="row mt-5 mb-3">
	
		<div class="col-lg-6 col-sm-12 text-lg-start">
			<form action="#" class=" form-inline">
				<span class="fw-bold align-middle me-5">날짜 선택</span>
		  			
				<div class="  my-0 mx-0 px-0" style="display:inline;">
					<input oninput="getStartDate()" name="t_start" type="date" class="me-0" id="input_from" placeholder="시작 날짜" style="width:38%; height:34px;">
					-
					<input name="t_end" type="date" class=" ms-0" id="input_to" placeholder="종료 날짜" style="width:38%;height:34px;">
				</div>
			</form>
		</div>
		<div class="col-lg-6 col-sm-12 text-lg-end">
			<div id="serchFilter" class=" mb-4">
				<button name="t_gubun" value="전체" type="button" class="btn mx-1">전체
				</button>
				<button name="t_gubun" value="숙박" type="button" class="btn mx-1">#숙박
				</button>
				<button name="t_gubun" value="레저" type="button" class="btn mx-1">#레저
				</button>
				<button name="t_gubun" value="맛집" type="button" class="btn mx-1">#맛집
				</button>
				<button name="t_gubun" value="카풀" type="button" class="btn mx-1">#카풀
				</button>
				<div id="filter">
					<button class="btn ms-3 px-3 me-0" id="filterBtn" style="width: 105px;">검색</button>
				</div>
			</div>
			<div id="filter">
				<button class="btn px-4" id="filterBtn_BF" onclick="dealStatusFilter()"
					style="margin-bottom: 3px; border-radius: 30px; padding:8px;
							border: solid #4C4C4C 2px;	font-weight: bold;">모집중인 글 보기</button>
			</div>
		</div>
	</div>
</div>


<!-- Section-->
<section class="py-1">
	<div class="container px-4 px-lg-5 mt-3">

		<div class="row gx-4 gx-lg-3 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
			<c:if test="${totCnt > 0}">
				<c:forEach var="travel" items="${travelList}">
					<c:if test="${travel.t_relevel == 0}">

						<div class="col mb-5">
							<div class="card h-70" style=" cursor: pointer;" 
								 onclick="location.href='travelContent.do?t_num=${travel.t_num}&pageNum=${currentPage}';">
									
									
								<!-- Content 이미지-->
								<div id="pic">
									<img src="${travel.t_img}" class="card-img-top" />
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
											<span>
												<c:choose>
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
											<img src='${travel.user_img}' width="20" height="20"
												style="margin: 0 5px 2px 0;"
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

			<c:if test="${totCnt == 0 }">
				<tr><td colspan="7">데이터가 없네</td></tr>
			</c:if>

		</div>
		<!-- paging section-->
		<nav aria-label="Page navigation example"
			class="d-flex justify-content-center">
			<ul class="pagination">
				<c:if test="${startPage > blockSize}">
					<li class="page-item"><a class="page-link"
						href='travelListForm.do?pageNum=${startPage-blockSize}'
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li class="page-item"><a class="page-link"
						href='travelListForm.do?pageNum=${i}'>${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<li class="page-item"><a class="page-link"
						href='travelListForm.do?pageNum=${startPage+blockSize}'
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>
</section>

<div style="margin-top: 200px;"></div>
<%-- <%@ include file="footer.jsp"%> --%>
<c:import url="${context}/footer.jsp"></c:import>
<!-- Bootstrap core JS-->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="yncss/popper.min.js"></script>
<script src="yncss/bootstrap.min.js"></script>
<script type="text/javascript" src="yncss/trList.js"></script>
