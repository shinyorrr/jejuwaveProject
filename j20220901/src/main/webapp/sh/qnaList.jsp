<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<%
String context = request.getContextPath();
%>


<c:import url="${context}/sh/header.jsp"></c:import>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="<%=context%>/css/sh/qnamain.css">
<link rel="stylesheet" href="<%=context%>/css/sh/qnaUpdate.css">
<link rel="stylesheet" href="<%=context%>/css/sh/qnaList.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>



<!-- ----------------상단 고정이미지 ---------------  -->
<header class="py-5 mb-5"
	style="background-image: url('<%=context%>/sh_images/jeju_air44.jpg'); background-size: cover; margin-top: 150px;">
	<div class="container px-4 px-lg-5 mt-5 mb-5">
		<div class="text-center text-white">
			<h3 class="display-5 fw-bolder">QnA게시판</h3>
			<p class="lead fw-normal text-white-50 mb-0">여행에 대한 질문을 해보세요</p>
		</div>
	</div>
</header>




<body>

	<div style="margin-bottom: 400px; margin-top: 70px;" class="main">
		<table class="mainTable">
		
			<!-- 채택기다리는 글 -->
			<div style="margin-left: 1300px;" >
			<button onclick="location.href='<%=context %>/qnaList2.do'" class="comment_button1" >답변을 기다리는 질문만 보기</button>
			</div>
			
			<c:if test="${totCnt > 0 }">
				<c:forEach var="board" items="${list}">
					<th style="vertical-align: super;">
					<!-- 채택완료/답변대기 -->
						<c:if test="${board.b_success eq '채택완료' }">
							<span >${board.b_success }</span>
						</c:if> 
						<c:if test="${board.b_success ne '채택완료' }">
							<span style="color: #FF3500;">${board.b_success }</span>
						</c:if></th>
					<!-- 제목 -->
					<th class=" title2">
						<a href='qnaWriteCheck.do?b_num=${board.b_num}&user_id=${user_id}'>
												   ${board.b_title}</a></th>
					<th><a href='qnaWriteCheck.do?b_num=${board.b_num}&user_id=${user_id}'> 
							<span class="content1">${board.b_content }</span></a></th>
					<tr class="last">
						<td></td>
						<td><img src="<%=context%>/sh_images/user_icon04.png"
							class="userIconColor-1 rounded-circle me-2  align-center bg-white"
							width="30" height="30">${board.user_id}</td>
			<!-- 해시태그 -->
					<td>
						<c:choose>
							<c:when test="${null eq board.l_hash1 }">&nbsp; &nbsp; &nbsp;</c:when>
							<c:otherwise><span class="hash">#${board.l_hash1}</span>&nbsp; &nbsp; &nbsp;</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${null eq board.l_hash2 }">&nbsp; &nbsp; &nbsp;</c:when>
							<c:otherwise><span class="hash">#${board.l_hash2}</span>&nbsp; &nbsp; &nbsp;</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${null eq board.l_hash3 }">&nbsp; &nbsp; &nbsp;</c:when>
							<c:otherwise><span class="hash">#${board.l_hash3}</span>&nbsp; &nbsp; &nbsp;</c:otherwise>
						</c:choose>
					</td>
					</tr>
					<c:set var="startNum" value="${startNum -1 }"></c:set>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt ==0 }">
				<tr>
					<td colspan=7>데이터가 없네ㅜ</td>
				</tr>

			</c:if>
			
		</table>
		
 	<!-- paging section-->
 		<br>	<br>
		<nav  aria-label="Page navigation example"
			class="d-flex justify-content-center">
			<ul class="pagination">
				<c:if test="${startPage > blockSize}">
					<li class="page-item"><a class="page-link"
						href='qnaList.do?pageNum=${startPage-blockSize}'
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li class="page-item"><a class="page-link"
						href='qnaList.do?pageNum=${i}'>${i}</a></li>
				</c:forEach>
				<c:if test="${endPage < pageCnt}">
					<li class="page-item"><a class="page-link"
						href='qnaList.do?pageNum=${startPage+blockSize}'
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	

	</div>



	<c:import url="${context}/footer.jsp"></c:import>
</body>
</html>