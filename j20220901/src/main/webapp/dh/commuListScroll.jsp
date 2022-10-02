<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 커뮤니티 게시판 무한스크롤 불러올 컨텐츠 -->
<% 
	String context = request.getContextPath();
%>
</head>
<body>
			<!-- list start -->
			<c:if test="${totCnt > 0 }">
				<c:forEach var="commu" items="${list }">	
					<div class="row m-5 justify-content-md-center">	
						
						<div class="col-md-auto">
							<div class="card shadow-sm">
								<div class="card-header d-flex">
									<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="dh_images/user.png" style="height: 30px; margin-right: 5px;">
									<span class="mt-2">${commu.user_id }</span>
									<!-- dropdown menu는 작성자만 수정 삭제 접근가능, else alert("작성자만 수정 삭제 가능합니다.") -->
									<div class="dropdown ms-auto">
								  		<button class="btn btn-icon-only" type="button" data-bs-toggle="dropdown" aria-expanded="false">
								  			<span class="bi bi-three-dots-vertical"></span>
								  		</button>
								  		<ul class="dropdown-menu">
								    		<li><a class="dropdown-item" href="#">수정</a></li>
								   			<li><a class="dropdown-item" href="#">삭제</a></li>
								  		</ul>
									</div>
								</div>
								<button class="nav-link" data-remote="<%=context%>/commuContent.do?c_num=${commu.c_num}&pageNum=${currentPage}" class="" data-bs-toggle="modal" data-bs-target=".bd-modal-xl"><img class="rounded card-img-top" src="dh_images/5_2.jpg"></button>								
								<div class="card-body d-flex">
									<p class="card-text">${commu.c_content }</p>
									
								</div>
								<div class="card-footer d-flex">
									<p class="mt-2">#${commu.c_hash }</p>
									<span class="ms-auto mt-2">${commu.c_date }</span>
								</div>
							</div>
						</div>
						<!-- Modal page-->
						<div class="col-md-auto modal bd-modal-xl fade" tabindex="-1" role="dialog" aria-labelledby="bd-modal-xl" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-xl">
								<div class="modal-content">

								</div>
							</div>
					    </div>
						<!-- end modal -->
						<!-- Call modalContent.jsp Script -->
						<script>
							$('.bd-modal-xl').on('show.bs.modal', function(e) {
						
								var button = $(e.relatedTarget);
								var modal = $(this);
								
								modal.find('.modal-content').load(button.data("remote"));
						
							});
						</script>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt == 0 }">
				<h1>데이터가 없네</h1>
			</c:if>
			<!-- end list -->
</body>
</html>