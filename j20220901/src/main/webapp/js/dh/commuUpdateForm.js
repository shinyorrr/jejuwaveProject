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
				//사진 수정 전 사진 불러오기
				$( document ).ready(function() { 
					var fileList = document.getElementById('file-list');
					
					var imgList = new Array();
					<c:forEach items="${imgList }" var="img">
						imgList.push({cImgNum : "${img.c_img_num}"
									,cImgPath : "${img.c_img_path}"
									});
					</c:forEach>
					console.log('imgList : ' + imgList);
					var fileName = "";
					for(var i in imgList) {
						
						var div = document.createElement('div');
						div.setAttribute('class', 'file-input');
						
						var divFileName = document.createElement('div');
						divFileName.setAttribute('class', 'file-name'+i);
						
						var input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.setAttribute('name', 'c_img_num');
						input.setAttribute('value', imgList[i].cImgNum);
						
						var img = document.createElement('img');
						img.setAttribute('class', 'preview');
						imgSrc = "<%=context%>" + "/" + imgList[i].cImgPath;
						fileName = ("<%=context%>" + "/" + imgList[i].cImgPath).substring(44);
						img.src = imgSrc;
						
						var a = document.createElement('a');
						a.setAttribute('href', '#this');
						a.setAttribute('name', 'file-delete');
						a.setAttribute('class', 'delFile');
						
						fileList.appendChild(div);
						div.appendChild(divFileName);
						$('.file-name'+i).text(fileName);
						div.appendChild(input);
						div.appendChild(img);
						div.appendChild(a);
						$('.delFile').text('파일 삭제');
					}
					$("a[name='file-delete']").on("click", function(e) {
						e.preventDefault();
						deleteFile($(this));
					});
				});
				//사진 수정 전으로 되돌리기
				 function resetFile() {
					 var fileList = document.getElementById('file-list');
						$("#file-list").empty();
						
						var imgList = new Array();
						<c:forEach items="${imgList }" var="img">
							imgList.push({cImgNum : "${img.c_img_num}"
										,cImgPath : "${img.c_img_path}"
										});
						</c:forEach>
						console.log('imgList : ' + imgList);
						var fileName = "";
						for(var i in imgList) {
							
							var div = document.createElement('div');
							div.setAttribute('class', 'file-input');
							
							var divFileName = document.createElement('div');
							divFileName.setAttribute('class', 'file-name'+i);
							
							var input = document.createElement('input');
							input.setAttribute('type', 'hidden');
							input.setAttribute('name', 'c_img_num');
							input.setAttribute('value', imgList[i].cImgNum);
							
							var img = document.createElement('img');
							img.setAttribute('class', 'preview');
							imgSrc = "<%=context%>" + "/" + imgList[i].cImgPath;
							fileName = ("<%=context%>" + "/" + imgList[i].cImgPath).substring(44);
							img.src = imgSrc;
							
							var a = document.createElement('a');
							a.setAttribute('href', '#this');
							a.setAttribute('name', 'file-delete');
							a.setAttribute('class', 'delFile');
							
							fileList.appendChild(div);
							div.appendChild(divFileName);
							$('.file-name'+i).text(fileName);
							div.appendChild(input);
							div.appendChild(img);
							div.appendChild(a);
							$('.delFile').text('파일 삭제');
						}
						$("a[name='file-delete']").on("click", function(e) {
							e.preventDefault();
							deleteFile($(this));
						});
					};