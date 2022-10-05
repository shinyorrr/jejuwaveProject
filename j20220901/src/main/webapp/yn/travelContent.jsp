<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="dbError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String context = request.getContextPath();
String userId = (String) session.getAttribute("user_id");
request.setAttribute("userId", userId);
%>

<!-- header 영역 -->
<c:import url="../header.jsp"></c:import>

<!-------------- body 영역 ------------>
<div style="margin-top: 30px;"></div>
<!-- 게시물 -->
<div class="container ">
	<div class="row justify-content-center">
		<div class="col-lg-9 justify-content-start">
			<!-- Post content-->
			<article class="mb-5 pb-3">
				<!-- 게시물 이미지 -->
				<figure class="mb-4">
					<img class="img-fluid rounded mb-4"
						src="yn_images/upload/${travelContent.t_img}"
						style="width: 100%; height: 280px; object-fit: cover;">
				</figure>

				<!-- 글제목 -->
				<header class="mb-3">
					<p name="t_title" class="h4 fw-bold mb-2">${travelContent.t_title}</p>

					<!--작성일 -->
					<p id="dateViwer"
						class="text-muted m-0 form-check-inline align-center">${travelContent.t_date}</span>
						<c:if test="${travelContent.user_id eq userId}">
							<button
								onclick="location.href='travelUpdate.do?t_num=${travelContent.t_num}'"
								type="button" id="dateViwer" class="btn p-0  m-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp수정</button>
							<button
								onclick="location.href='travelDelete.do?t_num=${travelContent.t_num}&t_ref=${travelContent.t_ref}'"
								id="dateViwer" type="button" class="btn p-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp삭제</button>
							<c:if test="${travelContent.t_dealstatus == 0}">
								<button
									onclick="location.href='travelStatus.do?t_num=${travelContent.t_num}'"
									id="dateViwer" type="button" class="btn p-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp모집
									완료</button>
							</c:if>
						</c:if>
					</p>
				</header>
				<!-- 박스 -->
				<div class=" form-group row my-5  ">
					<!-- 모집인원,기간 박스  -->
					<div
						class="card py-2 inline col-lg-9 justify-content-start floatLL ms-3">
						<div class="card-body ">
							<p class="mb-2">
								<span id="keyColor" class="fw-bold me-2">${travelContent.t_gubun}</span><span
									class="ms-3 fontColorGrey">모집 인원</span>
								${travelContent.t_person}명
							</p>
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17"
									fill="currentColor" class="bi bi-calendar-check-fill"
									viewBox="0 0 17 17">
							  				<path
										d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zm-5.146-5.146-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708z" />
											</svg>
								<span class="mt-1">${travelContent.t_start}&nbsp~&nbsp${travelContent.t_end}</span>
							</div>
						</div>
					</div>
					<!-- 사이드 바 메뉴 동행 후기 보기-->
					<div
						class="panel panel-info border justify-content-end floatRR col-lg-2 ms-3 p-3 align-middle"
						id="userBox">
						<div class="card-body mb-0 p-0">
							<img src="yn_images/user_icon01.png" width="32" height="32"
								class="userIconColor-1 rounded-circle me-2  align-center border-2 border-secondary">
							<span name="user_id" class="h5">${travelContent.user_id}</span>
							<!-- Button trigger modal -->
							<button type="button" class="btn center mt-2" id="trCommBtn"
								data-bs-toggle="modal" data-bs-target="#exampleModal">동행후기
								보기</button>
							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
									<div class="review">
										<div class="modal-header">
											<div>
												<c:if test="${img == null }">
													<img src="<%=context%>/images/vector_profile_default.svg"
														style="vertical-align: middle; width: 38px; height: 38px; border-radius: 60%; margin: 10px 0px 0px 15px;">
												</c:if>
												<c:if test="${img != null }">
													<img src="<%=context %>/${img}"
														style="vertical-align: middle; width: 38px; height: 38px; border-radius: 60%; margin: 10px 0px 0px 15px;">
												</c:if>
											</div>
											<div>
												<div class="modal-title moti" id="exampleModalLabel">
													<p>${travelContent.user_id}</p>
												</div>
												<div class="modal-hashtag moha">
													<p>30대 · 남성 · 대한민국</p>
												</div>
											</div>
											<div class="rating" data-rate="2" style="padding-left: 110px; padding-top: 48px;">											
												<i class="fa fa-star"></i>												
												<i class="fa fa-star"></i>												
												<i class="fa fa-star"></i>											
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>																
											</div>
											<p class="ratingScore" style="padding-top: 48px; padding-left: 15px; margin: 0px;">3.0</p>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-bottom: 30px; margin-right: 5px;"></button>
										</div>
										<div class="modal-body ">
											<div class="modal-body-top">
												<div class="modal-body-top-title">
													<div class="modal-body-top-title-cotents">
														<p>받은 동행 후기</p>
													</div>
													<div class="modal-body-top-title-counts">
														<p>0</p>
													</div>
												</div>
													<div class="modal-body-comment " style="overflow: auto;">
														<div class="" style="background-color: yellow; height: 100px;">
															<div>
																<span>${review.user_id }</span> <span>revlist.r_date</span>
															</div>
															<div>
																<p>${review.r_content}</p>
															</div>
															<div>
																<div class="rating" data-rate="3">											
																	<i class="fa fa-star"></i>												
																	<i class="fa fa-star"></i>												
																	<i class="fa fa-star"></i>											
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>																
																</div>
															</div>
														</div>
														<div class="" style="background-color: red; height: 100px;"></div>
														<div class="" style="background-color: green; height: 100px;"></div>
														<div class="" style="background-color: yellow; height: 100px;"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer" style="justify-content: flex-start;">
											<div></div>
											<div class="modal-footer-comment" style="width: 100%;">
												<div class="make_star"
													style="display: flex; margin-bottom: 15px;">
													<select name="" id="makeStar">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
															<div class="rating" data-rate="2">											
																<i class="fa fa-star"></i>												
																<i class="fa fa-star"></i>												
																<i class="fa fa-star"></i>											
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>																
															</div>
													</div>
													<input type="text" placeholder="동행후기를 한줄평으로 달아보세요!"
																		onfocus="this.placeholder = ''"
																		onblur="this.placeholder = '동행후기를 한줄평으로 달아보세요!'">
													<button type="submit">등록</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- 글 내용 -->
				<section class="mb-5">
					<p class="fs-6 mb-4">${travelContent.t_content}</p>
				</section>
			</article>

			<!-- 댓글 -->
			<section class="my-5">
				<div class="card bg-light card-body my-4 p-4 border-0">
					<!-- 댓글 박스 -->
					<form action="travelReply.do" class="mb-6" method="post">
						<input name="t_num" type="hidden" value="${travelContent.t_num}">
						<input name="t_relevel" type="hidden" value="1">

						<div class="input-group my-3">
							<button type="submit" class="input-group-text" id="commInsBtn">
								댓글 등록</button>
							<textarea name="t_content" rows="2" class="form-control p-1"
								style="border-left: none;" placeholder="댓글을 남겨 보세요!"
								aria-label="Input group example" aria-describedby="basic-addon1"></textarea>
						</div>
					</form>
					<!-- 구분 라인 -->

					<!-- 댓글 영역 -->
					<hr class="mt-4">
					<c:forEach var="reply" items="${replyList}">

						<div class="d-flex mb-4 pt-3">
							<div class="flex-shrink-0 ms-5 align-middle">

								<c:if test="${reply.t_relevel > 1}">
									<span class="me-5"></span>
								</c:if>
								<!-- 작성자 아이디 = 댓글 아이디 -->
								<c:choose>
									<c:when test="${reply.user_id eq travelContent.user_id}">
										<img src="yn_images/user_icon04.png" width="42" height="42"
											class=" bg-white userIconColor-1 rounded-circle me-2 mt-1 ">
									</c:when>
									<c:otherwise>
										<img src="yn_images/user_icon01.png" width="42" height="42"
											class=" bg-white userIconColor-1 rounded-circle me-2 mt-1 ">
									</c:otherwise>
								</c:choose>
							</div>
							<div style="font-size: 90%;" class="ms-3">
								<div class="mb-2" style="display: flex;">
									<div class="fw-bold me-4">${reply.user_id}</div>
									<span style="color: #8C8C8C;">${reply.t_date} </span>
									<button data-bs-toggle="collapse"
										data-bs-target="#reply${reply.t_num}"
										style="margin-left: 50px; font-size: 85%; color: #8C8C8C;">댓글
										달기</button>


									<c:if test="${reply.user_id eq userId}">
										<button
											onclick="location.href='travelDelete.do?t_num=${reply.t_num}&t_ref=${reply.t_ref}'"
											style="font-size: 85%; color: #8C8C8C;">&nbsp&nbsp&#183&nbsp&nbsp삭제</button>
									</c:if>
								</div>
								${reply.t_content}

								<div id="reply${reply.t_num}" class="collapse input-group my-3">
									<form action="travelReply.do" method="post">
										<input name="t_num" type="hidden"
											value="${travelContent.t_num}"> <input
											name="t_relevel" type="hidden" value="2"> <input
											name="t_restep" type="hidden" value="${reply.t_restep}">

										<div style="display: flex;">
											<textarea type="text" name="t_content"
												class="form-control p-1"
												style="width: 550px; border-right: none;"
												placeholder="댓글을 남겨 보세요!">@${reply.user_id}  </textarea>
											<button type="submit" class="input-group-text"
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
<%@ include file="footer.jsp"%>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- modal -->
<script src="https://kit.fontawesome.com/1f609f562c.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/modal.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function () {
	

var rating =$('.review .rating');

rating.each(function () {
	var targetScore = $(this).attr('data-rate');
	var firstdigit = targetScore.split('.');
	if(firstdigit.length > 0){
		for(var i = 0; i<targetScore; i++){
			$(this).find('.fa-star:nth-child(-n+' +targetScore + ')').eq(i).css({color:'#f05522'});
	}
		/* $(this).find('.fa-star:nth-child(-n+' +targetScore + ')').css({color:'#f05522'}); */
	}
	
	});
	var userScore = $('#makeStar');
	userScore.change(function () {
		var userScoreNum = $(this).val();
		$('.make_star .fa-star').css({color:'#000'});
		$('.make_star .fa-star:nth-child(-n+' + userScoreNum + ')').css({color:'#f05522'});
	});
	$('.make_star .fa-star').click(function () {
		var targetNum = $(this).index() + 1;
		$('.make_star .fa-star').css({color:'#000'});
		$('.make_star .fa-star:nth-child(-n+' + targetNum + ')').css({color:'#f05522'});
	});
});
</script>