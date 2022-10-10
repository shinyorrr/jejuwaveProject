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
<style type="text/css">
	#file-list {
		border: 1px solid #ced4da;
		min-height: 410px;
		border-radius: 0.25rem;
	}
	.file-input {
		display:inline-block;
		position:relative;
		width:300px;height:328px;
		margin:40px;
		border-radius:0.25rem;
		z-index:1
	}
	.preview {
		width:100%;
		height:304px;
		z-index:none;
		border: 0px;
		border-radius: 0.25rem;
	}
	input[type=file]::file-selector-button {
		position: absolute;
		left:0px;
		bottom:0px;
		z-index:999;
		border-color:transparent;
		padding: 6px 25px;
 		background-color:#FF3500;
 		border-radius: 4px;
		color: white;
		cursor: pointer;
	}
	
	.addFile {
		height: 40px;
		padding: 6px 25px;
 		background-color:#FF3500;
 		border-radius: 4px;
		color: white;
		cursor: pointer;
	}
	a:hover {
	color: white;
	}
	.delFile {
		height:40px;
		background-color:#707070;
 		border-radius: 4px;
		color: white;
		cursor: pointer;
		position: absolute;
		right:0px;
		bottom:0px;
		padding: 7px 25px 6px 25px;
		z-index:999;
	}
	.file-add {
		margin-top: 10px;
	}
	.btn-submit {
		background-color: #FF3500;
		color: white;
	}
	.btn-submit:hover {
		color: white;
	}
	.btn-reset {
		background-color:#5c636a;
		color: white;
	}
	.btn-reset:hover {
		color: white;
	}
	
</style>
<!-- 사진파일 없는 경우 chk script -->
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
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
				</div>
			</div>	
		</section>
		<!-- form 시작 -->
		<div class="row m-5 justify-content-md-center">
			<form action="commuWritePro.do?pageNum=${pageNum }" method="post" enctype="multipart/form-data" onsubmit="return fileListChk();">
				<input type="hidden" name="user_id" value="${sessionUser_id }">
				<div class="form-group file-group" id="file-list">
				</div>
				<div class="file-add">
					<a href="#this" onclick="addFile()" class='addFile'>파일추가</a>
				</div>
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="9" name="c_content" placeholder="게시글 내용을 입력하세요." required="required"></textarea>
				</div>
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="1" name="c_hash"    placeholder="태그를 입력하세요. (띄어쓰기로 구분)" required="required"></textarea>
				</div>
				
				<!-- 확인 취소 -->
				<div class="mt-5 row">
					<div class="col-md-6">
						<button type="reset" class="btn btn-reset btn-block" style="width: 100%; height: 50px;">취소</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-submit btn-block" style="width: 100%;  height: 50px;">확인</button>
					</div>
				</div>
			</form>
			
			<!-- 사진파일 미리보기 script -->
			<script type="text/javascript">
					var count = 0;
					$(document).ready(function() {
					$("a[name='file-delete']").on("click", function(e) {
						e.preventDefault();
						deleteFile($(this));
					});
				})
				
				function addFile() {
					count++;
					var str = "<div class='file-input'><input id='inputFile' type='file' name='file' onchange='readURL(this);'><img id='preview"+ count +"' class='preview' /><a href='#this' name='file-delete' class='delFile'>파일 삭제</a></div>";
					$("#file-list").append(str);
					$("a[name='file-delete']").on("click", function(e) {
						e.preventDefault();
						deleteFile($(this));
					});
				}
				
				function deleteFile(obj) {
					obj.parent().remove();
				}
			
				function readURL(input) {
					  if (input.files && input.files[0]) {
					    var reader = new FileReader();
					    reader.onload = function(e) {
					      document.getElementById('preview'+count).src = e.target.result;
					    };
					    reader.readAsDataURL(input.files[0]);
					  } else {
					    document.getElementById('preview'+count).src = "";
					  }
				}
			</script>
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