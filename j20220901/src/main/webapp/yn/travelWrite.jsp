<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="dbError.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% String context = request.getContextPath();%>
<link rel="stylesheet" href="yncss/trList.css" type="text/css">	

<script type="text/javascript">
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
function readURL(input) {
	console.log("버튼클릭함1");
	if (input.files && input.files[0]) {
	var reader = new FileReader();
	reader.onload = function (e) {
					$('#cover').attr('src', e.target.result);        //cover src로 붙여지고
					$('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
					}
	reader.readAsDataURL(input.files[0]);
	}
}

$("#myFileUp").change(function(){
	readURL(this);
	console.log("이미지 바뀜?");
})
	
function ShowSliderValue(sVal){	
	var obValueView = document.getElementById("slider_value_view");	
	obValueView.innerHTML = sVal
}

function getStartDate()  {
  const input_from = document.getElementById('input_from').value;
  document.getElementById("input_to").setAttribute("min", input_from);
}

function getSysdate() {
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000;
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("input_from").setAttribute("min", today);
}
</script>	

</head>
<c:import url="${context}/header.jsp"></c:import>
<form name="frm" action="travelWritePro.do" method="post" enctype="multipart/form-data">

<!---------------------------- body 영역 --------------------------------> 	


<!-- cateImg -->
<div class="mb-6" >
<header class=" py-5 mb-5" 
		style="background-image: url('images/travelerList_cate.jpg'); margin-top:148px;background-size: cover;">
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
						<input name="t_gubun" value="숙박" type="radio" class="form-check-input my-1" id="inlinCheckbox1" >
						<label class="form-check-label ms-1 me-2 align-middle" for="inlineCheckbox1">숙박</label>
					</div>
					<div class=" form-check form-check-inline ">
						<input name="t_gubun" value="레저" type="radio" class="form-check-input my-1" id="inlinCheckbox2">
						<label class="form-check-label ms-1 me-2 align-middle" for="inlineCheckbox2">레저</label>
					</div>
					<div class=" form-check form-check-inline">
						<input name="t_gubun" value="맛집" type="radio" class="form-check-input my-1" id="inlinCheckbox3" checked>
						<label class="form-check-label ms-1 me-2 align-middle" for="inlineCheckbox3" >맛집</label>
					</div>
					<div class=" form-check form-check-inline ">
						<input name="t_gubun" value="카풀" type="radio" class="form-check-input my-1" id="inlinCheckbox4" >
						<label class="form-check-label ms-1 	me-2 align-middle" for="inlineCheckbox4">카풀</label>
					</div>
					<div class=" form-check form-check-inline ">
						<input name="t_gubun" value="기타" type="radio" class="form-check-input my-1" id="inlinCheckbox4" >
						<label class="form-check-label ms-1 	me-2 align-middle" for="inlineCheckbox4">기타</label>
					</div>
				</div>
				<div class=" form-check form-check-inline mt-0 mb-3">
		  			<span class="fw-bold align-middle me-5">인원 선택</span>
					<div class=" form-check form-check-inline my-0 mx-0 px-0">
					<input name="t_person" type="range"  min="1" max="8" step="1"
					oninput="document.getElementById('valueP').innerHTML=this.value;" value="1" class="form-range mx-0 px-0 size-small my-1" style="width:520px; height:15px;">
					<span class="ms-4" id="valueP">1</span><span>명</span>
					</div>
				</div>
				
	
 				<div class=" form-check form-inline my-0">
		  			<span class="fw-bold align-middle me-5">날짜 선택</span>
		  			
					<div class="  my-0 mx-0 px-0" style="display:inline;">
						<input onclick="getSysdate()" oninput="getStartDate()" name="t_start" type="date" class="me-0" id="input_from"  
							   placeholder="시작 날짜를 입력해주세요" style="width:35%; height:34px;">
						-
						<input name="t_end" type="date" class=" ms-0" id="input_to" 
							   placeholder="종료 날짜를 입력해주세요" style="width:35%;height:34px;" min="">
					</div>
				</div>
			</div>
					
			<!-- 파일등록 -->
			<div class="form-group " style="margin: 8px 0 8px;">
				<input  id="fileName" class="form-control mx-0" value="배경사진 올리기" disabled="disabled" 
						style="width:85%; display: inline; background-color: #e2e2e2;">
				<div class="fileRegiBtn" style="display:inline;">
					<label for="myFileUp">파일등록하기</label>
					<input name="t_img" type="file" id="myFileUp">
				</div>
			</div>
					
			<div class="bg-light mb-4 p-0 rounded selectCover" style="height:220px;">
				<img id="cover" src="images/file_icon.png" style="width:100%;height:240px; object-fit:cover; border-radius:4px;">
			</div>
					
					


				<div class="mb-2">
					<input name="t_title" class="form-control form-control-lg" type="text" 
						   style="font-size: 14px;"  placeholder="제목을 입력하세요" aria-label=".form-control-lg example">
				</div>
				<div class="mb-3">
					<textarea name="t_content" class="form-control form-control-lg col-sm-12" 
							  style="font-size: 14px;" rows="10" placeholder="내용을 입력하세요"></textarea>
				</div>
				<div id="filter" style="display: flex;">
					<button type="reset" onClick="history.go(-1)"class="btn btn-light text-align-left p-3 me-0 mb-5"  style="width:420px; float:left;">
						취소</button>
					<button type="submit" onclick="return chkAll()"
					class="btn ms-3 p-3 me-0 mb-5" id="filterBtn" style="width:420px;float:right;">
						완료</button>
					
				</div>  			
			</div>

		</div>
	</div>	
</div>
</form>


<div style="margin-top: 200px;"></div>
<%@ include file="../footer.jsp"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- Core theme JS-->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="yncss/bootstrap.min.js"></script>
<script type="text/javascript" src="yncss/trWrite.js"></script>