<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- QNA 게시판 무한스크롤 불러올 컨텐츠 -->
<% 
	String context = request.getContextPath();
%>

</head>
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

		</table>

		<div style="text-alile: center;">
			<c:if test="${startPage > blockSize }">
				<a href="qnaList.do?pageNum=${startPage-blockSize }">[이전]</a>

			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<a href="qnaList.do?pageNum=${i}">[${i}]</a>
			</c:forEach>

			<c:if test="${endPage<pageCnt }">
				<a href="qnaList.do?pageNum=${startPage+blockSize}">[다음]</a>
			</c:if>

		</div> 
		totCount : ${totCnt}

	</div>



</body>
</html>