<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
	
	
<!-- main start -->
	<div style="margin-top: 148px;">
		<section class=" container-fluid py-5 text-center bg-img" style="height:300px; background-image: url('dh_images/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
				</div>
			</div>	
		</section>
		<!-- form 시작 -->
		<div class="row m-5 justify-content-md-center">
			
				
			<form action="commuUpdatePro.do?" method="post" enctype="multipart/form-data">
				<input type="hidden" name="user_id" value="${commu.user_id }">
				<input type="hidden" name="c_num"   value="${commu.c_num }"> <!-- pk 수정하지 않는다. db무결성 문제가능성 -->
				<input type="hidden" name="pageNum" value="${pageNum }">
				<c:forEach items="${imgList }" var="img">
					<input type="hidden" name="b_c_img_num" value="${img.c_img_num }">
				</c:forEach>
				
				<div class="form-group file-group" id="file-list">
					<div class="file-add">
						<a href="#this" onclick="addFile()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 파일추가</a>
					</div>
					<c:forEach items="${imgList}" var="img">
						<div class="file-input">
							<span class="glyphicoin glyphicon-camera" aria-hidden="true"></span>
							<img src="<%=context %>/${img.c_img_path}">
							<input type="hidden" name="c_img_num " value="${img.c_img_num }">
							<a href='#this' name='file-delete'>삭제</a>
						</div>
					</c:forEach>
				</div>
				<!-- 이미지 미리보기 script -->
				<script type="text/javascript">
					$(document).ready(function() {
						$("a[name='file-delete']").on("click", function(e) {
							e.preventDefault();
							deleteFile($(this));
						});
					})
					function addFile() {
						var str = "<div class='file-input'><input type='file' name='file'><a href='#this' name='file-delete'>삭제</a></div>";
						$("#file-list").append(str);
						$("a[name='file-delete']").on("click", function(e) {
							e.preventDefault();
							deleteFile($(this));
						});
					}
					function deleteFile(obj) {
						obj.parent().remove();
					}
				</script>
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="9" name="c_content"  placeholder="게시글 내용을 입력하세요d">${commu.c_content }</textarea>
				</div>
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="1" name="c_hash"     placeholder="태그를 입력하세요. 입력 예시 : #제주도#음식#카페">${commu.c_hash }</textarea>
				</div>
				<div class="mt-5 row">
					<div class="col-md-6">
						<button type="reset" class="btn btn-secondary btn-block" style="width: 100%; height: 50px;">취소</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success btn-block" style="width: 100%;  height: 50px;">수정</button>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
</body>
</html>