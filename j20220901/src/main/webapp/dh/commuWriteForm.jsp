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
#att_zone {
  width: 100%;
  min-height: 150px;
  padding: 10px;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
}
.close {
    vertical-align: middle;
    border: none;
    color: inherit;
    border-radius: 50%;
    background: transparent;
    position: relative;
    width: 32px;
    height: 32px;
    opacity: 0.6;
}
.close:focus,
.close:hover {
    opacity: 1;
    background: rgba(128, 128, 128, 0.5);
}
.close:active {
    background: rgba(128, 128, 128, 0.9);
}
/* tines of the X */
.close::before,
.close::after {
    content: " ";
    position: absolute;
    top: 50%;
    left: 50%;
    height: 20px;
    width: 4px;
    background-color: currentColor;
}
.close::before {
    transform: translate(-50%, -50%) rotate(45deg);
}
.close::after {
    transform: translate(-50%, -50%) rotate(-45deg);
}
</style>
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
			<form action="commuWritePro.do?pageNum=${pageNum }" method="post" enctype="multipart/form-data">
				<div class="form-group">
				
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
				
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="9" name="c_content" placeholder="게시글 내용을 입력하세요d"></textarea>
				</div>
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="1" name="c_hash"    placeholder="태그를 입력하세요. 입력 예시 : #제주도#음식#카페"></textarea>
				</div>
				<div class="mt-5 row">
					<div class="col-md-6">
						<button type="reset" class="btn btn-secondary btn-block" style="width: 100%; height: 50px;">취소</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success btn-block" style="width: 100%;  height: 50px;">확인</button>
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