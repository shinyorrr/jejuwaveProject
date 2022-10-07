<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<%
   String context = request.getContextPath();
%>
</head>
<body>
		<c:if test="${ totCnt > 0}">
						<c:forEach var="board" items="${list2 }">
						<table>
						<c:if test="${board.com_content != null }">
							<tr style= " cursor: pointer" onclick="location.href='qnaWriteCheck.do?b_num=${board.b_num}';">
								<td colspan="3">
									<div class = "c_content">
									${board.com_content}								
									</div>
								</td>
								<td class = "c_date">${board.com_date }</td>
							</tr>
							<tr>
								<td>
									<div class = "button_updateform">
									<button class = "button_update" onclick = "location.href = 'Board.jsp'">수정</button>
									<button class = "button_delete">삭제</button>
									</div>
								</td>
							</tr>
						</c:if>
						<c:if test="${board.t_content != null }">
							<tr style= " cursor: pointer" onclick="location.href='travelContent.do?t_num=${board.t_num}';">
								<td colspan="3">
									<div class = "c_content">
									${board.t_content}								
									</div>
								</td>
								<td class = "c_date">
									<c:set var = "t_date" value="${board.t_date }" />
									${fn:substring(t_date,0,11)}
								</td>
							</tr>
							<tr>
								<td>
									<div class = "button_updateform">
									<button class = "button_delete">삭제</button>
									</div>
								</td>
							</tr>
						</c:if>
						</table>
							<c:set var="startNum" value="${startNum - 1 }" />
						</c:forEach> 
					</c:if>
					
				<div style="text-align: center; padding-top: 20px;">
				<c:if test="${startPage > blockSize }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageTraveler.do?pageNum=${startPage-1 }'"
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">이전</button>
				</c:if>
				<c:forEach var="i" begin = "${startPage }" end = "${endPage }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageTraveler.do?pageNum=${i }'" 
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">${i }</button>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
						<button class = "page_nation" type = "button" onclick="location.href='<%=context%>/mypageTraveler.do=${startPage+1 }'"
						style ="
					    border: #eeee 2px solid;
					    background-color: white;
					    color: black;
					    padding: 10px 10px;
					    margin:3px;
					    font: bold 12px tahoma;
						">[다음]</button>
				</c:if>
</body>
</html>