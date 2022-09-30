<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
 	caption {
	font-size: 24px;
	}
.joinform{
    box-shadow: 10px 10px 10px 10px rgba(89,89,89,0.39);
    padding:70px 45px 45px 45px;
    display : inline-block;
}
	pre {
	font-size: 8pt;
	font-color: #gray;
}
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function chk() {
	if (frm.user_pw.value != frm.user_pw2.value) {
		alert("암호가 다릅니다");
		frm.user_pw.focus();
		return false;
	}

}
/* $(function(){
	$('#chk').click(function(){
		var id       = $('#id').val();
		var sendData = 'id='+id
		alert('sendData->'+sendData);
		$.ajax({
			url      : 'idCheckForm.do', 
			dataType : 'text',
			data     : sendData,
			success  : function(data1) {
				$('#msg').html(data1);
			}
		});
	});
}); */
function winop() {
	window.open("idCheckForm.do?user_id=" + user_id, "kkk",	"width=300 height=300");
}
</script>
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
		<tbody>
		<div class="joinform" style="margin-top:200px; margin-left: 28%;">
	<form  action="joinPro.do" method="post" id="frm" name="frm" onsubmit="return chk()">
		<table>
		<thead>
			<tr>
				<th colspan="3"><h3>회원가입</h3></th>
		</thead>
			<tr>
				<td style="width: 120px;">아이디</td>
				<td><input type="text"     name="user_id" id="user_id" required="required"></td>
				<td style="width: 50px;"><input type="submit"   value="아이디체크" onclick="winop()"><span id = "msg"></span></td>
			</tr>
			<tr>
				<td style="width: 120px;">비밀번호</td>
				<td><input type="password" name="user_pw" id="user_pw" required="required" onclick=""></td>
			</tr>
			<tr>
				<td style="width: 120px;">비밀번호확인</td>
				<td><input type="password" name="user_pw2" id="user_pw2" required="required"></td>
				<td><input type="button" value="비밀번호체크" onclick="chk()"></td>
			</tr>
			<tr>
				<td style="width: 120px;">이메일</td>
				<td><input type="email" name="user_email" required="required" placeholder="example@naver.com" ></td>
			</tr>
			<tr>
				<td style="width: 120px;">이름</td>
				<td><input type="text" name="user_name" required="required"></td>
			</tr>
			<tr>
				<td style="width: 120px;">본인 소개</td>
				<td><textarea rows="10" cols="50" name="user_info" placeholder="다른 회원님들이 알 수 있도록 소개 부탁드려요!"></textarea> </td>
			</tr>
			<tr>
				<td style="width: 120px;">생년월일</td>
				<td><input type="date" name="user_birth" required="required" pattern="\d{8}" placeholder="생년월일8자리"></td>
			</tr>
			<tr>
				<td style="width: 120px;">성별</td>
				<td>남 <input type="radio" name="user_gender" value="M" checked="checked">
					여 <input type="radio" name="user_gender" value="F"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="user_tel" required="required"
					pattern="\d{2,3}-\d{3,4}-\d{4}" placeholder="010-xxxx-xxxx"
					title="2,3자리-3,4자리-4자리"></td>
			</tr>
			<tr>
				<td>회원구분<input type="hidden" name="user_gubun"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="image" name="user_img"></td>
			<tr>
				<th colspan="3"><input type="submit" value="가입">
				<input type="reset" value="가입 취소"></th>
			</tr>
		</table>
	</form>	
		</div>
	</tbody>
	<footer class="py-5 bg-dark" style="margin-top: 100px;">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your	Website 2022</p>
		</div>
	</footer>	
</body>
</html>