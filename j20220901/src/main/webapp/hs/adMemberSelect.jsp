<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String context = request.getContextPath();
	String userId = (String) session.getAttribute("user_id");
	request.setAttribute("userId", userId);
%>
<c:import url="${context}/headerAdmin.jsp"></c:import>
<link rel="stylesheet" href="<%=context%>/hs/css/adminStyle.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script type="text/javascript" src="<%=context%>/js/jquery.js"></script>
<script type="text/javascript">
	function searchCheck(){
	    //검색
	   
	    if(frm.keyField.value == 0){
	        alert("검색 키워드를 입력하세요.");
	        frm.keyField.focus();
	        return false;
	    }
	    if(frm.keyWord.value =="" && frm.keyField.value == "user_id"){
	        alert("검색할 아이디를 입력하세요.");
	        frm.keyWord.focus();
	        return false;
	    }
	    if(frm.keyWord.value =="" && frm.keyField.value == "user_name"){
	        alert("검색할 이름을 입력하세요.");
	        frm.keyWord.focus();
	        return false;
	    }
	    return true;
	}
</script>

	<!-- 네비게이션메뉴바 -->
	<nav id="nav" class="nav">
	<!-- 프로필 이미지 -->
		<div class="card" id="cardpro">
		  <img src="<%=context%>/hs_images/adminpro.png" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Admin</h5>
		    <p class="card-text">관리자입니다.</p>
		  </div>
		</div>
		<div class="d-grid gap-2 col-6" id="navmenu">
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/admain.do'">홈</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adMemList.do'">회원 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adTravelForm.do'">동행자 찾기 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adQnaForm.do'">Q&A 게시판 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='<%=context%>/adCommuForm.do'">회원커뮤니티 관리</button>
		</div>
	</nav>
	
	<!-- 본문 -->
	<article class="article" id="article">
	<div class="tablelist" style="overflow-x:auto;">
		<table class="table table-bordered">
		<caption>회원명단</caption>
		  <thead>
		    <tr>
		  		<td colspan="7">
		  			<form action="<%=context%>/adMemberSelect.do" name="frm" method="post" onsubmit="return searchCheck()">
		  			<select name="keyField" id="form-select" class="form-select form-select-sm" aria-label=".form-select-sm example">
					  <option value="0">---선택---</option>
					  <option value="user_id" <c:if test="${keyField eq 'user_id'}">selected</c:if>>아이디</option>
					  <option value="user_name" <c:if test="${keyField eq 'user_name'}">selected</c:if>>이름</option>
					</select>
					<input type="text" name="keyWord" placeholder="회원정보를 입력해주세요" maxlength="50"  <c:if test="${keyWord ne null}"> value="${keyWord}" </c:if>>
					<input type="submit" value="검색">
					<input type="button" value="이전" onclick="location.href='<%=context%>/adMemList.do'">
		  			</form>
		  		</td>
		  	</tr>
		    <tr>
		      <th scope="col">아이디</th>
		      <th scope="col">암호</th>
		      <th scope="col">이름</th>
		      <th scope="col">게시글수</th>
		      <th scope="col">댓글수</th>
		      <th scope="col">회원구분</th>
		      <th scope="col">정보수정</th>
		    </tr>
		  </thead>
		  <tbody>
	  		<c:forEach var="member" items="${list}">
		  	<tr>
		  		<td>${member.user_id}</td>
		  		<td>${member.user_pw}</td>
		  		<td>${member.user_name}</td>
		  		<td>${member.board_count}</td>
		  		<td>${member.comment_count}</td>
		  		<td>${member.user_gubun}</td>
		  		<td><input type="button" value="수정" onclick="location.href='<%=context%>/adMemUpdateForm.do?user_id=${member.user_id}&pageNum=${pageNum}'"></td>
		  	</tr>
	  		</c:forEach>
		  </tbody>
		</table>
	  </div>
	 </article>
		
<div style="margin-top: 100px, margin-left: 198px;"></div>
<c:import url="${context}/footer.jsp"></c:import>
</body>
</html>