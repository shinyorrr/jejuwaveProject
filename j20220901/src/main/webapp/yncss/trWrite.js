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



