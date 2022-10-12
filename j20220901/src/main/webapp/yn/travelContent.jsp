<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<title>JejuWave 동행찾기</title>
<%
	String context = request.getContextPath();
	String userId = (String) session.getAttribute("user_id");
	request.setAttribute("userId", userId);
%>
<!-- header 영역 -->
<c:import url="${context}/header.jsp"></c:import>
<link rel="stylesheet" href="yncss/trList.css" type="text/css">

</head>


<!--------------------------------------------------------->
<!----------------------- body 영역 ------------------------>
<body style="color: #000000;">

<!----------------------- 여백 ------------------------>
<div style="height: 178px;"></div>

<!----------------------- 게시물 ------------------------>
<div class="container ">
	<div class="row justify-content-center">
		<div class="col-lg-10 justify-content-start">
			<article class="mb-5 pb-3">
			
				<!--------------- 게시물 이미지 --------------->
				<figure>
					<img class="img-fluid rounded mb-4" src="${travelContent.t_img}"
						style="width: 100%; height: 330px; object-fit: cover;">
				</figure>
				<!--------------- 여백 --------------->
				<div style="height: 30px;"></div>
				
				<!--------------- 글 제목 --------------->
				<header>
					<p name="t_title" class="h4 fw-bold mb-2">${travelContent.t_title}</p>

					<!--------------- 작성일 --------------->
					<p class="m-0 form-check-inline align-center" 
						id="dateViwerDate">${travelContent.t_date}</span>
						
					<!------ 작성자 = userId 일때 수정, 삭제, 모집완료 버튼 ------>
					<c:if test="${travelContent.user_id eq userId}">
						&nbsp&nbsp&nbsp&nbsp&nbsp
						<button onclick="location.href='travelUpdate.do?t_num=${travelContent.t_num}'"
							id="dateViwer" type="button" class="btn p-0  m-0 ">수정</button>

						<!------ 삭제버튼 : deleteChk function ------>
						&nbsp&nbsp&#183&nbsp&nbsp
						<button onclick="deleteChk()" id="dateViwer" type="button" class="btn p-0">삭제</button>
					
						<!------ 모집완료 버튼 click : 0 >> 1 ------>
						<c:if test="${travelContent.t_dealstatus == 0}">
							&nbsp&nbsp&#183&nbsp&nbsp
							<button onclick="location.href='travelStatus.do?t_num=${travelContent.t_num}'"
								id="dateViwer" type="button" class="btn p-0 ">모집 완료</button>
						</c:if>
					</c:if>
					</p>
				</header>
				
				<!----------------------------------------->
				<!------------------ 박스 ------------------>
				<div class=" form-group row my-5" >
					<!------ 모집인원,기간 박스 ------>
					<div class="card py-2 inline col-lg-9 justify-content-start floatLL ms-3" style="display:inline;">
						<div class="card-body ">
						
							<!---------- 모집 인원 ---------->
							<p class="mb-2">
								<span id="keyColor" class="fw-bold me-2">${travelContent.t_gubun}</span>
								<span class="ms-3 fontColorGrey">모집 인원</span>
								${travelContent.t_person}명
							</p>
							
							<!---------- 모집 기간 ---------->
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
									fill="currentColor" class="bi bi-calendar-check-fill" viewBox="0 0 17 17">
									<path
										 d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zm-5.146-5.146-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708z" />
								</svg>
								<span class="mt-1">&nbsp${travelContent.t_start}&nbsp~&nbsp${travelContent.t_end}</span>
							</div>
						</div>
					</div>
					
					<!------ 사이드 바 메뉴 동행 후기 보기------>
					<div class="panel panel-info border justify-content-end floatRR ms-3 p-3 align-middle"
						id="userBox" style="display:inline;">
						<div class="card-body mb-0 p-0">
						
							<!--------- 유저 이미지 --------->
							<img src="${travelContent.user_img}" width="32" height="32"
								class="userIconColor-1 rounded-circle me-2  align-center border-2 border-secondary">
							<span name="user_id" class="h5">${travelContent.user_id}</span>
							
							<!--------- 후기버튼 --------->
							<button type="button" class="btn center mt-2" id="trCommBtn"
								data-bs-toggle="modal" data-bs-target="#exampleModal">동행후기보기</button>
								
								
							<!-- ************************************************************* -->
							<!-- ************************************************************* -->
							<!------ 후기 modal창 ------>
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="review">
											<div class="modal-header">
												<div>
													<c:if test="${travelContent.user_img == null }">
														<img src="<%=context%>/images/vector_profile_default.svg"
															style="vertical-align: middle; width: 38px; height: 38px; border-radius: 60%; margin: 10px 0px 0px 15px;">
													</c:if>
													<c:if test="${travelContent.user_img != null }">
														<img src="<%=context %>/${travelContent.user_img}"
															style="vertical-align: middle; width: 38px; height: 38px; border-radius: 60%; margin: 10px 0px 0px 15px;">
													</c:if>
												</div>
												<div>
													<div class="modal-title moti" id="exampleModalLabel">
														<p>${travelContent.user_id}</p>
													</div>
												</div>
												<div class="rating" data-rate="${avgReview}"
													style="padding-left: 130px; padding-top: 48px;">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>											
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"
													style="margin-bottom: 30px; margin-right: 5px;"></button>
											</div>
											<!-- 후기 박스 -->
											<div class="modal-body ">
												<div class="modal-body-top">
													<div class="modal-body-top-title">
														<div class="modal-body-top-title-cotents">
															<p>받은 동행 후기</p>
														</div>
														<div class="modal-body-top-title-counts">
															<p>${totalRev}</p>
														</div>
													</div>

													<div class="modal-body-comment " style="overflow: auto;">
														<c:if test="${totRev > 0}">
															<c:forEach var="review" items="${revlist}">
																<div class=""
																	style=" height: 100px; margin: 5px;">
																	<div>
																		<span>${review.user_id }</span> <span class="modal-date">${review.r_date}</span>
																	</div>
																	<div>
																		<p style="margin: 5px;">
																			<c:choose>
																				<c:when test="${fn:length(review.r_content) >33 }">
																					<c:out
																						value="${fn:substring(review.r_content,0,30)}" />...
																	</c:when>
																				<c:otherwise>
																					<c:out value="${review.r_content}" />
																				</c:otherwise>
																			</c:choose>
																		</p>
																	</div>
																	<div>
																		<div class="rating" data-rate="${review.r_avg}" style="padding-top: 15px;">
																			<i class="fa fa-star"></i> <i class="fa fa-star"></i>
																			<i class="fa fa-star"></i> <i class="fa fa-star"></i>
																			<i class="fa fa-star"></i>
																		</div>
																	</div>
																</div>
																<hr style="border:2px dashed;">
															</c:forEach>
														</c:if>
													</div>
												</div>
											</div>
										</div>
										<!-- 후기 등록 박스 -->
										<%-- <c:if test="${user_id !=null }"> --%>
										<form method="post" name="revBox" id="revBox" onsubmit="return false;">
										<input name="t_num" type="hidden" value="${travelContent.t_num}">
											<div class="modal-footer"
												style="justify-content: flex-start;">
												<div class="modal-footer-comment" style="width: 100%;">
													<!-- 후기 등록창 -->
													<div class="make_star"
														style="display: flex; margin-bottom: 15px;">
														<select name="r_avg" id="r_avg" required="required">
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
															<option value="5">5</option>
														</select>
														<div class="rating" data-rate="2">
															<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i> <i class="fa fa-star"></i> <i
																class="fa fa-star"></i>
														</div>
													</div>
													<input name="r_content" id="r_content" type="text" placeholder="동행후기를 한줄평으로 달아보세요!"
														onfocus="this.placeholder = ''"
														onblur="this.placeholder = '동행후기를 한줄평으로 달아보세요!'">
													<button id="reviewBtn">등록</button>
												</div>
											</div>
										</form>
										<%-- </c:if> --%>
									</div>
								</div>
							</div>
							<c:if test="${totCnt == 0 }">
								<h1>데이터가 없습니다</h1>
							</c:if>
							<!-- <button type="button" class="btn center mt-2" id="trCommBtn">동행후기 보기</button> -->
						</div>
					</div>
				</div>
				<!-- ************************ 모달창 끝 **************************** -->
				<!-- ************************************************************* -->
							
				<!-------- 글 내용 -------->
				<section style="margin:60px 0;">
					<p class="fs-6 mb-4 p-4">${travelContent.t_content}</p>
				</section>
			</article>

			<!----------- 댓글 영역 ----------->
			<section class="my-5">
				<div class="card card-body my-4 p-4 border-0" style="background: #F2F2F2;">
					<!------ 댓글 박스 ------>
					<form action="travelReply.do"  method="post">
					
						<!------- 히든처리 : t_num, t_relevel ----->
						<input name="t_num" type="hidden" value="${travelContent.t_num}">
						<input name="t_relevel" type="hidden" value="1">

						<!----------- 댓글 등록 창 --------------->
						<div class="input-group my-3 ">
							<button type="button" onclick="userReplyChk()" class="input-group-text" id="commInsBtn">
								댓글 등록</button>
							<textarea required="required" name="t_content" rows="2"
								class="form-control" style="border-left: none; padding: 10px 10px 10px 15px !important; font-size: 14px;"
								placeholder="댓글을 남겨 보세요!" aria-label="Input group example"
								aria-describedby="basic-addon1"></textarea>
						</div>
					</form>

					<!-------------- 댓글 리스트 영역 -------------->
					<div style="height: 15px;"></div>
					<c:forEach var="reply" items="${replyList}">

						<c:if test="${reply.t_relevel == 1}">
						<div style="height: 20px;"></div>
						</c:if>
					
						<div class="d-flex mb-3 pt-3">
							<div class="flex-shrink-0 ms-5 align-middle">

								<!----------- 대댓글 들여쓰기 ----------->
								<c:if test="${reply.t_relevel > 1}">
									<span class="me-5"></span>
								</c:if>

								<!------ 대댓글 user_img 크기 작게 ------>
								<c:choose>
									<c:when test="${reply.t_relevel > 1}">
										<img src="${reply.user_img}" width="34" height="34"
											class=" bg-white userIconColor-1 rounded-circle me-2 mt-1 ">
									</c:when>
									<%-- 기본댓글 user_img 크기 --%>
									<c:otherwise>
										<img src="${reply.user_img}" width="46" height="46"
											class=" bg-white userIconColor-1 rounded-circle me-2 mt-1 ">
									</c:otherwise>
								</c:choose>
							</div>
							
							<div style="font-size: 90%;" class="ms-3">
								<div class="mb-2" style="display: flex;">
								
									<!----- 글 작성자 댓글 작성시 >> 작성자 아이콘 ----->
									<div class="fw-bold me-4">
									${reply.user_id}&nbsp&nbsp
									<c:if test="${reply.user_id eq travelContent.user_id}">
										<span id="trWriterIcon">  &nbsp작성자&nbsp	</span>
									</c:if>
									</div>
									
									<!--------- 댓글 작성 시간 --------->
									<span style="color: #9A9A9A;">${reply.t_date} </span>
									<button data-bs-toggle="collapse"
										data-bs-target="#reply${reply.t_num}"
										style="margin-left: 50px; 
										font-weight:bold; font-size: 85%; color: #9A9A9A;">답글 달기</button>


									<!--------- 댓글 삭제 버튼 : 댓글 user_id = userId --------->
									<c:if test="${reply.user_id eq userId}">
										<button
											onclick="deleteReplyChk(${reply.t_num}, ${reply.t_ref}, ${reply.t_relevel})"
											style="font-size: 85%; font-weight:bold; color: #9A9A9A;">&nbsp&nbsp&#183&nbsp&nbsp삭제</button>
									</c:if>
								</div>
								<!--------- 댓글 내용 --------->
								${reply.t_content}

								<!---------- 대댓글 ---------->
								<div id="reply${reply.t_num}" class="collapse input-group my-3">
									<form action="travelReply.do" method="post">
										<input name="t_num" type="hidden" value="${travelContent.t_num}"> 
										<input name="t_relevel" type="hidden" value="2">
										<input name="t_restep" type="hidden" value="${reply.t_restep}">

										<!------ 대댓글 작성 창 ------>
										<div style="display: flex; width: 250%;">
											<textarea type="text" name="t_content" class="form-control p-1"
												style="width: 100%; border-right: none;"
												placeholder="댓글을 남겨 보세요!">@${reply.user_id}  </textarea>
											<button type="button" onclick="userReplyChk()" class="input-group-text"
												id="commInsBtn">댓글 등록</button>
										</div>
									</form>
								</div>

							</div>

						</div>

					</c:forEach>
				</div>
			</section>
		</div>
	</div>
