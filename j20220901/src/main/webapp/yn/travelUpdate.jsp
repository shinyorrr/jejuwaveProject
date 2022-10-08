<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
String context = request.getContextPath();
%>
<c:import url="${context}/header.jsp"></c:import>
<link rel="stylesheet" href="yncss/trList.css" type="text/css">
	
	
	
	
<form action="travelUpdatePro.do" method="post" enctype="multipart/form-data">
<!------------------ body 영역 ------------> 	
<input type="hidden" name="t_num" value="${travelContent.t_num}">

<!-- cateImg -->
<div class="mb-6" >
<header class=" py-5 mb-5" 
		style="background-image: url('images/travelerList_cate.jpg'); margin-top:148px; background-size: cover;">
	<div class="container px-4 px-lg-5 mt-5 mb-5" >
		<div class="text-center text-white">
			<h3 class="display-5 fw-bolder">동행자게시판</h3>
			<p class="lead fw-normal text-white-50 mb-0">함께해요 제주</p>
		</div>
	</div>
</header>
<div class="container mt-5 mb-5">
	<div class="row justify-content-center">
		<div class="col-lg-8">


			<div class="border rounded p-5  mb-5 " style="background:white; 	border: #EAEAEA 1px;">


			<!-- 테마선택 체크박스 -->
				<div class=" form-check form-check-inline mt-0 mb-3">
		  			<span class="fw-bold align-middle me-5">테마 선택</span>
					<div class=" form-check form-check-inline my-0">
						<input name="t_gubun" value="숙박" type="radio" class="form-check-input my-1" id="inlinCheckbox1" 
								<c:if test="${travelContent.t_gubun eq '숙박'}"> checked </c:if>>
						<label class="form-check-label ms-1 me-2 align-middle" for="inlineCheckbox1" >숙박</label>
						
					</div>
					<div class=" form-check form-check-inline ">
						<input name="t_gubun" value="레저" type="radio" class="form-check-input my-1" id="inlinCheckbox2"
								<c:if test="${travelContent.t_gubun eq '레저'}"> checked </c:if>>
						<label class="form-check-label ms-1 me-2 align-middle" for="inlineCheckbox2" >레저</label>
					</div>
					<div class=" form-check form-check-inline">
						<input name="t_gubun" value="맛집" type="radio" class="form-check-input my-1" id="inlinCheckbox3" 
								<c:if test="${travelContent.t_gubun eq '맛집'}"> checked </c:if>>
						<label class="form-check-label ms-1 me-2 align-middle" for="inlineCheckbox3" >맛집</label>
					</div>
					<div class=" form-check form-check-inline ">
						<input name="t_gubun" value="카풀" type="radio" class="form-check-input my-1" id="inlinCheckbox4" 
								<c:if test="${travelContent.t_gubun eq '카풀'}"> checked </c:if>>
						<label class="form-check-label ms-1 	me-2 align-middle" for="inlineCheckbox4" >카풀</label>
					</div>
				</div>
				<div class=" form-check form-check-inline mt-0 mb-3">
		  			<span class="fw-bold align-middle me-5">인원 선택</span>
					<div class=" form-check form-check-inline my-0 mx-0 px-0">
					<input name="t_person" type="range"  min="1" max="8" step="1"
					oninput="document.getElementById('valueP').innerHTML=this.value;" value="${travelContent.t_person}" class="form-range mx-0 px-0 size-small my-1" style="width:520px; height:15px;">
					<span class="ms-4" id="valueP">${travelContent.t_person}</span><span>명</span>
					</div>
				</div>
				
				
				
				
		
				
				
				
 				<div class=" form-check form-inline my-0">
		  			<span class="fw-bold align-middle me-5">날짜 선택</span>
		  			
					<div class="  my-0 mx-0 px-0" style="display:inline;">
						<input name="t_start" type="date" class="me-0" id="input_from" style="width:35%; height:34px;"
								value="${travelContent.t_start}">
						-
						<input name="t_end" type="date" class=" ms-0" id="input_to" style="width:35%;height:34px;"
								value="${travelContent.t_end}">
					</div>
				</div>
			</div>
					
			<%-- <!-- 파일등록 -->
			<div class="form-group " style="margin: 8px 0 8px;">
				<input  id="fileName" class="form-control mx-0" value="파일선택" disabled="disabled" style="width:85%; display: inline;">
				<div class="fileRegiBtn" style="display:inline;">
					<label for="myFileUp">파일등록하기</label>
					<input name="t_img" type="file" id="myFileUp" >
					<input type="hidden" name="t_oriImg" value="${travelContent.t_img}">
				</div>
			</div>
					
			<div class="bg-light mb-4 p-0 rounded selectCover" style="height:220px;">
				<img id="cover" src="${travelContent.t_img}" style="width:100%;height:220px; object-fit:cover; border-radius:4px;">
			</div> --%>
			
			<div  style="margin: 8px 0 8px;">
				<label for="t_img" style="width:100%; height: 320px;object-fit:cover;">
					<div id="image-upload-box" style="width:100%; "> <!-- 영역, 테두리 -->
						<img src="${travelContent.t_img}">
					</div>
				</label>
				<input type="hidden" name="t_oriImg" value="${travelContent.t_img}">
				<input style="object-fit:cover; display:none;" type="file" id="t_img" 
						 name="t_img" accept=".jpg, .png, .jpeg, .gif" multiple="false">
			</div>	
					


				<div class="mb-2">
					<input name="t_title" class="form-control form-control-lg" type="text" style="font-size: 14px;"
							value="${travelContent.t_title}" aria-label=".form-control-lg example">
				</div>
				<div class="mb-3">
					<textarea name="t_content" class="form-control form-control-lg col-sm-12" style="font-size: 14px;"
							rows="10" >${travelContent.t_content}</textarea>
				</div>
				<div style="display: flex; width: 100%;">
					<button type="reset" onClick="history.go(-1)"class="btn btn-light text-align-left p-3 me-0 mb-5"  
							style="width:80%; float:left; background: #e2e2e2;">
						취소</button>
					<button type="submit" onclick="return chkAll()"
					class="btn ms-3 p-3 me-0 mb-5" id="filterBtn" style="width:80%;float:right;">
						완료</button>
				</div>  			
			</div>

		</div>
	</div>	
