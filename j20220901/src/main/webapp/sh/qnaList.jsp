<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%
String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap">
<link rel="stylesheet" href="<%=context%>/css/sh/qnamain.css">

<c:import url="${context}/sh/header.jsp"></c:import>

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
	<div>
		<table class="maintitle">
			<c:forEach var="board" items="${list }">
				<div class="one space">
					<td>답변대기</td>
				</div>
				<div>
					<div>
						<p>
						<th><a
							href='<%=context %>/qnaWriteCheck.do?b_num=${board.b_num}& user_id=${board.user_id}'>
							${board.b_title}</a></th>
						</p>							
						<p class="user_icon1">						
						<td><img src="<%=context%>/sh_images/user_icon02.png"
							class="userIconColor-1 rounded-circle me-2  align-center bg-white"
							width="30" height="30">
							</p>
							<p>${board.user_id}</td>
						</p>
					</div>
				</div>
				<div class="title1">
                 
					<td>
				<th><class="title2">
						<td>${board.b_content }</th>
					</td>					
				</div>
				</tr>
			</c:forEach>
		</table>


</div>
<c:import url="${context}/footer.jsp"></c:import>
</body>


</html>