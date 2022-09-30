<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
   String context = request.getContextPath();
%>

<c:import url="${context}/header.jsp"></c:import>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<link rel="stylesheet" href="<%=context%>/css/sh/qnamain.css">
<style type="text/css">


</style>

<!--  <style type="text/css">
/* 	.header {
		width: 1500px;
		height: 120px;
		/* border: 1px solid red; */
	}
	 */
	.title {
		/* margin-top: 30px; */
		width: 800px;
		height: 80px;
		/* 	border: 1px solid blue; */
		margin-left: 250px;
		display: inline;
		font-size: 25px;
		font-weight: bold;
	}
	
	.button {
		margin-top: 30px;
		width: 800px;
		height: 80px;
		border: 1px solid orange;
		margin-left: 250px;
	}
	
	.main2 {
		margin-top: 30px;
		width: 700px;
		height: 200px;
		/* border: 1px solid orange; */
		margin-left: 270px;
	}
	
	.tag1 {
		margin-top: 30px;
		width: 1300px;
		height: 90px;
		display: inline;
		/* border: 1px solid green; */
		padding-left: 250px;
	}
	
	.basic6 {
		margin-top: 20px;
		width: 7000px;
		height: 40px;
		display: inline;
		border: 1px solid yellow;
		margin-left: 250px;
	}
	
	.comment {
		margin-top: 30px;
		width: 800px;
		height: 110px;
		/* 	border: 1px solid blue; */
		margin-left: 250px;
	}
	
	.gubun {
		margin-left: 270px;
	}
	
	.fw-bold {
		color: #FF3500;
	}
	
	.profile {
		margin-left: 280px;
		margin-top: 10px;
	}
	
	.content {
		margin-left: 250px;
		margin-top: 150px;
		width: 800px;
		/* border: 1px solid yellow; */
	}
	
	.button7{
	   color:gray;
	   font-size: 13px;
	
	} -->

</head>
<body>


	<div style="margin-top: 200px;"></div>
	

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

	
		<div class="main2">
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
		
		<div class="content">
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