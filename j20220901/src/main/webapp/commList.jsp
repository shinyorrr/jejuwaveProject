<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/header_history.css">
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
</head>
<body>
	<header id="header" class="Headers_HeaderMainHeader burgkU">
		<div class="Headers__InnerSection bQvPOR">
			<div class="Headers__HeaderTopWrapDiv kKJwFS">
				<div class="Headers_HeaderTopInnerDiv cMXtHR">
					<img src="images/brand_logo.png" alt="logo" class="WebHeader_LogoImg hsELiP" onClick="location.href='main.jsp'">
				</div>
				<div class="Headers__HeaderTopInnerDiv-sc-1la7hl4-3 dnYUeR">
					<div width="300px"
						class="Search__SearchInputWrappper-sc-1ef83fv-0 beOSqn">
						<span
							class="CommonIconSet__InitialIcon-sc-15eoam-0 CommonIconSet__MagnifierGrayIconContent-sc-15eoam-1 jZNHYY QjNCN"></span>
						<button></button>
						<input placeholder="동행을 찾아보세요!" onfocus="this.placeholder = ''" onblur="this.placeholder = '동행을 찾아보세요!'" value="">
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
					onClick="location.href='main.jsp'">홈</button>
				<button width="auto" font-size="16px" font-weight="400"
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdv"
					onClick="location.href='content.jsp'">동행</button>
				<button width="auto" font-size="16px" font-weight="400"
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdc"
					onClick="location.href='#'">Q&amp;A</button>
				<button width="auto" font-size="16px" font-weight="400"
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdf"
					onClick="location.href='commList.jsp'">여행 기록</button>
			</div>
		</div>
	</header>
	
	<main style="margin-top: 148px;">
		<section class=" container-fluid py-5 text-center bg-img" style="height:300px; background-image: url('images/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="mt-6 text-white">자유롭게 당신의 일상을 공유하세요</p>
					<h1 class="text-white">커뮤니티</h1>
				</div>
			</div>	
		</section>
		
		<section class="container">
			<!-- <div class="row m-5 justify-content-md-center">
				<div class="col-md-auto d-flex" >
					<input type="search" class="mt-1 mb-1" placeholder="search..." style="height: 35px; margin-right: 10px;">
					<input class="ml-2 mt-1 btn btn-success ms-auto" type="submit" value="검색" style="height: 35px;"> 
				</div>
			</div> -->	
			<form>
			  <div class="input-group">
				<input type="text" class="form-control" placeholder="Search">
				<div class="input-group-btn">
				  <button class="btn btn-default" type="submit">
					<i class="glyphicon glyphicon-search"></i>
				  </button>
				</div>
			  </div>
			</form>
			
			<div class="row m-5 justify-content-md-center">	
				<div class="col-md-auto">
					<div class="card shadow-sm">
						<div class="card-header d-flex">
							<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="images/user.png" style="height: 30px; margin-right: 5px;">
							<span class="mt-2">회원아이디</span> <span class="ms-auto mt-2">작성날짜</span>
						</div>
						<!-- <img class="btn card-img-top" src="images/5_2.jpg"> -->
						<button type="button" class="btn" data-toggle="modal" data-target="#bd-example-modal-lg"><img class="rounded card-img-top" src="images/5_2.jpg"></button>
						<!-- Large modal -->
						<div class="modal fade bd-example-modal-lg" id="bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg">
							<div class="modal-content">
							  ...
							</div>
						  </div>
						</div>
						<script type="text/javascript">
						 import { Modal } from 'mdb-ui-kit';
						</script>
						<div class="card-body">
							<p class="card-text">본문내용</p>
							<p>#태그 #태그 #태그</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row m-5 justify-content-md-center">
				<div class="col-md-auto">
					<div class="card shadow-sm">
						<div class="card-header d-flex">
							<img class="mt-1 mb-1 img-fluid rounded-circle" alt="회원이미지" src="images/user.png" style="height: 30px; margin-right: 5px;">
							<span class="mt-2">회원아이디</span> <span class="ms-auto mt-2">작성날짜</span>
						</div>
						<img class="card-img-top" src="images/5_2.jpg">	
						<div class="card-body">
							<p class="card-text">본문내용</p>
							<p>#태그 #태그 #태그</p>
						</div>
					</div>
				</div>
			</div>
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