<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<title>Insert title here</title>
<% 
String context = request.getContextPath();
%>


<c:import url="${context}/header.jsp"></c:import>



<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">		
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	.searchLabel {
		border-color:transparent;
		padding: 6px 25px;
 		background-color:#FF3500;
 		border-radius: 4px;
		color: white;
		cursor: pointer;
	}
	#searchBox {
		height: 36px;
		padding: 5px;
	}
</style>


<!-- 커뮤니티 무한스크롤 ajax-->
<script type="text/javascript">
var count = 2;
$(window).scroll(function(){
	let scrollLocation = document.documentElement.scrollTop; //현재 스크롤 바 위치
	let windowHeight = window.innerHeight;                   //화면으로 보이는 스크린 화면의 높이
	let fullHeight = document.body.scrollHeight;             // 웹 문서 중 body의 스크롤 높이
	//50 은 웹페이지 margin값
	if(scrollLocation + windowHeight >= fullHeight - 50) {	/* ($(window).scrollTop() == $(document).height() - $(window).height()) */
		$.ajax({ 
			url: "<%=context%>/commuListScroll.do?pageNum="+count,
			success: function(result){
						$("#scroll").append(result);
						count = count+1;
					}
		});
	}
});	
console.log(count);

</script>

<script type="text/javascript">
	function chkSessionUpdate() {
		var sessionUser_id = '<c:out value="${sessionUser_id}"/>';
		console.log(sessionUser_id);
		var WriterUser_id = '<c:out value="${commu.user_id}"/>'; 
		console.log(WriterUser_id);
		if (sessionUser_id == WriterUser_id) {
			location.href="<%=context%>/commuUpdateForm.do?c_num=${commu.c_num}&pageNum=${currentPage}";
		}
		else if (sessionUser_id == null) {
			alert('로그인을 한 후 게시글을 수정할 수 있습니다.');
		}
		else {
			alert('작성자만 게시글을 수정할 수 있습니다.');
		}
	}
	function chkSessionDelete() {
		var sessionUser_id = '<c:out value="${sessionUser_id}"/>';
		console.log(sessionUser_id);
		var WriterUser_id = '<c:out value="${commu.user_id}"/>'; 
		console.log(WriterUser_id);
		if (sessionUser_id == WriterUser_id) {
			$("#deleteModal").modal('show');
		}
		else if (sessionUser_id == null) {
			alert('로그인을 한 후 게시글을 삭제할 수 있습니다.');
		}
		else {
			alert('작성자만 게시글을 삭제할 수 있습니다.');
		}
	}
</script>
</head>
<body>

<!-- main start -->	
	<main style="margin-top: 148px;">
		<!-- main 상단 고정이미지 -->
		<section class=" container-fluid py-5 text-center bg-img" style="height:300px; background-image: url('dh_images/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
				</div>
			</div>	
		</section>
		<!-- 검색창 -->
		<section class="container">
			<div class="row m-5 justify-content-md-center">	
				<div class="col-md-auto Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
					<form action="<%=context %>/commuSearchList.do">
						<!-- <button type="submit" class="searchLabel">검색</button>
						<input id="searchBox" type="text" placeholder="검색어를 입력하세요" name="searchWord"> -->
						<div width="300px" class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
							<span class="CommonIconSet__InitialIcon-sc-15eoam-0 CommonIconSet__MagnifierGrayIconContent-sc-15eoam-1 jZNHYY QjNCN"></span>
							<button></button>
							<input type="text" name="searchWord" placeholder="검색어를 입력하세요">
						</div>
					</form>
				</div>
			</div>	
			<!-- list start -->
			<c:if test="${totCnt > 0 }">
				<c:forEach var="commu" items="${list }" varStatus="status">	
					<div class="row m-5 justify-content-md-center" >	
						
						<div class="col-md-auto"  style="max-width: 580px;">
							<div class="card shadow-sm" >
								<div class="card-header d-flex">
									<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="${userImgList[status.index].user_img }" style="height: 30px; margin-right: 5px;">
									<span class="mt-2">${commu.user_id }</span>
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
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt == 0 }">
				<h1>데이터가 없네</h1>
			</c:if>
			<!-- end list -->
			<div id="scroll"></div>
		</section>
	</main>
	
	
	
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
</body>
</html>