</div>


<div style="margin-top: 200px;"></div>
<%@ include file="../footer.jsp"%>

</body>

<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!---------------------modal ------------------------->
<script src="https://kit.fontawesome.com/1f609f562c.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/modal.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


/***************************************************/
/****************** 동행후기 모달 JS ******************/

$(function () {
	var rating = $('.review .rating');
	
	rating.each(function () {
		var targetScore = $(this).attr('data-rate');
		$(this).find('.fa-star:nth-child(-n+'+ targetScore + ')').attr('style','color: #f05522 !important');
	});
	
	var userScore = $('#r_avg');
	userScore.change(function () {
		var userScoreNum = $(this).val();
		$('.make_star .fa-star').css({color:'#000'});
		$('.make_star .fa-star:nth-child(-n+' + userScoreNum + ')').attr('style','color: #f05522 !important');
	});
	
	/* .attr('style','color: #f05522 !important'); */
	$('.make_star svg').click(function () {
		var targetNum = $(this).index() + 1;
		$('.make_star svg').css({color:'#000'});
		$('.make_star svg:nth-child(-n+' + targetNum + ')').css({color: '#F05522'});
	});
});
/**************후기등록 경고창JS******************/
var reviewBtn = document.getElementById("reviewBtn");
reviewBtn.addEventListener("click", function () {
	var userId = '${userId}';
	var form = document.getElementById("revBox");
	if(userId == null || userId == ""){
		var cfr = confirm("로그인이 필요합니다.\n로그인하시겠습니까?");
		if (!cfr) return false;   
			location.href = "login.do";
			return false;			
	} else if(r_content.value == ""){
		alert("한줄평을 남겨주세요.")
			return false;
	}
	form.action = "review.do";
	form.mothod = "POST";
	form.submit();
});
</script>
<script type="text/javascript">
/***************************************************/
/******************* 게시물 삭제 JS *******************/

function deleteChk() {
	if (confirm("삭제 후에는 복구 할 수 없습니다!\n게시글을 삭제하시겠습니까?") == true){    //확인
/*     document.removefrm.submit();*/
	location.href = "travelDelete.do?t_num=${travelContent.t_num}&t_ref=${travelContent.t_ref}&t_relevel=${travelContent.t_relevel}";
 }else{   //취소
     return false;
 }
}


/***************************************************/
/******************* 삭제된 댓글 JS *******************/

function deleteReplyChk(t_num, t_ref, t_relevel) {
	if (confirm("삭제 후에는 복구 할 수 없습니다!\n댓글을 삭제하시겠습니까?") == true){    //확인
/*     document.removefrm.submit();*/
	location.href = "travelDelete.do?t_num=" + t_num + "&t_ref=" + t_ref + "&t_relevel="  + t_relevel;
 }else{   //취소
     return false;
 }
}

/*********** 댓글 유효성 체크 함수 ***********/
function userReplyChk() {
	var userId = '${userId}';
	if(userId == null || userId == "") {
		if (confirm("로그인이 필요합니다.\n로그인하시겠습니까?") == true) {    //확인
			location.href = "login.do";
		} else {   //취소
		     return false;
		}
	} return true;
}

</script>
</html>