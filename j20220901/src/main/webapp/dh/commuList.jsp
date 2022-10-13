<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<title>JEJU WAVE 커뮤니티</title>
<% 
String context = request.getContextPath();
%>
<!-- header import -->
<c:import url="${context}/header.jsp"></c:import>
<!-- bottSTrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">		
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- this page css -->
<link rel="stylesheet" href="<%= context %>/css/dh/commuList.css">

</head>
<body>
<!-- main start -->	
	<main style="margin-top: 148px;">
		<!-- main 상단 고정이미지 -->
		<section class=" container-fluid py-5 text-center bg-img" style="height:300px; background-image: url('dh_images/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
				</div>
			</div>	
		</section>
		<section class="container">
			<!-- 검색창 -->
			<div class="row m-5 justify-content-md-center">	
				<div class="col-md-auto Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
					<form action="<%=context %>/commuSearchList.do">
						<div width="300px" class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
							<span class="CommonIconSet__InitialIcon-sc-15eoam-0 CommonIconSet__MagnifierGrayIconContent-sc-15eoam-1 jZNHYY QjNCN"></span>
							<button></button>
							<input type="text" name="searchWord" placeholder="검색어를 입력하세요" required="required">
						</div>
					</form>
				</div>
			</div>	
			<!-- list start -->
			<c:if test="${totCnt > 0 }">
				<c:forEach var="commu" items="${list }" varStatus="status">	
					<div class="row m-5 justify-content-md-center" >	
						
						<div class="col-md-auto"  style="max-width: 580px; min-width: 580px;">
							<div class="card shadow-sm" >
								<div class="card-header d-flex">
									<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="${userImgList[status.index].user_img }" style="height: 30px; width:30px; margin-right: 10px;">
									<span class="" style="margin-top: 5px;">${commu.user_id }</span>
								</div>
								<button class="nav-link" data-remote="<%=context%>/commuContent.do?c_num=${commu.c_num}&pageNum=${currentPage}" class="" data-bs-toggle="modal" data-bs-target=".bd-modal-lg">
			<!-- 게시글이미지 -->	<img class="rounded card-img-top" src="${imgList[status.index].c_img_path }">
								</button>								
								<div class="card-body d-flex">
									<p class="card-text">${commu.c_content }</p>
								</div>
								<div class="card-footer d-flex">
								<c:forEach var="hashs" items="${hashList[status.index]}">
									<c:forEach var="hash" items="${hashs }">
										<p class="mt-2"><a href="<%=context %>/commuSearchList.do?searchWord=${hash}">#${hash} &nbsp;</a></p>
									</c:forEach>
								</c:forEach>
									<span class="ms-auto mt-2">${commu.c_date }</span>
								</div>
							</div>
						</div>
						<!-- Modal page (게시글 리스트 클릭시 팝업될 게시글 상세내용 modal 틀-->
						<div class="col-md-auto modal bd-modal-lg fade" tabindex="-1" role="dialog" aria-labelledby="bd-modal-lg" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg" >
								<div class="modal-content">

								</div>
							</div>
					    </div>
						<!-- end modal -->
						<!-- Call modalContent.jsp Script 게시글 상세내용 팝업을 위한 script-->
						<script>
							$('.bd-modal-lg').on('show.bs.modal', function(e) {
								var button = $(e.relatedTarget);
								var modal = $(this);
								modal.find('.modal-content').load(button.data("remote"));
							});
						</script>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt == 0 }">
				<div style="text-align: center;"><img src="images/no-data.png" ></div>
			</c:if>
<!-- end list -->
			<!-- page 이동 nav -->
			<nav aria-label="Page navigation example"
			class="d-flex justify-content-center">
			<ul class="pagination" id="pageNumColor">
				<c:if test="${startPage > blockSize}">
					<li class="page-item"><a class="page-link"
						href='<%=context%>/commuList.do?pageNum=${startPage-blockSize}'
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li class="page-item"><a class="page-link"
						href='<%=context%>/commuList.do?pageNum=${i}'>${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<li class="page-item"><a class="page-link"
						href='<%=context%>/commuList.do?pageNum=${startPage+blockSize}'
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
		</section>
	</main>
	<!-- footer -->
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
</body>
</html>