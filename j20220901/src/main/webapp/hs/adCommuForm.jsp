<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="${context}/headerLogin.jsp"></c:import>
<link rel="stylesheet" href="css/adminStyle.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<!-- 네비게이션메뉴바 -->
	<nav id="nav" class="nav">
	<!-- 프로필 이미지 -->
		<div class="card" id="cardpro">
		  <img src="hs_images/adminpro.png" class="card-img-top" alt="...">
		  <div class="card-body">
		    <h5 class="card-title">Admin</h5>
		    <p class="card-text">관리자입니다.</p>
		  </div>
		</div>
		<div class="d-grid gap-2 col-6" id="navmenu">
		  <button class="btn btn-primary" type="button" onclick="location.href='admain.do'">홈</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='adMemList.do'">회원 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='adTravelForm.do'">동행자 찾기 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='adQnaForm.do'">Q&A 게시판 관리</button>
		  <button class="btn btn-primary" type="button" onclick="location.href='adCommuForm.do'">회원커뮤니티 관리</button>
		</div>
	</nav>
	
	<!-- 본문 -->
	<article class="article" id="article">
		<div class="table-responsive">
		  <table class="table">
		    <caption>회원커뮤니티</caption>
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">아이디</th>
			      <th scope="col">본문</th>
			      <th scope="col">작성일</th>
			      <th scope="col">삭제</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>찐 맛집 소개</td>
			      <td>신동호</td>
			      <td>cc</td>
			      <td>여긴 찐맛집 인정</td>
			      <td>22.09.24</td>
			      <td><input type="button" value="삭제"></td>
			    </tr>
			  </tbody>
		  </table>
		</div>
		
		<!-- 페이지네비게이션 -->
	</article>
	
<div style="margin-top: 100px, margin-left: 198px;"></div>
<c:import url="${context}/footer.jsp"></c:import>
</body>
</html>