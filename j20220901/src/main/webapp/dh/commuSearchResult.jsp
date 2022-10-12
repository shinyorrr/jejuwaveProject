<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<title>JEJU WAVE</title>
<%
   String context = request.getContextPath();
%>
<!-- header import -->
<c:import url="${context}/header.jsp"></c:import>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">		
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<section class="container-fluid py-5 text-center bg-img" style="height:300px; margin-top:148px; background-image: url('dh_images/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
				</div>
			</div>	
	</section>
	<main role="main" class="container">
      <section class="jumbotron text-center">
        <div class="container mt-5">
          <h1 class="jumbotron-heading">검색결과</h1>
          <p class="lead text-muted">'${searchWord }' (이)가 포함된 게시글</p>
        </div>
      </section>
        <!-- 검색box -->
		<div class="col-md-auto Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
					<form action="<%=context %>/commuSearchList.do">
						<div width="300px" class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
							<span class="CommonIconSet__InitialIcon-sc-15eoam-0 CommonIconSet__MagnifierGrayIconContent-sc-15eoam-1 jZNHYY QjNCN"></span>
							<button></button>
							<input type="text" name="searchWord" placeholder="검색어를 입력하세요">
						</div>
					</form>
				</div>
	  <!-- 검색결과 list -->
      <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
          <c:if test="${totCnt > 0 }">
			<c:forEach  var="commu" items="${list }" varStatus="status">
	            <div class="col-md-4">
	              <div class="card mb-4 box-shadow">
	                <button class="nav-link" data-remote="<%=context%>/commuContent.do?c_num=${commu.c_num}&pageNum=${currentPage}" class="" data-bs-toggle="modal" data-bs-target=".bd-modal-lg">
			          <img class="rounded card-img-top" src="${imgList[status.index].c_img_path }">
					</button>
	                <div class="card-body">
	                  <p class="card-text"><img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="${userImgList[status.index].user_img }" style="height: 30px; margin-right: 5px;">${commu.user_id }</p>
	                  <p class="card-text">${commu.c_content }</p>
	                  <div class="d-flex justify-content-between align-items-center">
	                    <div class="hash-group">
	                      <c:forEach var="hashs" items="${hashList[status.index]}">
								<c:forEach var="hash" items="${hashs }">
									<a href="<%=context %>/commuSearchList.do?searchWord=${hash}">#${hash} &nbsp;</a>
								</c:forEach>
						  </c:forEach>
	                    </div>
	                    <small class="text-muted">${commu.c_date }</small>
	                  </div>
	                </div>
	              </div>
	            </div>
	                    <!-- Modal page-->
						<div class="col-md-auto modal bd-modal-lg fade" tabindex="-1" role="dialog" aria-labelledby="bd-modal-lg" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg" >
								<div class="modal-content">

								</div>
							</div>
					    </div>
					    <!-- deleteModal -->
						<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">게시글 삭제</h5>
						        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        게시글을 정말로 삭제하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button type="button" class="btn btn-primary" onclick="location.href='<%=context%>/commuDeletePro.do?c_num=${commu.c_num}&pageNum=${currentPage}'">삭제</button>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- end modal -->
						<!-- Call modalContent.jsp Script -->
						<script>
							$('.bd-modal-lg').on('show.bs.modal', function(e) {
						
								var button = $(e.relatedTarget);
								var modal = $(this);
								
								modal.find('.modal-content').load(button.data("remote"));
						
							});
						</script>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt == 0 }">
				<div style="text-align: center;"><img src="images/no-data.png" ></div>
			</c:if>
			<!-- list end -->
				<!-- page nav -->
				<nav aria-label="Page navigation example"
					class="d-flex justify-content-center">
					<ul class="pagination" id="pageNumColor">
						<c:if test="${startPage > blockSize}">
							<li class="page-item"><a class="page-link"
								href='<%=context%>/commuSearchList.do?searchWord=${searchWord }&pageNum=${startPage-blockSize}'
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<li class="page-item"><a class="page-link"
								href='<%=context%>/commuSearchList.do?searchWord=${searchWord }&pageNum=${i}'>${i}</a></li>
						</c:forEach>
						<c:if test="${endPage < pageCnt}">
							<li class="page-item"><a class="page-link"
								href='<%=context%>/commuSearchList.do?searchWord=${searchWord }&pageNum=${startPage+blockSize}'
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
			    </nav>
		    </div>
          </div>
        </div>
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