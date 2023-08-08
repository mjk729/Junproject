<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="contents d-flex justify-content-center">
			<div class="join-box">
			<div class="d-flex mt-3">
				<input type="text" placeholder="아이디" class="form-control mt-5"
					id="idInput">
				<button type="button" id="compareBtn" class="btn btn-secondary btn-sm ml-2 mt-5">중복확인</button>
			</div>
				<input type="password" placeholder="비밀번호"
					class="form-control mt-2 mb-2" id="passwordInput"> <input
					type="password" placeholder="비밀번호 확인"
					class="form-control mt-2 mb-2" id="passwordConfirmInput"> <input
					type="text" placeholder="이름" class="form-control mt-2 mb-2"
					id="nameInput"> <input type="text" placeholder="이메일"
					class="form-control mt-2 mb-5" id="emailInput">
				<button type="button" class="btn btn-secondary btn-block mt-3 mb-3"
					id="joinBtn">가입</button>

			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>

	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {

			var isChecked = false;
			var isDuplicateId = true;
			
			$("#idInput").on("input", function(){
				// 중복과 관련된 모든 상황을 초기화 한다.
				isChecked = false;
				isDuplicateId = true;
				
			});
			
			$("#compareBtn").on("click", function() {

				let id = $("#idInput").val();

				if (id == "") {
					alert("아이디를 입력하세요");
					return;
				}

				$.ajax({
					type : "get",
					url : "/user/compareId",
					data : {
						"loginId" : id
					},
					success : function(data) {
						isChecked = true;
						
						isDuplicateId = data.isDuplicate;
						if (data.isDuplicate) {
							alert("사용가능한 아이디입니다");

						} else {	
							alert("이미 존재하는 아이디입니다");
						
						}
					},
					error : function() {
						alert("아이디 중복확인 에러!!");
					}
				});

			});

			$("#joinBtn").on("click", function() {

				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				
				// 유효성 검사
				if (id == "") {
					alert("아이디를 입력하세요");
					return;
				}

				// 중복확인 안한경우
				if(!isChecked){
					alert("아이디 중복확인을 해주세요");
					return;
				}
				
				// 중복된 id인 경우
				if(!isDuplicateId){
					alert("중복된 Id 입니다.");
					return;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}

				if (password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				if (name == "") {
					alert("이름을 입력하세요");
					return 0;
				}
				if (email == "") {
					alert("이메일을 입력하세요");
					return;
				}

				$.ajax({
					type : "post",
					url : "/user/join",
					data : {
						"loginId" : id,
						"password" : password,
						"name" : name,
						"email" : email
						
					},
					success : function(data) {
						if (data.result == "success") {
							location.href = "/user/login-view";
						} else {
							alert("가입 실패");
						}
					},
					error : function() {
						alert("가입 에러!!");
					}
				});

			});

		});
	</script>

</body>
</html>