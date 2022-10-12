<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String context = request.getContextPath();
	String userId = (String) session.getAttribute("user_id");
	request.setAttribute("userId", userId);
%>
<c:import url="${context}/headerAdmin.jsp"></c:import>
<link rel="stylesheet" href="<%=context%>/hs/css/adminStyle.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- 네비게이션메뉴바 -->
	<nav id="nav" class="nav">
	<!-- 프로필 이미지 -->
		<div class="card" id="cardpro">
		  <img src="<%=context%>/hs_images/adminpro.png" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Admin</h5>
		    <p class="card-text">관리자입니다.</p>
		  </div>
		</div>
		<div class="d-grid gap-2 col-6" id="navmenu">
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/admain.do'">홈</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adMemList.do'">회원 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adTravelForm.do'">동행자 찾기 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adQnaForm.do'">Q&A 게시판 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adCommuForm.do'">회원커뮤니티 관리</button>
		</div>
	</nav>
	
	<!-- 본문 -->
	<article class="article" id="article">
		<div class="table-responsive">
		    <table class="table" id="commu">
		    <caption>회원커뮤니티</caption>
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">내용</th>
			      <th scope="col">해시태그</th>
			      <th scope="col">아이디</th>
			      <th scope="col">작성일</th>
			      <th scope="col">삭제</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:if test="${totCnt > 0}">
			  		<c:forEach var="commu" items="${list}">
				  	<tr>
				  		<th scope="row" width="50">${startNum}</th>
				  		<td width="600" id="content">${commu.c_content}</td>
				  		<td width="100">#${commu.c_hash}</td>
				  		<td width="100">${commu.user_id}</td>
				  		<td width="100">
				  			<fmt:formatDate value="${commu.c_date}" pattern="yy-MM-dd"/>
				  		</td>
				  		<td width="100"><input type="button" value="삭제" onclick="location.href='<%=context%>/adCommuDelete.do?c_num=${commu.c_num}&pageNum=${pageNum}'"></td>
				  	</tr>
				  	<c:set var="startNum" value="${startNum-1}"></c:set>
			  		</c:forEach>
		  		</c:if>
		  	  <c:if test="${totCnt == 0}">
		  		<tr>
		  			<td colspan="7">데이터가 없네</td>
		  		</tr>
		  	  </c:if>
		  </tbody>
		</table>
	  </div>
		
		<!-- 페이지내비게이션 -->
		<nav class="pagenav" aria-label="Page navigation example">
		  <ul class="pagination">
		  	<c:if test="${startPage > blockSize}">
				<li class="page-item"><a class="page-link" href="<%=context%>/adCommuForm.do?pageNum=${startPage-blocksize}">이전</a></li>
			</c:if>
		    
		    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				<li class="page-item"><a class="page-link" href="<%=context%>/adCommuForm.do?pageNum=${i}">${i}</a></li>
			</c:forEach>
		    
		    <c:if test="${endPage < pageCnt}">
				 <li class="page-item"><a class="page-link" href="<%=context%>/adCommuForm.do?pageNum=${startPage+blockSize }">다음</a></li>
			</c:if>
		  </ul>
		 </nav>
	</article>
	
<div style="margin-top: 100px, margin-left: 198px;"></div>
<c:import url="${context}/hs/footer.jsp"></c:import>
</body>
</html>