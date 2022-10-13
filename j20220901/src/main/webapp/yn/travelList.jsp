<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
		<title>JejuWave 동행찾기</title>
	<%
	String context = request.getContextPath();
	%>
	<!------------------------- header 영역 ------------------------->
	<c:import url="${context}/header.jsp"></c:import>
	<link rel="stylesheet" href="yncss/trList.css" type="text/css">
</head>


<!--------------------------- body 영역 --------------------------->
<body style="color: #000000;">

<!------------------------ 동행자 카테고리 배너 ------------------------>
<header class="py-5" style="background-image: url('images/travelerList_cate.jpg'); vertical-align:middle; background-size: cover;
background-position: center;
 margin-top:148px; width: 100%;">
	<div class="container px-4 px-lg-5 mt-5 mb-5">
		<div  class="text-center">
			<h3 id="cateTextM" class="display-5 fw-bolder">동행자 게시판</h3>
			<p id="cateTextS"class="lead fw-normal text-white-40 mb-0">동행과 함께하는 제주</p>
		</div>
	</div>
</header>

<!---------------------------------------------------------------->
<!--------------------------- 동행자 검색 --------------------------->
<div class="container text-left  px-4 px-lg-5" ">

<!---------------------------- do 연결 ---------------------------->
	<form action="travelListForm.do">
		<div class="row mb-3" style="margin-top: 100px;">
		
		 	<!---------------------- 날짜 선택 --------------------->
			<div class="col-lg-6 col-sm-12 text-lg-start">
				<div class=" form-inline">
					<span class="fw-bold align-middle me-4">날짜 선택</span>
					<div class="  my-0 mx-0 px-0" style="display:inline;">
						<!---------------- 시작 날짜 ---------------->
						<input oninput="getStartDate()" name="t_start" type="date" class="me-0" id="input_from" 
							<c:if test="${t_start ne null}">value="${t_start}"
								</c:if>> &nbsp-&nbsp
						<!---------------- 종료 날짜 ---------------->
						<input name="t_end" type="date" class=" ms-0" id="input_to" 
							<c:if test="${t_end ne null}">value="${t_end}"</c:if>>
					</div>
				</div>
			</div>
			<!------------------------------------------------------>
			<!--------------------- 테마선택 필터 --------------------->
			<div class="col-lg-6 col-sm-12 text-lg-end">
				<div id="searchFilterGubun" class=" mb-4" style="padding-top: 1px;" >
				
					<!-------------- 구분 전체 -------------->
					<c:if test="${t_gubun1 eq null || t_gubun1 eq ''}">
						 <button type="button" id="t_gubun1" value="전체" class="btn ms-3" style="color:#000000;" onclick="gubunChk(1)" >전체</button>
					</c:if>
					<c:if test="${t_gubun1 eq 1}">
						<button type="button" id="t_gubun1" value="전체" class="btn ms-3" onclick="gubunChk(1)" style="color:#ff3500" >전체</button>
					</c:if>
						
					<!-------------- 구분 숙박 -------------->	
					<c:if test="${t_gubun2 eq null || t_gubun2 eq ''}">
						<button type="button" id="t_gubun2" value="숙박" class="btn ms-3" style="color:#000000;" onclick="gubunChk(2)">#숙박</button>
					</c:if>
					<c:if test="${t_gubun2 eq '숙박'}">
						<button type="button" id="t_gubun2" value="숙박" class="btn ms-3" onclick="gubunChk(2)" style="color:#ff3500">#숙박</button>
					</c:if>	
					
					<!-------------- 구분 레저 -------------->	
					<c:if test="${t_gubun3 eq null || t_gubun3 eq ''}">
						<button type="button" id="t_gubun3" value="레저" class="btn ms-3" style="color:#000000;" onclick="gubunChk(3)">#레저</button>
					</c:if>
					<c:if test="${t_gubun3 eq '레저'}">
						<button type="button" id="t_gubun3" value="레저" class="btn ms-3" onclick="gubunChk(3)" style="color:#ff3500">#레저</button>
					</c:if>	
					
					<!-------------- 구분 맛집 -------------->	
					<c:if test="${t_gubun4 eq null || t_gubun4 eq ''}">
						 <button type="button" id="t_gubun4" value="맛집" class="btn ms-3" style="color:#000000;" onclick="gubunChk(4)">#맛집</button>
					</c:if>
					<c:if test="${t_gubun4 eq '맛집'}">
						<button type="button" id="t_gubun4" value="맛집" class="btn ms-3" onclick="gubunChk(4)" style="color:#ff3500">#맛집</button>
					</c:if>	
					
					<!-------------- 구분 카풀 -------------->	
					<c:if test="${t_gubun5 eq null || t_gubun5 eq ''}">
						 <button type="button" id="t_gubun5" value="카풀" class="btn ms-3" style="color:#000000;" onclick="gubunChk(5)">#카풀</button>
					</c:if>
					<c:if test="${t_gubun5 eq '카풀'}">
						<button type="button" id="t_gubun5" value="카풀" class="btn ms-3" onclick="gubunChk(5)" style="color:#ff3500">#카풀</button>
					</c:if>	
				
					<!-------------- 구분 기타 -------------->	
					<c:if test="${t_gubun6 eq null || t_gubun6 eq ''}">
						 <button type="button" id="t_gubun6" value="기타" class="btn me-4 ms-3" style="color:#000000;" onclick="gubunChk(6)">#기타</button>
					</c:if>
					<c:if test="${t_gubun6 eq '기타'}">
						<button type="button" id="t_gubun6" value="기타" class="btn me-4 ms-3" onclick="gubunChk(6)" style="color:#ff3500">#기타</button>
					</c:if>	
					<c:choose>
						<c:when test="${gubun eq null || gubun eq ''}">
							<input type="hidden" name="t_gubun" id="gubun">
						</c:when>
						<c:otherwise>
							<input type="hidden" name="t_gubun" id="gubun" value="${gubun}">
						</c:otherwise>
					</c:choose>
					
					<!-------------- 검색 버튼 -------------->	
					<button class="btn " id="filterBtnSearch" >검&nbsp색</button>
				</div>
			</div>
			
			<!------------------------------------------------------>
			<!--------------------- 모집중 조회 필터 --------------------->
			<div class="col-lg-12 col-sm-12 text-lg-end" id="filter">
				<c:if test="${t_dealstatus eq null || t_dealstatus eq ''}">
					<button class="btn px-4" id="filterBtn_BF" onclick="chkDealValue()">모집중인 글 보기</button>
					<input type="hidden" name = "t_dealstatus" id="filterInput">
				</c:if>
				
				<c:if test="${t_dealstatus eq '0'}">
					<!-- onclick="location.href='travelListForm.do'" -->
					<button class="btn px-4" id="filterBtn_AF">모집중인 글 보기</button>
				</c:if>
			</div>
		</div>
	</form>
