<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String context = request.getContextPath();
	String userId = (String) session.getAttribute("user_id");
	request.setAttribute("userId", userId);
%>
<c:import url="${context}/headerAdmin.jsp"></c:import>
<link rel="stylesheet" href="<%=context%>/hs/css/adminStyle.css">
<link rel="stylesheet" href="<%=context%>/hs/css/calstyle.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- header -->
<link rel="stylesheet" href="css/header_main.css">
<script src="js/index2.js" defer="defer"></script>
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
		<!-- 공지글 -->
      <div class="notice-card">
         <div class="card-header">공지</div>
         <div class="card-body">
            <blockquote class="blockquote mb-0">
               <p>관리자 페이지 입니다.</p>
            </blockquote>
         </div>
      </div>
      
      <!-- 캘린더 -->
		<div class="calendar">
	        <div class="calendar_header">
	            <div class="ym-wrapper">
	                <span class="year"></span>년
	                <span class="month"></span>월
	            </div>
	            <div class="calendar_nav">
	                <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
	                <button class="nav-btn go-today" onclick="goToday()">오늘</button>
	                <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
	            </div>
	        </div>
	        <div class="calendar_main">
	            <div class="days">
	                <div class="day">일</div>
	                <div class="day">월</div>
	                <div class="day">화</div>
	                <div class="day">수</div>
	                <div class="day">목</div>
	                <div class="day">금</div>
	                <div class="day">토</div>
	            </div>
	            <div class="dates"></div>
	        </div>
	    </div>
	    <script src="<%=context%>/hs/js/cal.js"></script>
	</article>
	
<div style="margin-top: 100px, margin-left: 198px;"></div>
<c:import url="${context}/footer.jsp"></c:import>
</body>
</html>