<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<title>Insert title here</title>
<c:import url="../header.jsp" />

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/header_main.css">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
<script src="js/index.js" defer="defer"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<% 
String context = request.getContextPath();
%>
<!-- 커뮤니티 무한스크롤 ajax-->
<script type="text/javascript">
var count = 2;
$(window).scroll(function(){
	if($(window).scrollTop() == $(document).height() - $(window).height()) {	
		$.ajax({ 
			url: "<%=context%>/commuListScroll.do?pageNum="+count,
			success: function(result){
						$("#scroll").append(result);
						count = count+1;
					}
		});
	}
});	
console.log(count);
		
</script>
</head>
<body>
<!-- 	<header id="header" class="Headers_HeaderMainHeader burgkU">
		<div class="Headers__InnerSection bQvPOR">
			<div class="Headers__HeaderTopWrapDiv kKJwFS">
				<div class="Headers_HeaderTopInnerDiv cMXtHR">
					<img src="images/brand_logo.png" alt="logo" class="WebHeader_LogoImg hsELiP" onClick="location.href='index.jsp'">
				</div>
				<div class="Headers__HeaderTopInnerDiv-sc-1la7hl4-3 dnYUeR">
					<div width="300px"
						class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
						<span
							class="CommonIconSet__InitialIcon-sc-15eoam-0 CommonIconSet__MagnifierGrayIconContent-sc-15eoam-1 jZNHYY QjNCN"></span>
						<button></button>
						<input placeholder="동행을 찾아보세요!" value="">
					</div>
					<div class="Button__ButtonWrapper-sc-1vcxcg6-0 oIYRb">
						<button width="" height="" font-style="" type="button"
							class="Button__ButtonStyle-sc-1vcxcg6-1 eVZkjB">
							<a><p>로그인</p></a>
						</button>
					</div>
					<div class="Button__ButtonWrapper-sc-1vcxcg6-0 oIYRb">
						<button width="" height="" font-style="" type="button"
							class="Button__ButtonStyle-sc-1vcxcg6-1 jRRCxU">
							<a><p>회원가입</p></a>
						</button>
					</div>
					<div class="Button_dropdown oIYRb">
						<button width="100px" height="40px" font-style="" type="button"
							class="ButtonStyle kRVxKH">글쓰기</button>
						<div class="Popups__HeaderWritePopupDiv cymdDn">
							<button onClick="location.href='content.jsp'"
								class="Popups__HeaderWritePopupOptionButton-sc-1socb7k-1 cAHljB">
								<img src="images/letter_color.svg" alt="이미지" style="width: 33px; height: 24px;">
								<p>여행친구 찾기</p>
							</button>
							<button onclick="location.href='list.jsp'"
								class="Popups__HeaderWritePopupOptionButton-sc-1socb7k-1 cAHlmB">
								<img src="images/magnifier_color.svg" alt="이미지" style="width: 33px; height: 24px;">
								<p>여행 질문하기</p>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="Headers__HeaderContentWrapper-sc-1la7hl4-4 iEbwCp"
				style="justify-content: flex-start; margin: 0px 12px;">
				<button width="auto" font-size="16px" font-weight="bold"
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 leGRAZ"
					onClick="location.href='header.jsp'">홈</button>
				<button width="auto" font-size="16px" font-weight="400"
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdv"
					onClick="location.href='content.jsp'">동행</button>
				<button width="auto" font-size="16px" font-weight="400"
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdc"
					onClick="location.href='list.jsp'">Q&amp;A</button>
				<button width="auto" font-size="16px" font-weight="400"
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdf"
					onClick="location.href='commList.jsp'">여행 기록</button>
			</div>
		</div>
	</header> -->
<!-- main start -->	
	<main style="margin-top: 148px;">
		<!-- main 상단 고정이미지 -->
		<section class=" container-fluid py-5 text-center bg-img" style="height:300px; background-image: url('dh_images/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
				</div>
			</div>	
		</section>
		<!-- 검색창 -->
		<section class="container">
			<div class="row m-5 justify-content-md-center">	
				<div	
					class="col-md-auto Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
					<span
					class="CommonIconSet__InitialIcon-sc-15eoam-0 CommonIconSet__MagnifierGrayIconContent-sc-15eoam-1 jZNHYY QjNCN" style="margin-left: 5px;"></span>
					<button style="margin-left: 10px;"></button>
					<input placeholder="동행을 찾아보세요!" value="">
				</div>
				<div class="com-md-auto">
					<a class="btn btn-success" role="button" href="<%=context%>/commuWriteForm.do">글쓰기</a>
				</div>
			</div>	
			<!-- list start -->
			<c:if test="${totCnt > 0 }">
				<c:forEach var="commu" items="${list }" varStatus="status">	
					<div class="row m-5 justify-content-md-center">	
						
						<div class="col-md-auto">
							<div class="card shadow-sm">
								<div class="card-header d-flex">
									<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="dh_images/user.png" style="height: 30px; margin-right: 5px;">
									<span class="mt-2">${commu.user_id }</span>
									<!-- dropdown menu는 작성자만 수정 삭제 접근가능, else alert("작성자만 수정 삭제 가능합니다.") -->
									<div class="dropdown ms-auto">
								  		<button class="btn btn-icon-only" type="button" data-bs-toggle="dropdown" aria-expanded="false">
								  			<span class="bi bi-three-dots-vertical"></span>
								  		</button>
								  		<ul class="dropdown-menu">
								    		<li><a class="dropdown-item" href="#">수정</a></li>
								   			<li><a class="dropdown-item" href="#">삭제</a></li>
								  		</ul>
									</div>
								</div>
								<button class="nav-link" data-remote="<%=context%>/commuContent.do?c_num=${commu.c_num}&pageNum=${currentPage}" class="" data-bs-toggle="modal" data-bs-target=".bd-modal-xl">
			<!-- 게시글이미지 -->	<img class="rounded card-img-top" src="${imgList[status.index].c_img_path }">
								</button>								
								<div class="card-body d-flex">
									<p class="card-text">${commu.c_content }</p>
									
								</div>
								<div class="card-footer d-flex">
									<p class="mt-2">#${commu.c_hash }</p>
									<span class="ms-auto mt-2">${commu.c_date }</span>
								</div>
							</div>
						</div>
						<!-- Modal page-->
						<div class="col-md-auto modal bd-modal-xl fade" tabindex="-1" role="dialog" aria-labelledby="bd-modal-xl" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-xl">
								<div class="modal-content">

								</div>
							</div>
					    </div>
						<!-- end modal -->
						<!-- Call modalContent.jsp Script -->
						<script>
							$('.bd-modal-xl').on('show.bs.modal', function(e) {
						
								var button = $(e.relatedTarget);
								var modal = $(this);
								
								modal.find('.modal-content').load(button.data("remote"));
						
							});
						</script>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt == 0 }">
				<h1>데이터가 없네</h1>
			</c:if>
			<!-- end list -->
			<div id="scroll"></div>
		</section>
	</main>
	
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
</body>
</html>