<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%
   String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/sh/qnamain.css">


<c:import url="${context}/header.jsp"></c:import>

<header class="py-5 mb-5"
	style="background-image: url('${context}/sh_images/jeju_air44.jpg'); background-size: cover; margin-top: 73px;">
	<div class="container px-4 px-lg-5 mt-5 mb-5">
		<div class="text-center text-white">
			<h3 class="display-5 fw-bolder">QnA게시판</h3>
			<p class="lead fw-normal text-white-50 mb-0">여행에 대한 질문을 해보세요</p>
		</div>
	</div>
</header>
<body>



	<div class="list-group">
		<a href="<%=context %>/sh/qnaWriteCheck.jsp" class="list-group-item list-group-item-action">
			<div class="d-flex w-100 justify-content-between">
			<c:forEach var="board" items="${list }">
					<h5 class="basic1">답변대기</h5>
					<div class="basic2">
						<p class="basic2_1">
							<a href='<%=context %>/qnaWriteCheck.do?b_num=${board.b_num}'>
							${board.b_title}</a>
						</p>
						<div>
							<p class="basic2_2">
								<img src="${context}/sh_images/user_icon02.png"
									class="userIconColor-1 rounded-circle me-2  align-center bg-white"
									width="30" height="30">
							</p>
							<p class="basic2_2">${board.user_id}</p>
						</div>
					</div>
					<div class="basic3">
						<p>${board.b_content }</p>
						<button type="button" class="btn btn-outline-secondary">#액티비티</button>
						<button type="button" class="btn btn-outline-secondary">#여행지추천</button>
						<button type="button" class="btn btn-outline-secondary">#20대</button>
					</div>
					<br>
			</c:forEach>
			</div>

		
				</div>

			</div>

		</a>
	</div>






	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>


</html>