<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
String context = request.getContextPath();
String userId = (String) session.getAttribute("user_id");
request.setAttribute("userId", userId);
%>
<c:import url="header.jsp"></c:import>
<link rel="stylesheet" href="yncss/trList.css" type="text/css">	

<!-------------- body 영역 ------------> 	
<div style="margin-top:178px;"></div>
        <!-- 게시물 -->
<div class="container ">
	<div class="row justify-content-center">
		<div class="col-lg-9 justify-content-start">
			<!-- Post content-->
			<article class="mb-5 pb-3">
				<!-- 게시물 이미지 -->
				<figure class="mb-4">
					<img class="img-fluid rounded mb-4" src="images/upload/${travelContent.t_img}" style="width:100%; height:280px; object-fit:cover;">
				</figure>
				
				<!-- 글제목 -->
				<header class="mb-3">
					<p name="t_title" class="h4 fw-bold mb-2">${travelContent.t_title}</p>
				
					<!--작성일 -->
					<p  id="dateViwer" class="text-muted m-0 form-check-inline align-center">${travelContent.t_date}</span> 
						<c:if test="${travelContent.user_id eq userId}">
							<button onclick="location.href='travelUpdate.do?t_num=${travelContent.t_num}'" id="dateViwer" 
									type="button" class="btn p-0  m-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp수정</button>
							
							<!--  function ==> 헤더에 -->
							<button onclick="deleteChk()" id="dateViwer" type="button" 
									class="btn p-0 text-muted"  >&nbsp&nbsp&#183&nbsp&nbsp삭제</button>
							<c:if test="${travelContent.t_dealstatus == 0}">
							<button onclick="location.href='travelStatus.do?t_num=${travelContent.t_num}'"  id="dateViwer" 
									type="button" class="btn p-0 text-muted">&nbsp&nbsp&#183&nbsp&nbsp모집 완료</button>
							</c:if>
						</c:if>
					</p>
				</header>
				<!-- 박스 --> 					
				<div class=" form-group row my-5  ">
					<!-- 모집인원,기간 박스  -->
					<div class="card py-2 inline col-lg-9 justify-content-start floatLL ms-3">
						<div class="card-body ">
							<p class="mb-2"><span id="keyColor" class="fw-bold me-2">${travelContent.t_gubun}</span><span class="ms-3 fontColorGrey">모집 인원</span> ${travelContent.t_person}명</p>
							<div>
								<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-calendar-check-fill" viewBox="0 0 17 17">
									<path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zM16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zm-5.146-5.146-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708.708z"/>
								</svg>
								<span class="mt-1">${travelContent.t_start}&nbsp~&nbsp${travelContent.t_end}</span>
							</div>
						</div>
					</div>
					<!-- 사이드 바 메뉴 동행 후기 보기-->
					<div class="panel panel-info border justify-content-end floatRR col-lg-2 ms-3 p-3 align-middle" id="userBox">
						<div class="card-body mb-0 p-0">
						<%-- 유저 이미지 --%>
							<img src="${travelContent.user_img}" width="32" height="32" 
								 class="userIconColor-1 rounded-circle me-2  align-center border-2 border-secondary">
							<span name="user_id" class="h5">${travelContent.user_id}</span>
							<button type="button" class="btn center mt-2" id="trCommBtn">동행후기 보기</button>		
						</div>
					</div>
				</div>
				<!-- 글 내용 -->
				<section class="mb-5"><%-- ${travelContent.t_content} --%>
					<p class="fs-6 mb-4" >${travelContent.t_content}</p>
				</section>
			</article>
						
			<!-- 댓글 -->
			<section class="my-5">
				<div class="card bg-light card-body my-4 p-4 border-0">
				
					<!-- 댓글 박스 -->
					<form action="travelReply.do" class="mb-6" method="post">
						<!-- 히든처리 : t_num, t_relevel -->
						<input name="t_num" type="hidden" value="${travelContent.t_num}">
						<input name="t_relevel" type="hidden" value="1">
						
						<!-- 댓글 등록 창 -->
						<div class="input-group my-3">
							<button type="submit" class="input-group-text" id="commInsBtn" >
								댓글 등록
							</button>
							<textarea required="required" name="t_content" rows="2" class="form-control p-1" style=" border-left:none;" placeholder="댓글을 남겨 보세요!" aria-label="Input group example" aria-describedby="basic-addon1"></textarea>
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
										<img src="${reply.user_img}"  width="42" height="42" 
											 class=" bg-white userIconColor-1 rounded-circle me-2 mt-1 ">
									</c:when>
									<c:otherwise>
										<img src="${reply.user_img}"  width="42" height="42" 
											 class=" bg-white userIconColor-1 rounded-circle me-2 mt-1 ">
									</c:otherwise>
								</c:choose>
							</div>
							<div style="font-size:90%;" class="ms-3">
							<div class="mb-2" style="display: flex;">
								<div class="fw-bold me-4">${reply.user_id} </div>
								<span style="color:#8C8C8C;">${reply.t_date} </span>
							 	<button data-bs-toggle="collapse" data-bs-target="#reply${reply.t_num}" 
										style="margin-left:50px; font-size: 85%; color:#8C8C8C;">댓글 달기</button>
										
										
								<c:if test="${reply.user_id eq userId}">
									<button onclick="deleteReplyChk(${reply.t_num}, ${reply.t_ref})" 
									style="font-size: 85%; color:#8C8C8C;">&nbsp&nbsp&#183&nbsp&nbsp삭제</button>
								</c:if>
							</div>
								${reply.t_content}
						
								<!-- 대댓글 -->
								<div id="reply${reply.t_num}" class="collapse input-group my-3" >
									<form action="travelReply.do" method="post">
										<input name="t_num" type="hidden" value="${travelContent.t_num}">
										<input name="t_relevel" type="hidden" value="2">
										<input name="t_restep" type="hidden" value="${reply.t_restep}">
						 				
						 				<!-- 대댓글 창 -->
										<div  style="display: flex;">
											<textarea type="text" name="t_content" class="form-control p-1" 
											style="width:550px; border-right:none;" 
											placeholder="댓글을 남겨 보세요!" >@${reply.user_id}  </textarea>
											<button type="submit" class="input-group-text" id="commInsBtn">댓글 등록</button>
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


<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script type="text/javascript">
function deleteChk() {
	if (confirm("삭제 후에는 복구 할 수 없습니다!\n게시글을 삭제하시겠습니까?") == true){    //확인
/*     document.removefrm.submit();*/
	location.href = "travelDelete.do?t_num=${travelContent.t_num}&t_ref=${travelContent.t_ref}";
 }else{   //취소
     return false;
 }
}

function deleteReplyChk(t_num, t_ref) {
	if (confirm("삭제 후에는 복구 할 수 없습니다!\n댓글을 삭제하시겠습니까?") == true){    //확인
/*     document.removefrm.submit();*/
	location.href = "travelDelete.do?t_num=" + t_num + "&t_ref=" + t_ref;
 }else{   //취소
     return false;
 }
}
</script>