</div>

<!-------- 여백 -------->
<div style="height: 10px;"></div>

<!---------------------------------------------------------------->
<!----------------------- 동행자 컨텐츠 리스트 ------------------------>
<section class="py-1">
	<div class="container px-4 px-lg-5 mt-3">
		<div class="row gx-4 gx-lg-3 row-cols-2 row-cols-md-3 row-cols-xl-4 ">
		
			<c:if test="${totCnt > 0}">
				<c:forEach var="travel" items="${travelList}">
						<div class="col mb-5">
							<div id="contentBox" class="card h-70" style="cursor: pointer;" 
								 onclick="location.href='travelContent.do?t_num=${travel.t_num}&pageNum=${currentPage}';">
								
								<!------------ Content 이미지영역 ------------>
								<div id="pic">
									<div id="picOnGubun">
										<!---------- 구분, 날짜 ---------->
										#${travel.t_gubun}&nbsp&nbsp<span id="picOnDate">${fn:replace(travel.t_start, '-', '/')}&nbsp-&nbsp${fn:replace(travel.t_end, '-', '/')}</span>
									</div>
									<!-------------- 이미지 -------------->
									<img src="${travel.t_img}" class="card-img-top" />
								</div> 
								
								<div class="card-body p-4">
									<div class="text-left">
										<!--------- 모집 상태 표시 --------->
										<p class="fw-bolder" id="title">
											<c:choose>
												<c:when test="${travel.t_dealstatus == 0}">
													<b style="color: #ff3500; width: 64px;">모집중</b>&nbsp&nbsp
												</c:when>
												<c:otherwise>
													<b style="color: #9A9A9A; width: 64px;">모집완료</b>&nbsp&nbsp
												</c:otherwise>
											</c:choose>
											
											<!----------- 제목 ----------->
											<span>${travel.t_title}</span>
										</p>
										
										<!------------- 본문 ------------->
										<p id="content">${travel.t_content}</p>

										<!----- 유저이미지, 아이디, 댓글 ------->
										<p id="IdComment">
											<img src='${travel.user_img}' width="28" height="28" style="margin: 0 5px 2px 0;"
												class="userIconColor-1 rounded-circle me-1  align-center">
											${travel.user_id}

											<!----------- 댓글개수 ----------->
											<span id="comment"> 
												<img src="images/comm_icon.png">${travel.reply_cnt}
											</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					<%-- <c:set var="startNum" value="${startNum -1}" /> --%>
				</c:forEach>
			</c:if>

		</div>
		<!------------- 데이터 없을시 노출 no-data ------------->
		<c:if test="${totCnt == 0 }">
			<div style="text-align: center;"><img src="images/no-data.png" ></div>
		</c:if>
		
		<!-------- 여백 -------->
		<div style="height: 20px;"></div>
		
		<!------------- 페이지 넘버링 ------------->
				<nav aria-label="Page navigation example" class="d-flex justify-content-center">
					<ul class="pagination" id="pageNumColor">
						<c:if test="${startPage > blockSize}">
							<li class="page-item">
								<a class="page-link" aria-label="Previous"
									href='travelListForm.do?pageNum=${startPage-blockSize}'> 
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<li class="page-item">
								<a class="page-link" href='travelListForm.do?pageNum=${i}'>${i}</a>
							</li>
						</c:forEach>
						<c:if test="${endPage < pageCnt}">
							<li class="page-item">
								<a class="page-link" aria-label="Next"
									href='travelListForm.do?pageNum=${startPage+blockSize}'>
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
	</div>
