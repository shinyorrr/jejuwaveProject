<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
   String context = request.getContextPath();
%>
<c:import url="${context}/hs/headerLogin.jsp"></c:import>
<link rel="stylesheet" href="<%=context%>/hs/css/adminStyle.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
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
	  <form id="memform" action="adMemUpdatePro.do" method="post">
	  	<input type="hidden" name="user_id" value="${member.user_id}">
	  	<input type="hidden" name="user_pw" value="${member.user_pw}">
	  	<input type="hidden" name="user_email" value="${member.user_email}">
	  	<input type="hidden" name="user_name" value="${member.user_name}">
	  	<input type="hidden" name="user_birth" value="${member.user_birth}">
	  	<input type="hidden" name="user_tel" value="${member.user_tel}">
	  	<input type="hidden" name="user_info" value="${member.user_info}">
		<input type="hidden" name="pageNum" value="${pageNum}">
	  	<div class="input-group mb-3">
		  아이디 : ${member.user_id}
		</div>
		<div class="input-group mb-3">
		  비밀번호 : ${member.user_pw}
		</div>
		<div class="input-group mb-3">
		  이메일 : ${member.user_email}
		</div>
		<div class="input-group mb-3">
		  이름 : ${member.user_name}
		</div>
		<div class="input-group mb-3">
		  생년월일 : ${member.user_birth}
		</div>
		<div class="input-group mb-3">
		  전화번호 : ${member.user_tel}
		</div>
		<div class="input-group" id="textinfo">
		  <span class="input-group-text">소개글</span>
		  <textarea rows="3" cols="40" class="form-control" aria-label="With textarea" readonly="readonly">${member.user_info}</textarea>
		</div>
		<div class="input-group mb-3">
		  <label class="input-group-text" for="inputGroupSelect01">이용자구분</label>
		  <select class="form-select" id="inputGroupSelect01" name="user_gubun" >
			<c:choose>
				<c:when test="${member.user_gubun == 0}">
					<option value="none">==회원구분==</option>
					<option value="0" selected="selected">관리자</option>
					<option value="1">일반회원</option>
				</c:when>
				<c:otherwise>
					<option value="none">==회원구분==</option>
					<option value="0">관리자</option>
					<option value="1" selected="selected">일반회원</option>
					</c:otherwise>
			  </c:choose>
			</select>
		</div>
		<div class="mybtn">
			<input class="btn btn-primary" type="submit" value="수정완료">
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
	  </form>
	</article>
	
<div style="margin-top: 100px, margin-left: 198px;"></div>
<c:import url="${context}/footer.jsp"></c:import>
</body>
</html>