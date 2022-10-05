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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- qna 무한스크롤 ajax-->
<script type="text/javascript">
var count = 2;
$(window).scroll(function(){
	if($(window).scrollTop() >= $(document).height() - $(window).height()) {	
		alert('scroll start..');
		$.ajax({ 
			url: "<%=context%>/qnaListScroll.do?pageNum="+count,
			success: function(result){
						$("#scroll").append(result);
						count = count+1;
					}
		}); 
	}
});	
console.log(count);

</script>


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

	<div style="margin-bottom: 400px" class="main">
		<table class="mainTable">
			<c:if test="${totCnt > 0 }">
				<c:forEach var="board" items="${list}">
					<th style="vertical-align: super;"><c:if
							test="${board.b_success eq '채택완료' }">
							<span style="color: red;">${board.b_success }</span>
						</c:if> <c:if test="${board.b_success ne '채택완료' }">
							<span>${board.b_success }</span>
						</c:if></th>
					<th class=" title2"><a
						href='qnaWriteCheck.do?b_num=${board.b_num}'>${board.b_title}</a></th>
					<th><a href='qnaWriteCheck.do?b_num=${board.b_num}'> <span
							class="content1">${board.b_content }</span></a></th>
					<tr class="last">
						<td></td>
						<td><img src="<%=context%>/sh_images/user_icon04.png"
							class="userIconColor-1 rounded-circle me-2  align-center bg-white"
							width="30" height="30">${board.user_id}</td>
						<td><span class="hash">#${board.l_hash1}</span> &nbsp; &nbsp;
							<span class="hash">#${board.l_hash2}</span> &nbsp; &nbsp; <span
							class="hash">#${board.l_hash3}</span></td>
					</tr>
					<c:set var="startNum" value="${startNum -1 }"></c:set>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt ==0 }">
				<tr>
					<td colspan=7>데이터가 없네</td>
				</tr>

			</c:if>
			<!-- end list -->
			<div id="scroll"></div>
		</table>
		
 	<!--1 2 3 번 페이지 버튼  -->
		<div style="text-alile: center;">
			<c:if test="${startPage > blockSize }">
				<a href="<%=context%>/qnaList.do?pageNum=${startPage-blockSize }">[이전]</a>

			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="<%=context%>/qnaList.do?pageNum=${i}">[${i}]</a>
			</c:forEach>

			<c:if test="${endPage<pageCnt }">
				<a href="<%=context%>/qnaList.do?pageNum=${startPage+blockSize}">[다음]</a>
			</c:if>

		</div>

		totCount : ${totCnt}

	</div>



	<c:import url="${context}/footer.jsp"></c:import>
</body>
</html>