</section>

<!--------------- 여백 ---------------->
<div style="margin-top: 200px;"></div>

<!------------ footer 영역 ------------>
<c:import url="${context}/footer.jsp"></c:import>
</body>


<!--------------------------------------------------->
<!------------------- JS function ------------------->
<!--------------------------------------------------->
<script  type="text/javascript">

<!----- DATE : 여행 종료일 -> 시작일 이후 선택만 가능 함수 ---->
function getStartDate()  {
	  const input_from = document.getElementById('input_from').value;
	  document.getElementById("input_to").setAttribute("min", input_from);
	}
	
<!------------------ 모집중/완료 함수 ------------------->
function chkDealValue() {
	document.getElementById('filterInput').value = "0";
}
<!---------------- 테마선택 컬러 변경 함수 ---------------->
function gubunChk(i) {
	switch (i) {
		case 1:
			if (document.getElementById('t_gubun' + i).style.color == "rgb(0, 0, 0)") {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#ff3500");
				document.getElementById('gubun').value = "";
			} 
			document.getElementById('t_gubun2').setAttribute("style", "color:#000000");
			document.getElementById('t_gubun3').setAttribute("style", "color:#000000");
			document.getElementById('t_gubun4').setAttribute("style", "color:#000000");
			document.getElementById('t_gubun5').setAttribute("style", "color:#000000");
			document.getElementById('t_gubun6').setAttribute("style", "color:#000000");
			break;
		case 2:
			document.getElementById	   ('t_gubun1').setAttribute   ("style", "color:#000000");
			if (document.getElementById('t_gubun' + i).style.color == "rgb(0, 0, 0)") {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#ff3500");
				document.getElementById('gubun').value = document.getElementById('gubun').value + ",'숙박'";
			} else {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#000000");
				document.getElementById('gubun').value = document.getElementById('gubun').value.replace(",'숙박'", "");
			}
			break;
		case 3:
			document.getElementById('t_gubun1').setAttribute("style", "color:#000000");
			if (document.getElementById('t_gubun' + i).style.color == "rgb(0, 0, 0)") {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#ff3500");
				document.getElementById('gubun').value = document.getElementById('gubun').value + ",'레저'";
			} else {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#000000");
				document.getElementById('gubun').value = document.getElementById('gubun').value.replace(",'레저'", "");
			}
			break;
		case 4:
			document.getElementById('t_gubun1').setAttribute("style", "color:#000000");
			if (document.getElementById('t_gubun' + i).style.color == "rgb(0, 0, 0)") {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#ff3500");
				document.getElementById('gubun').value = document.getElementById('gubun').value + ",'맛집'";
			} else {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#000000");
				document.getElementById('gubun').value = document.getElementById('gubun').value.replace(",'맛집'", "");
			}
			break;
		case 5:
			document.getElementById('t_gubun1').setAttribute("style", "color:#000000");
			if (document.getElementById('t_gubun' + i).style.color == "rgb(0, 0, 0)") {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#ff3500");
				document.getElementById('gubun').value = document.getElementById('gubun').value + ",'카풀'";
			} else {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#000000");
				document.getElementById('gubun').value = document.getElementById('gubun').value.replace(",'카풀'", "");
			}
			break;
		case 6:
			document.getElementById('t_gubun1').setAttribute("style", "color:#000000");
			if (document.getElementById('t_gubun' + i).style.color == "rgb(0, 0, 0)") {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#ff3500");
				document.getElementById('gubun').value = document.getElementById('gubun').value + ",'기타'";
			} else {
				document.getElementById('t_gubun' + i).setAttribute("style", "color:#000000");
				document.getElementById('gubun').value = document.getElementById('gubun').value.replace(",'기타'", "");
			}
			break;
	}
}
</script>

<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="yncss/popper.min.js"></script>
<script src="yncss/bootstrap.min.js"></script>
</html>