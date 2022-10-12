<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
   String context = request.getContextPath();
%>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
 	caption {
	font-size: 24px;
	}
.joinform{
    box-shadow: 10px 10px 10px 10px rgba(89,89,89,0.39);
    padding:70px 45px 45px 45px;
    display : inline-block;
}
	pre {
	font-size: 8pt;
	font-color: #gray;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function chk() {
	if (frm.user_pw.value != frm.user_pw2.value) {
		alert("암호가 다릅니다");
		frm.user_pw.focus();
		return false;
	}
	return true;
}
function chk1() {
	if (frm.user_pw.value == frm.user_pw2.value) {
		alert("암호가 같습니다.");
		frm.user_email.focus();
		return false;
	}
	
	if (frm.user_pw.value != frm.user_pw2.value) {
		alert("암호가 다릅니다");
		frm.user_pw.focus();
		return false;
	}
	return true;
}
function winop() {
	window.open("<%=context %>/idCheckForm.do?user_id="+$('#user_id').val(), "kkk",	"width=500 height=300");
} 
</script>
<c:import url="${context }/header.jsp"/>
</head>
<body>
		<tbody>
		<div class="joinform" style="margin-top:200px; margin-left: 28%;">
	<form  action="<%=context %>/joinPro.do" method="post" id="frm" name="frm" onsubmit="return chk()" enctype="multipart/form-data" >
		<table>
		<thead>
			<tr>
				<th colspan="3" style="text-align: center;"><h3>회원가입</h3></th>
		</thead>
			<tr>
				<td style="width: 120px; text-align: center;">아이디</td>
				<td><input type="text" style="width: 100%;"     name="user_id" id="user_id" required="required"></td>
				<td style="width: 50px; text-align: center;"><input type="button" value="중복체크" onclick="winop()"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">비밀번호</td>
				<td><input type="password" style="width: 100%;"  name="user_pw" id="user_pw" required="required"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">비밀번호확인</td>
				<td><input type="password" style="width: 100%;"  name="user_pw2" id="user_pw2" required="required"></td>
				<td style="text-align: center;"><input type="button" value="비밀번호체크" onclick="chk1()"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">이메일</td>
				<td><input type="email" style="width: 100%;"  name="user_email" required="required" placeholder="example@naver.com" ></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">이름</td>
				<td><input type="text" style="width: 100%;"  name="user_name" required="required"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">본인 소개</td>
				<td><textarea rows="10" cols="50" name="user_info" placeholder="다른 회원님들이 알 수 있도록 소개 부탁드려요!"></textarea> </td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">생년월일</td>
				<td><input type="date" name="user_birth" style="width: 100%;"  required="required" pattern="\d{8}" placeholder="생년월일8자리"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">성별</td>
				<td>남 <input type="radio" name="user_gender" value="M" checked="checked">
					여 <input type="radio" name="user_gender" value="F"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">전화번호</td>
				<td><input type="tel" name="user_tel" required="required" style="width: 100%;" 
					pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-xxxx-xxxx"
					title="2,3자리-3,4자리-4자리"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">회원구분<input type="hidden" name="user_gubun" value="1"></td>
			</tr>
			<tr>
				<td style="width: 120px; text-align: center;">이미지</td>
				<td><input type="file" name="user_img"></td>
				<!-- <td>이미지</td>
				<div class="form-group">
				<td style="text-align: center;">
					<div id='image_preview'>
						<input type='file' id='btnAtt' name="file" multiple='multiple' />
						<div id='att_zone' data-placeholder='사진을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
					</div>

					<script>
					( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
					  imageView = function imageView(att_zone, btn){
					
					    var attZone = document.getElementById(att_zone);
					    var btnAtt = document.getElementById(btn)
					    var sel_files = [];
					    
					    // 이미지와 체크 박스를 감싸고 있는 div 속성
					    var div_style = 'display:inline-block;position:relative;'
					                  + 'width:300px;height:280px;margin:40px;border:1px solid #00f;border-radius:0.25rem;	z-index:1';
					    // 미리보기 이미지 속성
					    var img_style = 'width:100%;height:100%;z-index:none';
					    // 이미지안에 표시되는 체크박스의 속성
					    var chk_style = 'width:30px;height:30px;position:absolute;font-size:24px;'
					                  + 'right:0px;bottom:0px;z-index:999;background-color:rgba(255,255,255,0.7);color:#f00';
					  
					    btnAtt.onchange = function(e){
					      var files = e.target.files;
					      var fileArr = Array.prototype.slice.call(files)
					      for(f of fileArr){
					        imageLoader(f);
					      }
					    }  
					    
					  
					    // 탐색기에서 드래그앤 드롭 사용
					    attZone.addEventListener('dragenter', function(e){
					      e.preventDefault();
					      e.stopPropagation();
					    }, false)
					    
					    attZone.addEventListener('dragover', function(e){
					      e.preventDefault();
					      e.stopPropagation();
					      
					    }, false)
					  
					    attZone.addEventListener('drop', function(e){
					      var files = {};
					      e.preventDefault();
					      e.stopPropagation();
					      var dt = e.dataTransfer;
					      files = dt.files;
					      for(f of files){
					        imageLoader(f);
					      }
					      
					    }, false)
					    
					
					    
					    /*첨부된 이미리들을 배열에 넣고 미리보기 */
					    imageLoader = function(file){
					      sel_files.push(file);
					      var reader = new FileReader();
					      reader.onload = function(ee){
					        let img = document.createElement('img')
					        img.setAttribute('style', img_style)
					        img.src = ee.target.result;
					        attZone.appendChild(makeDiv(img, file));
					      }
					      
					      reader.readAsDataURL(file);
					    }
					    
					    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
					    makeDiv = function(img, file){
					      var div = document.createElement('div')
					      div.setAttribute('style', div_style)
					      
					      var btn = document.createElement('button')
					      btn.setAttribute('class', 'close')
					      btn.setAttribute('delFile', file.name);
					      btn.setAttribute('area-label', 'Close');
					      btn.setAttribute('style', chk_style);
					      btn.onclick = function(ev){
					        var ele = ev.srcElement;
					        var delFile = ele.getAttribute('delFile');
					        for(var i=0 ;i<sel_files.length; i++){
					          if(delFile== sel_files[i].name){
					            sel_files.splice(i, 1);      
					          }
					        }
					        
					        dt = new DataTransfer();
					        for(f in sel_files) {
					          var file = sel_files[f];
					          dt.items.add(file);
					        }
					        btnAtt.files = dt.files;
					        var p = ele.parentNode;
					        attZone.removeChild(p)
					      }
					      div.appendChild(img)
					      div.appendChild(btn)
					      return div
					    }
					  }
					)('att_zone', 'btnAtt')
					
					</script>	
				</div>
				</td> -->
				</tr>
			<tr>
				<td colspan="3" style="text-align: center;"><input type="submit" value="가입">
				<input type="reset" value="가입 취소"></td>
			</tr>
		</table>
	</form>	
		</div>
	</tbody>
</body>
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your	Website 2022</p>
		</div>
	</footer>	
</html>