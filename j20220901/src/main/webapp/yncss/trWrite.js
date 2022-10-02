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

/*const input = document.querySelector('input');
const log = document.getElementById('values');

input.addEventListener('input', updateValue);

function updateValue(e) {
  log.textContent = e.target.value;
}*/

