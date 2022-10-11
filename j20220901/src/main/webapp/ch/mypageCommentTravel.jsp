<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
<c:import url="${context}/header.jsp"></c:import>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR+Ligth:wght@300;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageCommentTravel.css?after">
<style type="text/css">
	table {
		width: 100%;
	}
</style>
<script type="text/javascript" src = "<%=context%>/js/jquery.js"></script>
<script type="text/javascript">
function deleteMsg(){
	var t_num = document.getElementById('t_num').value;

	var ans = confirm("선택하신 글을 삭제하시겠습니까?");
	if(!ans) return false;
	
	$.ajax({
			url 	: 'mypageCommentTravelDelete.do?t_num='+t_num,
			dataType: 'html',
			success	: function(data){
				location.reload();
			}
		});
	}

$(function(){
	$('#myComment_Travel').click(function(){
		
		$.ajax({
			url 	 : 'mypageCommentTravel.do',
			dataType : 'html',
			success	 : function(data){
						var e = $(data).find('#change_body');
						$('#change_body').html(e)
						}
		});
	
	});
	
});

$(function(){
	$('#myComment_qna').click(function(){
		$.ajax({
			url 	 : 'mypageComment.do',
			dataType : 'html',
			success	 : function(data){
						var e = $(data).find('#change_body');
						$('#change_body').html(e)
						}
		});
	
	});
	
});


// 버튼 클릭시 색 변경
$(function(){
	$('.myComment_button').click(function(){
		$('.myComment_button').css("background-color","rgb(233, 233, 233)");
		$('.myComment_button').css("color","black");
		$('.myComment_button').css("border","0");
		$(this).css("background-color","white");
		$(this).css("color","rgb(0, 206, 124)");
		$(this).css("border","1px solid rgb(0, 206, 124)");
		
	});
});



</script>
<script type="text/javascript">

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
						<li class="link_mypage">
							<a class="link index_link" href="<%=context%>/mypageBoard.do">
								<span class="mypage_name">내 Q&A글</span>
							</a>
						</li>
						<li class="link_mypage_comment">
							<a class="link index_link" href="<%=context%>/mypageComment.do">
								<span class="mypage_name">내 코멘트</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 각 화면이 달라지는 부분 -->
			<div class="content_section">
			
				<button class = "myComment_button" id = "myComment_qna">
					<h2 class = "mypage_CommentMain">Q&A 내 댓글관리</h2>
				</button>
				<button class = "myComment_button" id = "myComment_Travel">
					<h2 class = "mypage_CommentMain">동행자게시판 내 댓글관리</h2>
				</button>
				<div class = "change_body" id = "change_body">
				
				
				<form action="<%=context%>/mypageAlldelete.do" method="post">
			<c:if test="${ totCnt > 0}">
							<c:forEach var="board" items="${list2 }">
							<table>
								<tr style= " cursor: pointer"<%--  onclick="location.href='travelContent.do?t_num=${board.t_num}';" --%>>
									<td colspan="3">
									<input type="checkbox" name = "chk_trvComment" value="${board.t_num }">
									<input type="text" value = "${board.t_num }" name = "t_num" id = "t_num" hidden="true">
										<div class = "c_content" onclick="location.href='travelContent.do?t_num=${board.t_ref }';">
										${board.t_content}								
										</div>
									</td>
									<td class = "c_date">
										<c:set var = "t_date" value="${board.t_date }" />
										${fn:substring(t_date,0,11)}
									</td>
								</tr>
								<tr>
									<td>
										<div class = "button_updateform">
										<button type="button" class = "button_delete" onclick="location.href='mypageCommentTravelDelete.do?t_num=${board.t_num}';">삭제</button>
										</div>
									</td>
								</tr>
							</table>
								<c:set var="startNum" value="${startNum - 1 }" />
							</c:forEach> 
						</c:if>
						<input type="submit" class = "allDel" value="일괄삭제">
				</form>	
				<form action="mypageCommentTravel.do">
						<input type ="text"  class="search_input"	name="search" placeholder="댓글내용">
						<input type ="submit" 	value="검색">
				</form>
						
						
				<div style="text-align: center; padding-top: 20px;">
				<c:if test="${startPage > blockSize }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageCommentTravel.do?pageNum=${startPage-1 }'"
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
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageCommentTravel.do?pageNum=${i }'" 
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
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageCommentTravel.do=${startPage+1 }'"
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
		</div>
</main>
</body>
</html>