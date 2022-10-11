<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
<c:import url="../header.jsp"></c:import>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR+Ligth:wght@300;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageBoard.css?after">
<style type="text/css">
	table {
		width: 100%;
	}
</style>
<script type="text/javascript" src = "https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	$(function(){
		$('.button_delete').click(function(){
			var b_num = document.getElementById('b_num');
			var ans = confirm("삭제를 하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				url 	: 'mypageQnaDelete.do?b_num=?'+b_num,
				dataType: 'text',
				success : function(data){
					location.reload();
				},
			});
		});
	});

</script>
</head>
<body>

<main id = "content" style="background-color: rgb(248,248,248);">
	<div class = "mypage_set">
		<div class="Mypage_Main">
			<div class="Menu_section">
				<div class="Menu__profile">
					<div class="Profiles_image">
						<c:if test="${img == null}">
						<img class = "profile_img" src="<%=context%>/images/vector_profile_default.svg" style="vertical-align:middle;">
						</c:if>
						<c:if test="${img != null}">
						<img class = "profile_img" src="<%=context%>/${img}" style="vertical-align:middle;">
						</c:if>
						<span class = "user_id">	
						<c:if test="${user_id != null}">
							${user_id }
						</c:if>
						</span>
					</div>
				</div>
				<div class = "menu_link">
					<ul class="mypage_menu">
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageUpdate.do">
								<span class="mypage_name">계정관리</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageTraveler.do">
								<span class="mypage_name">내 동행게시글</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageCommunity.do">
								<span class="mypage_name">내 커뮤니티글</span>
							</a>
						</li>
						<li class="link_mypage_board">
							<a class="link index_link" href="<%=context%>/mypageBoard.do">
								<span class="mypage_name">내 게시글</span>
							</a>
						</li>
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageComment.do">
								<span class="mypage_name">내 코멘트</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 각 화면이 달라지는 부분 -->
			<div class="content_section">
				<h2 class = "mypage_menu_h2">내 게시글</h2>
					<div class = "ajax">
					
					<form action="<%=context%>/mypageAlldelete.do" method="post">
					<c:if test="${ totCnt > 0}">
						<c:forEach var="board" items="${list }">
						<table>
							<tr>
								<td colspan="3">
								<input type = "checkbox" name = "chk_qna" value="${board.b_num }">
								<input type = "text" id = "b_num" value="${board.b_num }" hidden="true">
									<div class = "t_title">
										${board.b_title}
									</div>
								</td>
								<td>
									<div class = "dealstatus">
									<c:if test="${board.b_success eq 'Y'}">
										답변완료
									</c:if>
									<c:if test="${board.b_success eq 'N'}">
										<sqan style = "color : red">답변대기중</sqan>	
									</c:if>
									</div>
								</td>
							</tr>
							<tr style= " cursor: pointer" onclick="location.href='qnaWriteCheck.do?b_num=${board.b_num}';">
								<td colspan="3" style = "height: 40px;">
									<div class = "t_content">
									${board.b_content }
									</div>
								</td>
								<td style="font-size: small;float: right;padding: 5px;">${board.b_date }</td>
							</tr>
							<tr>
								<td>
									<button type="button" class = "button_update" onclick = "location.href = 'qnaUpdateForm.do?b_num=${board.b_num}';">수정</button>
									<button type="button" class = "button_delete" onclick = "location.href = '<%=context%>/mypageQnaDelete.do?b_num=${board.b_num }'">삭제</button>
								</td>
								<td colspan="3">
									<div class = "b_recnt">
										<img style="width: 16px; height: 16px; margin: 0 5px;" src="<%=context%>/images/comm_icon.png">${board.b_recnt}
									</div>
								</td>
							</tr>
						<c:set var="startNum" value="${startNum - 1 }" />
						</table>
					</c:forEach> 
				</c:if>
				<input type = "submit" class = "allDel" value="일괄삭제">
				</form>
				</div>
				
				
				<div style="text-align: center; padding-top: 20px;">
				<c:if test="${startPage > blockSize }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageBoard.do?pageNum=${startPage-1 }'"
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">이전</button>
				</c:if>
				<c:forEach var="i" begin = "${startPage }" end = "${endPage }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageBoard.do?pageNum=${i }'" 
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">${i }</button>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageBoard.do=${startPage+1 }'"
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">[다음]</button>
				</c:if>
				</div>
				</div>
			</div>
		</div>
</main>
<footer class="py-5 bg-dark" style="top: 180%;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
</footer>
</body>

</html>