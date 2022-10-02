<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file = "header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
<c:import url="${context}/headerLogin.jsp"></c:import>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR+Ligth:wght@300;900&display=swap" rel="stylesheet">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageSetup.css?after">
<link rel = "stylesheet" href ="<%=context%>/css/ch/mypageCommunity.css?after">
</head>
<body>
<div class = "main" style="background-color: rgb(248,248,248);">
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
						<img class = "profile_img" src="<%=context%>${img}" style="vertical-align:middle;">
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
						<li class="link_mypage_community">
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
				<h2 class = "mypage_menu_h2">내 커뮤니티</h2>
						<c:if test="${ totCnt > 0}">
						<c:forEach var="board" items="${list }">
					<table style = "border-bottom = 1px solid rgb(204,204,204)">
							<tr>
								<td rowspan="3" width = 50>
									<div class = "imgboxform">
										<img class = "imgbox" src="<%=context%>/${board.c_img_path }" width = "120px" padding-bottom = 10px>
									</div>
								</td>
								<td class = "dealstatusTd" width = 90>
									<div class = "dealstatus">
										${board.c_hash}	
									</div>
								</td>
								<td class = "t_titleTD" width = 200>
									<div class = "t_title">${board.c_title }</div>
								</td>
							</tr>
							<tr>
								<td colspan="3" width = 2000>
									<div class = "t_content">
										${board.c_content}
									</div>
								</td>
							<tr>
								<td colspan="2">
									<div class = "button_updateform">
										<button class = "button_update" location.href = "Board.jsp">수정</button>
									</div>
									<div>
										<button class = "button_delete">삭제</button>
									</div>
								</td>
								<td>
									<div class = "comment number">
										${board.c_date}
									</div>
								</td>
							</tr>
							<c:set var="startNum" value="${startNum - 1}" />
				</table>
						</c:forEach> 
					</c:if>
			</div>
		</div>
				<div style="padding-left : 62%;">
				<c:if test="${startPage > blockSize }">
					<a href = '<%=context%>/mypageTraveler.do?pageNum=${startPage-blockSize }'>[이전]</a>
				</c:if>
				<c:forEach var="i" begin = "${startPage }" end = "${endPage }">
					<a href='<%=context%>/mypageTraveler.do?pageNum=${i }'>[${i }]</a>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<a href ='<%=context%>/mypageTraveler.do=${startPage+blockSize }'>[다음]</a>
				</c:if>
			</div>
		</div>
</main>
</div>
<footer class="py-5 bg-dark" style="top: 125%;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
</footer>
</body>
</html>