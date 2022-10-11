<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
String context = request.getContextPath();
%>
<body>
	<div class="modal-header">
		<div class="modal-title" style="width: 3000px;">
			<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="${member.user_img }" style="height: 30px; margin-right: 5px;">
			<span class="mt-2">${commu.user_id }</span>
			<!-- dropdown menu는 작성자만 수정 삭제 접근가능, else alert("작성자만 수정 삭제 가능합니다.") -->
			<div class="dropdown" style="float: right;">
  				<button class="btn btn-icon-only" type="button" data-bs-toggle="dropdown" aria-expanded="false">
  					<span class="bi bi-three-dots-vertical"></span>
  				</button>
  				<ul class="dropdown-menu">
    				<li><a class="dropdown-item" href="javascript:void(0);" onclick="chkSessionUpdate();" style="text-align: center;">수정</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);" onclick="chkSessionDelete();" style="text-align: center;">삭제</a></li><!-- href='javascript:void(0);confirm();' onclick="ConfirmDel(); -->
  				</ul>
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
			</div>
		</div>
        
<!--         <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button> -->
    </div>
    <div class="modal-body container justify-content-md-center">
    	<c:forEach var="image" items="${imgList }" varStatus="status">
    		<div class="row"> <img class="rounded" src="<%=context %>/${image.c_img_path }"></div>
    	</c:forEach>
    </div>
    <div class="modal-footer">
	    <div class="container">
		    <div class="row mt-2">
				<p class="col">${commu.c_content }</p>
			</div>
			<hr>
			<div class="row">
				<div class="col mt-2">
					<c:forEach var="hash" items="${hashTagArray }">
						<a href="<%=context %>/commuSearchList.do?searchWord=${hash}">#${hash }</a>
					</c:forEach>
				</div>
				<div class="col-2 mt-2" style="text-align: right; float: right;">${commu.c_date }</div>
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
</body>
</html>