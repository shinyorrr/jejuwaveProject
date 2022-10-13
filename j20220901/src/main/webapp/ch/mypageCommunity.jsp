<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file = "header.jsp" %>
<meta charset="UTF-8">
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


<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR+Ligth:wght@300;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageCommunity.css?after">
<style type="text/css">
	table {
		width: 100%;
	}
</style>
<script type="text/javascript" src = "https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function(){
		$('.button_delete').click(function(){
			var c_num 	= $('#c_num').val();
			var ans 	= confirm("삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				url 	: "mypageCommunityDelete.do?c_num=" + c_num,
				dataType: 'html',
				success	: function(data){
						location.reload();
				}
			});
		});
	});

</script>
<!-- session chk functions -->
<script type="text/javascript">
	//수정 버튼 session chk
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
	//삭제 버튼 session chk
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

<div class = "main" style="background-color: rgb(248,248,248);">
<main id = "content" style="background-color: rgb(248,248,248);">
	<!-- Modal page-->
						<div class="col-md-auto modal bd-modal-lg fade" tabindex="-1" role="dialog" aria-labelledby="bd-modal-lg" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg">
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
	<!-- 사이드바 구현 -->
	<div class = "mypage_set">
		<div class="Mypage_Main">
			<div class="Menu_section">
				<div class="Menu__profile">
					<div class="Profiles_image">
						<c:if test="${img_sub eq 'null'}">
							<span><img id="target_img" src="<%=context%>/images/vector_profile_default.svg"></span>
						</c:if>
						<c:if test="${img_sub ne 'null'}">
							<span><img id="target_img" src="<%=context%>/${img}" width = "200px"></span>
						</c:if>
						<span class = "user_id">	
						<c:if test="${user_id != null}">
							${user_id }
						</c:if>
						</span>
					</div>
				</div>
				<div class = "menu_link">
					<ul class="mypage_menu">
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageUpdate.do">
								<span class="mypage_name">계정관리</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageTraveler.do">
								<span class="mypage_name">내 동행게시글</span>
							</a>
						</li>
						<li class="link_mypage_community">
							<a class="link index_link" href="<%=context%>/mypageCommunity.do">
								<span class="mypage_name" id = "comunity_side">내 커뮤니티글</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageBoard.do">
								<span class="mypage_name">내 게시글</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageComment.do">
								<span class="mypage_name">내 코멘트</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 각 화면이 달라지는 부분 -->
			<div class="content_section">
				<h2 class = "mypage_menu_h2">내 커뮤니티</h2>
					<div class = "communityForm">
					
						<!-- 일괄삭제 구현 -->					
						<form action="<%=context%>/mypageAlldelete.do" method="post">
						<c:if test="${ totCnt > 0}">
							<c:forEach var="board" items="${list }">
								<table style = "border-bottom = 1px solid rgb(204,204,204)">
								<%-- 		<tr style= " cursor: pointer" onclick="location.href='commuContent.do?c_num=${board.c_num}&pageNum=${currentPage}';"> --%>
									
										<tr>
											<td rowspan="3" width = 50>
												<input type="text" id = "c_num" value = "${board.c_num }" hidden="true">
												<input type="checkbox" name = "commuChk" value="${board.c_num }">
												 <button type="button" class="nav-link" data-remote="commuContent.do?c_num=${board.c_num}&pageNum=${currentPage}" class="" data-bs-toggle="modal" data-bs-target=".bd-modal-lg">
												<div class = "imgboxform">
													<img class = "imgbox" src="<%=context%>/${board.c_img_path }" width = "120px" padding-bottom = 10px>
												</div>
												</button>
											</td>
											<td class = "dealstatusTd" width = 90>
												<div class = "dealstatus">
													${board.c_hash}	
												</div>
											</td>
											<td>
												<div class = "community_date">
													<fmt:formatDate value="${board.c_date}" pattern="yy-MM-dd"/>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="3" width = 2000>
										 <button type="button" class="nav-link" data-remote="commuContent.do?c_num=${board.c_num}&pageNum=${currentPage}" class="" data-bs-toggle="modal" data-bs-target=".bd-modal-lg">
												<div class = "t_content">
													${board.c_content}
												</div>
										</button>
											</td>
										<tr>
											<td colspan="2">
												<div class = "button_updateform">
													<button type="button" class = "button_update" onclick="location.href = '<%=context%>/commuUpdateForm.do?c_num=${board.c_num }'" >수정</button>
												</div>
												<div>
													<button type="button" class = "button_delete" >삭제</button>
												</div>
											</td>
										</tr>
										<c:set var="startNum" value="${startNum - 1}" />
								</table>
						</c:forEach> 
					</c:if>
					<input type="submit" class = "allDel" value="삭제">
					</form>
					<form action="mypageCommunity.do">
						<div class="search_form">
							<input type ="text"  class="search_input"	name="search" placeholder="제목 + 해시태그">
							<div class = "search_image">
								<input type ="submit" class = "search_submit" value="">
							</div>
						</div>
					</form>
					</div>
						
						
				<!-- 페이지 버튼 구현 -->
				
				<div style="text-align: center; padding-top: 20px;">
				<c:if test="${startPage > blockSize }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageCommunity.do?pageNum=${startPage-1 }'"
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">이전</button>
				</c:if>
				<c:forEach var="i" begin = "${startPage }" end = "${endPage }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageCommunity.do?pageNum=${i }'" 
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">${i }</button>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageCommunity.do=${startPage+1 }'"
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">[다음]</button>
				</c:if>
				</div>
			</div>
		</div>
	</div>
</main>
</div>
<footer class="py-5 bg-dark" style="top: 180%;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
</footer>
</body>
</html>