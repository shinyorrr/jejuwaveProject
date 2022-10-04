<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
String context = request.getContextPath();
%>

<c:import url="${context}/sh/header.jsp"></c:import>
<!DOCTYPE html>
<html>


<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<link rel="stylesheet" href="<%=context%>/css/sh/qnamain.css">
<link rel="stylesheet" href="<%=context%>/css/sh/qnaWriteCheck.css">


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

	<div class="title">
		<img src="<%=context%>/sh_images/qnaicon1.png"
			class="userIconColor-1 rounded-circle me-2  align-center bg-white"
			width="30" height="30">${board.b_title}
	</div>


	<div class="profile">
		<div class="basic2_2">
			<img src="<%=context%>/sh_images/user_icon04.png"
				class="userIconColor-1 rounded-circle me-2  align-center bg-white"
				width="20" height="20">
			<div></div>
		</div>
		<p class="basic2_2">${board.user_id}</p>
	</div>

	<div class="gubun">
		<div>
			<br> <br> <span class="wait">상태</span> 

		<span class="fw-bold me-2">
			<c:if test="${board.b_success == 'Y' }">
			 <span style="color: red;">${board.b_success }</span>
			</c:if>
			<c:if test="${board.b_success != 'Y' }">
			 <span>${board.b_success }</span>
			</c:if>
			</span> <span class="wait">테마</span>             <!--  현지수정 -->
			<span class="fw-bold me-2">${board.b_theme }</span>
	

		</div>
	</div>


	<div class="main">
		<p>${board.b_content}</p>
	</div>
	<div class="tag1">                                                                                      <!--  현지수정 -->
		<div class="btn-group btn-group-sm" role="group" aria-label="..."       
			style="margin-bottom: 6px;">
			
			<span class="hash">#${board.l_hash1}</span>&nbsp; &nbsp; &nbsp; 
			<span class="hash">#${board.l_hash2}</span>&nbsp; &nbsp; &nbsp; 
			<span class="hash">#${board.l_hash3}</span>
			
		</div>

		<p class="button7">
			${board.b_date} &nbsp;&nbsp;
			<button class="button8" type="button"
				onclick="location.href='qnaUpdateForm.do?b_num=${board.b_num}'">수정</button>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<button class="button8" type="button"
				onclick="location.href='qnaDelete.do?b_num=${board.b_num}'">삭제</button>
		</p>





		
		<!-- 댓글 등록 -->
		<div class="content" >
				<form action="qnaCommentWrite.do" style="width: 2000px">
				<input type="hidden" name="b_num" value="${board.b_num }">
				<input type="hidden" name="user_id" value="${board.user_id }">	
				<textarea name="com_content" rows="" cols="" style="width: 1100px; height: 90px; vertical-align: middle; border-color: #dbdbdb;outline-color: #FF3500"></textarea>					
					<input type="submit" value="등록"  style="vertical-align: middle; width: 120px; height: 90px; background-color: #FF3500; border-color: #FF3500; font-weight:bold; color: white; border-radius: 10%;">
				</form>
		</div>
		


		<!-- 댓글 목록 -->
		<div style="margin-left: 350px">
			<br><br>
			<div class="count" style="font-size: 14px; font-weight: bold;" ><font color="#FF3500">${fn:length(list)}</font>개의 답변</div>
			
			<c:forEach var="comment" items="${list }" varStatus="inum">
			<p>
			<div style="margin-top: 25px;">
					<div style="float: left;">
						<img src="<%=context %>/sh_images/user_icon0${inum.count }.png" width="40" height="40"
							class="userIconColor-1 rounded-circle me-2  align-center bg-white">
					</div>					
					<div class="fw-bold" style="font-size: 17px; line-height: 1.1" >${comment.user_id }
					
						<!-- 댓글 삭제 -->
						<c:if test="${user_id == comment.user_id }">
							<span><a class="delete" href="<%=context %>/qnaCommentDelete.do?com_num=${comment.com_num}&b_num=${b_num}">
							삭제<img src="<%=context %>/sh_images/trash" width="16" height="16" style="vertical-align: sub;" >
							</a></span>
						</c:if>
					</div>
					<div style="font-size: 12px; color:gray; margin-bottom : 10px">${comment.com_date}</div> 				
					<div style="margin-left: 60px; margin-bottom: 25px;">${comment.com_content }</div>
					<hr width="1100px">
			</div>				
			</c:forEach>
		</div>



				</div>
			

	

	<div style="margin-top: 200px;"></div>
	<%@ include file="footer.jsp"%>
</body>
</html>