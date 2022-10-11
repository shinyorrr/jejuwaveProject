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
<!-- fontAwesomeIcon CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- this page css -->
<link rel="stylesheet" href="<%= context %>/css/dh/commuUpdateForm.css">
<!-- 사진파일 0개 chk function -->
<script type="text/javascript">
	function fileListChk() {
		if ($('#file-list').is(':empty') || $('#file-list:empty').length || !$.trim( $('#file-list').html() ).length) {
			alert('적어도 한개 이상의 사진파일을 첨부해주세요');
			return false;
		}
	}
</script>
</head>
<body>
	<!-- main start -->
	<div style="margin-top: 148px;">
		<section class=" container-fluid py-5 text-center bg-img" style="height:300px; background-image: url('dh_images/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
				</div>
			</div>	
		</section>
		<!-- form 시작 -->
		<div class="row m-5 justify-content-md-center">
			<form action="commuUpdatePro.do?" method="post" enctype="multipart/form-data" onsubmit="return fileListChk();">
				<!-- 유저아이디 게시글 정보 받기 -->
				<input type="hidden" name="user_id" value="${commu.user_id }">
				<input type="hidden" name="c_num" value="${c_num}">
				<!-- 수정 전 게시글 이미지 번호 받기 -->
				<c:forEach items="${imgList }" var="img">
					<input type="hidden" name="b_c_img_num" value="${img.c_img_num }">
				</c:forEach>
				<!-- 이미지 미리보기가 표시될 부분 -->
				<div class="form-group file-group" id="file-list">
					<!-- 수정 전 게시글 이미지 미리보기와 hidden value(수정전 후 비교를 위함) 삭제하면 hidden value또한 삭제 -->
					<c:forEach items="${imgList }" var="img">
						<div class='file-input'>
							<input type="hidden" name="c_img_num" value="${img.c_img_num }">
							<img src="<%=context %>/${img.c_img_path}" class='preview' />
							<a href='#this' name='file-delete' class='delFile'>파일 삭제</a>
						</div>
					</c:forEach>
				</div>
				<!-- 파일추가 버튼 -->
				<div class="file-add">
					<a href="#this" onclick="addFile()" class='addFile'>파일추가</a>
				</div>
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="9" name="c_content"  placeholder="게시글 내용을 입력하세요" required>${commu.c_content }</textarea>
				</div>
				<!-- 태그는 String 통째로 DB에 insert, 조회시 split 하여 배열로 변환하여 뿌려준다. -->
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="1" name="c_hash"     placeholder="태그를 입력하세요. 입력 예시 : #제주도#음식#카페" required>${commu.c_hash }</textarea>
				</div>
				<div class="mt-5 row">
					<div class="col-md-6">
						<button type="reset" class="btn btn-reset btn-block" style="width: 100%; height: 50px;">취소</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-submit btn-block" style="width: 100%;  height: 50px;">확인</button>
					</div>
				</div>
			</form>
			<!-- 이미지 미리보기 및 파일추가 script -->
			<script type="text/javascript">
				var count = 0; //이미지 미리보기할 파일 고유 번호 초기화 (preview+count)
				$(document).ready(function() {
					$("a[name='file-delete']").on("click", function(e) {
						e.preventDefault();
						deleteFile($(this));
					});
				})
				
				//파일 추가시 input, 미리보기img, 삭제버튼 태그 미리보기 영역(#file-list)에 추가
				function addFile() { 
					count++;
					var str = "<div class='file-input'><input id='inputFile"+count+"' type='file' name='file' onchange='readURL(this);'><img id='preview"+ count +"' class='preview' /><a href='#this' name='file-delete' class='delFile'>파일 삭제</a></div>";
					$("#file-list").append(str);
					$("a[name='file-delete']").on("click", function(e) {
						e.preventDefault();
						deleteFile($(this));
					});
				}
				//삭제 function
				function deleteFile(obj) { 
					obj.parent().remove();
				}
				//input 에 파일이 들어오면 파일 이미지 받아오는 function
				function readURL(input) {
					  var id = $(input).attr('id');
					  var num = id.substring(9);
					  if (input.files && input.files[0]) {
					    var reader = new FileReader();
					    reader.onload = function(e) {
					      document.getElementById('preview'+num).src = e.target.result;
					    };
					    reader.readAsDataURL(input.files[0]);
					  } else {
					    document.getElementById('preview'+num).src = "";
					  }
				}
			</script>
		</div>
	</div>
	<!-- footer -->
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
</body>
</html>