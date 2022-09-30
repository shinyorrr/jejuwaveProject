<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String context = request.getContextPath();%>
<c:import url="${context}/yn/header.jsp"></c:import>

	<link rel="stylesheet" href="fonts/icomoon/style.css">
	<link rel="stylesheet" href="css/classic.css">
	<link rel="stylesheet" href="css/classic.date.css">

    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 내 css -->
	<link rel="stylesheet" href="css/trList.css">
	
	
	
	
<!------------------ body 영역 ------------> 	
<div style="margin-top: 148px;"></div>

        <!-- Header-->
<header class="py-5 mb-5" style="background-image: url('../yn_images/travelerList_cate.jpg'); background-size: cover; margin-top:73px;">
	<div class="container px-4 px-lg-5 mt-5 mb-5" >
		<div class="text-center text-white">
			<h3 class="display-5 fw-bolder">동행자게시판</h3>
			<p class="lead fw-normal text-white-50 mb-0">함께해요 제주</p>
		</div>
	</div>
</header>

<!-- 동행자 검색 --> 
<div class="container text-left  px-4 px-lg-5 mt-5">
	
	<div class="row mt-5 mb-3">
		<div class="col-lg-6 col-sm-12 text-lg-start">
			<form action="#" class=" form-inline">
				<span class="me-4">&nbsp&nbsp날짜 선택</span>
				<div class="col-lg-5 text-lg-start" style="width:240px;">
					<input name="t_start" type="text" class="form-control me-2" id="input_from" placeholder="시작 날짜">
				</div>-
				<div class="col-lg-5 text-lg-end" style="width:240px;">
					<input name="t_end" type="text" class="form-control ms-4" id="input_to" placeholder="종료 날짜">
				</div>
			</form>
		</div>
		<div class="col-lg-6 col-sm-12 text-lg-end">
			<div id="serchFilter" class=" mb-4">
				<button name="t_gubun" value="전체" type="button" class="btn mx-1">전체	</button>
				<button name="t_gubun" value="숙박" type="button" class="btn mx-1">숙박	</button>
				<button name="t_gubun" value="레저" type="button" class="btn mx-1">레저	</button>
				<button name="t_gubun" value="맛집" type="button" class="btn mx-1">맛집	</button>
				<button name="t_gubun" value="카풀" type="button" class="btn mx-1">카풀	</button>
				<div id="filter">
				<button class="btn ms-3 px-3 me-0" id="filterBtn" style="width:105px;">검색</button>
				</div>
			</div>
			<div id="filter">
			<button class="btn px-4" id="filterBtn" style="margin-bottom:3px; border-radius: 20px;">모집중인 글 보기</button>
			</div>
		</div>
	</div>
</div>


	<!-- Section-->
<section class="py-1">
	<div class="container px-4 px-lg-5 mt-3">

		<div class="row gx-4 gx-lg-3 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
		<c:if test="${totCnt > 0}">
			<c:forEach var="tv" items="${travel}">
			
			
			
			<div class="col mb-5">
				<div class="card h-70">
					<!-- Content image-->
					<div id="pic">
					<img class="card-img-top" src="../yn_images/jejuCar03.jpg" alt="..." />
					</div>
					<!-- Content details-->
					<div class="card-body p-4">
						<div class="text-left">
							<!-- Content text-->
							<p class="fw-bolder" id="title"><b style="color:#ff3500;">모집중</b>&nbsp&nbsp
							<span>${travel.t_title}</span></p>
							<p id="content">${travel.t_content}</p>
							<p id="IdComment">
							<img style="width: 20px; height: 20px; margin: 0 5px 6px 0;" src="../yn_images/tangerine.png">
							${travel.user_id}<span id="comment">
							<img style="width: 16px; height: 16px;"src="../yn_images/comm_icon.png">11</span></p> <!-- 댓글개수 -->
						</div>
					</div>
				</div>
			</div>
			<c:set var="startNum" value="${startNum -1}"/>
			</c:forEach>
		</c:if>  
		   
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan="7"> 데이터가 없네</td>
			</tr>
		</c:if>  
                 
                </div>
                <!-- paging section-->
			<nav aria-label="Page navigation example" class="d-flex justify-content-center">
				<ul class="pagination">
				  <c:if test="${startPage > blockSize}">
				    <li class="page-item">
				      <a class="page-link" href='TravelListForm.do?pageNum=${startPage-blockSize}' aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  </c:if>
				  <c:forEach var="i" begin="${startPage }" end="${endPage }">
				    <li class="page-item"><a class="page-link" href='TravelListForm.do?pageNum=${i}'>${i}</a></li>
				    </c:forEach>
				    <c:if test="${endPage < pageCnt}">
					    <li class="page-item">
					      <a class="page-link" href='TravelListForm.do?pageNum=${startPage+blockSize}' aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</section>

<div style="margin-top: 200px;"></div>
<%@ include file="footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
        
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/picker.js"></script>
    <script src="js/picker.date.js"></script>

	<script src="js/main.js"></script>
