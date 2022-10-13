<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JEJU WAVE 커뮤니티</title>
<!-- jQuery -->
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
</head>
<% 
String context = request.getContextPath();
%>
<!-- chk script -->
<script type="text/javascript">
	//삭제버튼 chk msg
	function chkDelete() {
		if (!confirm("정말로 삭제하시겠습니까?")) {
        } else {
            location.href="<%=context%>/commuDeletePro.do?c_num=${commu.c_num}&pageNum=${currentPage}"
        }
	}
</script>
<body>
	<div class="modal-header">
		<div class="modal-title" style="width: 3000px;">
			<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="${member.user_img }" style="height: 30px; margin-right: 5px;">
			<span class="mt-2">${commu.user_id }</span>
  			<c:if test="${sessionUser_id == commu.user_id}">
				<!-- dropdown menu -->
				<div class="dropdown" style="float: right;">
	  				<button class="btn btn-icon-only" type="button" data-bs-toggle="dropdown" aria-expanded="false">
	  					<span class="bi bi-three-dots-vertical"></span>
	  				</button>
	  				<ul class="dropdown-menu">
	    				<li><a class="dropdown-item" href="<%=context%>/commuUpdateForm.do?c_num=${commu.c_num}&pageNum=${currentPage}" style="text-align: center;">수정</a></li>
						<li><a class="dropdown-item" href="javascript:void(0);" onclick="chkDelete();" style="text-align: center;">삭제</a></li><!-- href='javascript:void(0);confirm();' onclick="ConfirmDel(); -->
	  				</ul>
				</div>
			</c:if> 
		</div>
    </div>
    <div class="modal-body container justify-content-md-center" style="padding-bottom: 0px">
    	<c:forEach var="image" items="${imgList }" varStatus="status">
    		<div class="row"> <img class="" style="border-radius: 0.375rem;" src="<%=context %>/${image.c_img_path }"></div>
    		<div class="white_space" style="min-height: 16px;"></div>
    	</c:forEach>
    </div>
    <div class="modal-footer">
	    <div class="container">
		    <div class="row mt-2">
				<p class="col">${commu.c_content }</p>
			</div>
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
    					
</body>
</html>