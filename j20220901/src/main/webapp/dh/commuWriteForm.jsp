<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
	<header id="header" class="Headers_HeaderMainHeader burgkU">
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
					class="ButtonWithToggle__ButtonWrapper-sc-12hyxzf-0 cFXvdc"
					onClick="location.href='history.jsp'">여행 기록</button>
			</div>
		</div>
	</header>
	
<!-- main start -->
	<div style="margin-top: 148px;">
		<section class=" container-fluid py-5 text-center bg-img" style="height:300px; background-image: url('images/commImages/bgimg.jpg');">
			<div class="mt-5 row">
				<div class="col">
					<p class="mt-2 text-white">자유롭게 당신의 일상을 공유하세요</p>
					<p class="text-white" style="font-size: 60px; font-weight: bold;">커뮤니티</p>
				</div>
			</div>	
		</section>
		<!-- form 시작 -->
		<div class="row m-5 justify-content-md-center">
			<!-- do 요청 위치 -->
			<form action="commuWritePro.do?pageNum=${pageNum }" method="post">
				<div class="custom-file row">
	         <!-- 	<input type="file" class="custom-file-input" id="validatedCustomFile" required> -->
					<input type="file" class="custom-file-input"  id="validatedCustomFile" required style="display: none; margin: 0px; padding: 0px;">
					<label class="custom-file-label" for="validatedCustomFile">
						<!-- <img class="img-thumbnail" src="images/bgimg.jpg"> -->
						<svg class="bd-placeholder-img card-img-top" width="100%" height="300px;" xmlns="" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="45%" y="50%" fill="#eceeef" dy=".3em">사진 업로드</text></svg>
					</label>
					<div class="invalid-feedback">Example invalid custom file feedback</div>
				</div>
				
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="9" name="c_content" placeholder="게시글 내용을 입력하세요"></textarea>
				</div>
				<div class="form-group">
					<textarea class="form-control mt-5" id="exampleFormControlTextarea1" rows="1" name="c_hash"    placeholder="태그를 입력하세요. 입력 예시 : #제주도#음식#카페"></textarea>
				</div>
				<div class="mt-5 row">
					<div class="col-md-6">
						<button type="reset" class="btn btn-secondary btn-block" style="width: 100%; height: 50px;">취소</button>
					</div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success btn-block" style="width: 100%;  height: 50px;">확인</button>
					</div>
				</div>
			</form>
			
		</div>
	</div>
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2022</p>
		</div>
	</footer>
</body>
</html>