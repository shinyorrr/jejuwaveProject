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
<c:import url="${context}/header.jsp"></c:import>
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageTraveler.css?after">
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
						<li class="link_mypage_traveler">
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
					<table>
					<c:if test="${ totCnt > 0}">
						<c:forEach var="board" items="${list }">
							<tr>
								<td colspan="3">${board.b_title}</td>
								<td>
									<c:if test="${board.b_success == 'Y'}">
										답변완료
									</c:if>
									<c:if test="${board.b_success == 'N'}">
										답변대기중
									</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="4">${board.b_content }</td>
							</tr>
							<tr>
								<td><button location.href = "Board.jsp">수정</button></td><td><button>삭제</button></td><td></td><td>댓글수</td>
							</tr>
							<c:set var="startNum" value="${startNum - 1 }" />
						</c:forEach> 
					</c:if>
				</table>
				</div>
			</div>
			<div style="padding-left : 62%;">
				<c:if test="${startPage > 1 }">
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
</main>
<footer class="py-5 bg-dark" style="top: 180%;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
</footer>
</body>

</html>