</div>
</form>


<div style="margin-top: 200px;"></div>
<%@ include file="../footer.jsp"%>

<!-- my JS-->
<script type="text/javascript">

/* 여행기간, 제목, 내용 체크 함수 */
function chkAll() {
	console.log('chkAll 함수 시작');
	if(frm.t_start.value == "" || frm.t_end.value == "") {
		console.log(document.frm.t_start.value);
		alert("여행 기간을 선택해 주세요!");
		frm.t_start.focus();
		return false;
	} if(frm.t_content.value == "" || frm.t_title.value == "") {
		alert("제목, 내용을 입력해 주세요!");
		frm.t_title.focus();
		return false;
		
	}
	return true;
}
/* 이미지업로드 */
var Imageinput = document.getElementById("t_img");
Imageinput.addEventListener("change", updateImageDisplay);

function updateImageDisplay() {
  var image = Imageinput.files;

  var imgContainer = document.getElementById("image-upload-box");
  while (imgContainer.firstChild) { imgContainer.removeChild(imgContainer.firstChild); }
  var displayImage = document.createElement("img");
  
  displayImage.src = window.URL.createObjectURL(image[0]);
  imgContainer.append(displayImage);
  displayImage.setAttribute("style","width: 100%; object-fit:cover; height: 320px;"); 
}
</script>
<!-- Core theme JS-->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="yncss/bootstrap.min.js"></script>
<script type="text/javascript" src="yncss/trWrite.js"></script>