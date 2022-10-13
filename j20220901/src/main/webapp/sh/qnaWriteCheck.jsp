<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
String context = request.getContextPath();
%>

<c:import url="../header.jsp"></c:import>
<!DOCTYPE html>
<html>


<meta charset="UTF-8">
<title>JEJU WAVE Q&A</title>
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

<body >
	<!-- 글 제목 -->
	<div class="title">
		<img src="<%=context%>/sh_images/qnaicon1.png"
			class="userIconColor-1 rounded-circle me-2  align-center bg-white"
			width="30" height="30">${board.b_title}
	</div>

	<!-- 아이디 -->
	<div class="profile">
		<div class="basic2_2">
			<img src="<%=context%>/${board.fn_user_img}"
				class="userIconColor-1 rounded-circle me-2  align-center bg-white"
				width="30" height="30">
			 <span style="font-size: 18px;" class="basic2_2">${board.user_id}</span>
		</div>
		<br>
	</div>
	<!-- 답변 채택완료/대기중 -->
	<div  style="border: 1px solid #D5D5D5; margin-right: 1300px;  padding:10px 5px 10px 5px; width:250px;  "  class="gubun">
		<div>
		 <span class="wait">&nbsp; &nbsp;상태</span> 

		<span class="fw-bold me-2">
		
			<c:if test="${board.b_success == 'Y' }">
			 <span style="color: red;">${board.b_success }</span>
			</c:if>
			<c:if test="${board.b_success != 'Y' }">
			 <span>${board.b_success }</span>
			</c:if>
			<!-- 테마 -->
			</span> <span class="wait">테마</span>            
			<span class="fw-bold me-2">${board.b_theme }</span>
	

		</div>
	</div>

	<!-- 글 내용 -->
	<div class="main">
		<p>${board.b_content}</p>
	</div>
	<!-- 해시태그 -->
		<div class="tag1">                                                                                      
			<div class="btn-group btn-group-sm" role="group" aria-label="..."       
				style="margin-bottom: 6px;">
				<!-- 태그 3개미만일때 # 제거 -->
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
			</div>
		</div>
		
		<!-- 내가 쓴 글일 때만 수정, 삭제 -->
		<c:if test="${user_id eq board.user_id }">
			<p class="button7">
				${board.b_date} &nbsp;&nbsp;
				<button class="button8" type="button"
					onclick="location.href='qnaUpdateForm.do?b_num=${board.b_num}'">수정</button>
				&nbsp;&nbsp;|&nbsp;&nbsp;
				<button class="button8" type="button"
					onclick="location.href='qnaDelete.do?b_num=${board.b_num}'">삭제</button>
			</p>
		</c:if>
	
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
						<img src="<%=context%>/${comment.fn_user_img}" width="40" height="40"
							class="userIconColor-1 rounded-circle me-2  align-center bg-white">
					</div>					
					<div class="fw-bold" style="font-size: 17px; line-height: 1.1" >${comment.user_id }
					
					<!--내가 쓴 댓글일때 만 삭제 -->
					<c:if test="${user_id eq comment.user_id }">
						<span><a class="delete" href="<%=context %>/qnaCommentDelete.do?com_num=${comment.com_num}&b_num=${b_num}">
						삭제<img src="<%=context %>/sh_images/trash" width="16" height="16" style="vertical-align: sub;" >
						</a></span>
					</c:if>
				
				 			
					 <!-- 댓글내용 -->		
						</div>
						<div style="font-size: 12px; color:gray; margin-bottom : 10px">${comment.com_date}</div> 				
						<div style="margin-left: 60px; margin-bottom: 25px; float: left; ">${comment.com_content }</div>
						<!-- 내가 작성한 글만 답변채택 가능 -->
						<c:if test="${user_id eq board.user_id }">
							<!-- 답변대기->답변 채택하기 -->
							<c:if test="${board.b_success ne '채택완료' }">
								<div style="float: right; margin-right: 350px;">
								<a href="<%=context %>/qnaChoose.do?com_num=${comment.com_num}&b_num=${b_num}">채택하기</a></div>
							</c:if>
							
							<!-- 채택완료 -->
							<c:if test="${board.b_success eq '채택완료'}">
								<c:if test="${comment.com_choose eq 'Y' }">
										<div style="float: right; margin-right: 350px;">
										<img src="<%=context %>/sh_images/bookmark.png" width="40" height="40"> </div>		
								</c:if>
							
							</c:if>
						</c:if>

	
						
						
					<div style= "clear:both;"><hr width="1100px"></div>
						
			</div>				
			</c:forEach>
		</div>



				
			

	
	<c:out value="${com_num }"></c:out>
	<div style="margin-top: 200px;"></div>
	<%@ include file="footer.jsp"%>
</body>
</html>