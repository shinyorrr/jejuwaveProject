<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageTraveler.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<style type="text/css">
	table {
		width: 100%;
	}
</style>
<script type="text/javascript" src = "https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	function deleteMsg(){
		var t_num = $('#t_num').val();
		console.log = (t_num)
		var ans = confirm("선택하신 댓글을 삭제하시겠습니까?");
		if(!ans) return false;
		
		$.ajax({
				url 	: '${context}/MypageTraveldelete.do?t_num = ',
				dataType: 'text',
				data	: t_num,
				success	: function(data){
						location.reload();
				},
				error : function(date){
					alert("댓글이 삭제되지 않았습니다.");
				}
			});
		}
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
						<li class="link_mypage_traveler">
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
				<h2 class = mypage_menu_h2>내 게시글</h2>
					<c:if test="${ totCnt > 0}">
						<c:forEach var="board" items="${list }">
								<table style = "border-bottom = 1px solid rgb(204,204,204)">
										<tr id = "travelurl" style= " cursor: pointer" onclick="location.href='travelContent.do?t_num=${board.t_num}&pageNum=${currentPage}';">
											<input id = "t_num" type="text" value = "${board.t_num }" hidden="true">
											<td rowspan="3" width = 50>
												<div class = "imgboxform">
													<img class = "imgbox" src="<%=context%>/${board.t_img }" width = "120px" padding-bottom = 10px>
												</div>
											</td>
											<td class = "dealstatusTd" width = 90>
												<div class = "dealstatus"  style="width: 100px;">
														<c:if test="${board.t_dealstatus == 1 }">
														모집완료	
														</c:if>
														<c:if test="${board.t_dealstatus == 0 }">
														<sqan style = "color : red">모집중</sqan>	
														</c:if>
												</div>
											</td>
											<td class = "t_titleTD" width = 200>
												<div class = "t_title">${board.t_title }</div>
											</td>
											<td class = "t_date">
												<c:set var = "t_date" value="${board.t_date }" />
												${fn:substring(t_date,0,11)}
											</td>
										</tr>
										<tr style= " cursor: pointer" onclick="location.href='travelContent.do?t_num=${board.t_num}&pageNum=${currentPage}';">
											<td colspan="3" width = 2000>
												<div class = "t_content">
													${board.t_content}
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class = "button_updateform">
													<button class = "button_update" onclick="location.href = '<%=context%>/travelUpdate.do?t_num=${board.t_num }'">수정</button>
												</div>
												<div>
													<button class = "button_delete" onclick="location.href = '<%=context%>/MypageTraveldelete.do?t_num=${board.t_num }'">삭제</button>
												</div>
											</td>
											<td>
												<div class = "comment_cnt">
													<img style="width: 16px; height: 16px; margin: 0 5px;" src="<%=context%>/yn_images/comm_icon.png">${board.t_recnt}
												</div>
											</td>
										</tr>
										<c:set var="startNum" value="${startNum - 1 }" />
							</table>
						</c:forEach> 
					</c:if>
				<div style="text-align: center; padding-top: 20px;">
				<c:if test="${startPage > blockSize }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageTraveler.do?pageNum=${startPage-1 }'"
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
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageTraveler.do?pageNum=${i }'" 
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
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageTraveler.do=${startPage+1 }'"
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