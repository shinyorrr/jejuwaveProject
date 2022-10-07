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
    				<li><a class="dropdown-item" href="<%=context%>/commuUpdateForm.do?c_num=${commu.c_num}&pageNum=${currentPage}" style="text-align: center;">수정</a></li>
					<li><a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#deleteModal" style="text-align: center;">삭제</a></li><!-- href='javascript:void(0);confirm();' onclick="ConfirmDel(); -->
  				</ul>
			</div>
		</div>
        
<!--         <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
        	<span aria-hidden="true">&times;</span>
        </button> -->
    </div>
    <div class="modal-body container justify-content-md-center">
    	<c:forEach var="image" items="${imgList }">
    		<div class="row"> <img class="rounded" src="<%=context %>/${image.c_img_path }"></div>
    	</c:forEach>
    </div>
    <div class="modal-footer">
	    <div class="container">
		    <div class="row mt-2">
				<p class="col">${commu.c_content }</p>
			</div>
			<hr>
			<div class="row d-flex">
				<div class="col-10 mt-2">##${commu.c_hash }</div>
				<div class="col-2 ml-auto " style="text-align: right;">${commu.c_date }</div>
			</div>
		</div>
    </div>
</body>
</html>