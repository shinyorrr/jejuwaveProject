<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   String context = request.getContextPath();
%>

<c:import url="${context}/sh/header.jsp"></c:import>
<!DOCTYPE html>
<html>


<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<link rel="stylesheet" href="<%=context%>/css/sh/qnamain.css">
<link rel="stylesheet" href="<%=context%>/css/sh/qnaWriteCheck.css">

<header class="py-5 mb-5"
	style="background-image: url('<%=context %>/sh_images/jeju_air44.jpg'); background-size: cover; margin-top: 150px;">
	<div class="container px-4 px-lg-5 mt-5 mb-5">
		<div class="text-center text-white">
			<h3 class="display-5 fw-bolder">QnA게시판</h3>
			<p class="lead fw-normal text-white-50 mb-0">여행에 대한 질문을 해보세요</p>
		</div>
	</div>
</header>

<body>

		<div class="title">
			<img src="<%=context %>/sh_images/qnaicon1.png"
				class="userIconColor-1 rounded-circle me-2  align-center bg-white"
				width="30" height="30">${board.b_title}
		</div>


	<div class="profile">
		<div class="basic2_2">
			<img src="<%=context %>/sh_images/user_icon04.png"
				class="userIconColor-1 rounded-circle me-2  align-center bg-white"
				width="20" height="20">
			<div></div>
		</div>
		<p class="basic2_2">${board.user_id}</p>
	</div>

	<div class="gubun">
		<div>
			<br> <br> <span class="wait">상태</span> <span
				class="fw-bold me-2">답변대기</span> <span class="wait">테마</span> <span
				class="fw-bold me-2">${board.b_theme }</span>
		</div>
	</div>

	
		<div class="main">
			<p>${board.b_content}</p>
		</div>
		<div class="tag1">
			<div class="btn-group btn-group-sm" role="group" aria-label="..." style="margin-bottom: 6px;">
				<button type="button" class="btn btn-outline-secondary">#액티비티</button>
				<button type="button" class="btn btn-outline-secondary">#여행지추천</button>
				<button type="button" class="btn btn-outline-secondary">#20대</button>
			</div>
             <p class="button7">
				${board.b_date} &nbsp;&nbsp;
				<button class="button7" type="button" onclick="location.href='qnaUpdateForm.do?b_num=${board.b_num}'">수정</button> &nbsp;&nbsp;|&nbsp;&nbsp;
				<button class="button7" type="button" onclick="location.href='qnaDelete.do?b_num=${board.b_num}'">삭제</button>
			</p>
		</div>
		
		<div class="content" style="margin-left: 350px">
				<form action="qnaCommentWrite.do" style="width: 2000px">
				<input type="hidden" name="b_num" value="${board.b_num }">
				<input type="hidden" name="user_id" value="${board.user_id }">	
				<textarea name="com_content" rows="" cols="" style="width: 1100px; height: 90px; vertical-align: middle; border-color: #dbdbdb;outline-color: #FF3500"></textarea>					
					<input type="submit" value="등록"  style="vertical-align: middle; width: 120px; height: 90px; background-color: #FF3500;border-color: #FF3500; color: white; border-radius: 10%;">
				</form>
		</div>
		
		
<!-- 			<br>
		    <div  style="clear: both;">
		      <input type="text" >
		      <span class="input-group-btn">
			<button  type="submit">등록</button>
		      </span>
		    </div> -->

			<!-- 댓글 -->
<!-- 			<div>
				<form action="">
					<div class="comment">
						<label for="exampleFormControlTextarea1" class="form-label">
						2개의 답변</label>
						<textarea class="form-control" name="com_content"
							id="exampleFormControlTextarea1" rows="3">댓글 남겨주세요</textarea>

				</div>
				</form> -->
						
				<!-- 댓글 달리는 부분 -->
				<div class="content" style="clear: both;">
					<div class="d-flex mt-4">
						<div class="flex-shrink-0 ms-2">
							<img src="sh_images/user_icon03.png" width="25" height="25"
								class="userIconColor-1 rounded-circle me-2  align-center bg-white">
						</div>
						<div class="ms-3">
							<div class="fw-bold">kong</div>
							한라산 어떠신가요
						</div>
					</div>
					<div class="d-flex mt-4">
						<div class="flex-shrink-0 ms-2">
							<img src="sh_images/user_icon02.png" width="25" height="25"
								class="userIconColor-1 rounded-circle me-2  align-center bg-white">
						</div>
						<div class="ms-3">
							<div class="fw-bold">kong</div>
							한라산 어떠신가요
						</div>
					</div>
					<div class="d-flex mt-4">
						<div class="flex-shrink-0 ms-2">
							<img src="sh_images/user_icon01.png" width="25" height="25"
								class="userIconColor-1 rounded-circle me-2  align-center bg-white">
						</div>
						<div class="ms-3">
							<div class="fw-bold">kong</div>
							한라산 어떠신가요
						</div>
					</div>
				</div>
	

			<div style="margin-top: 200px;"></div>
			<%@ include file="footer.jsp"%>
</body>
</html>