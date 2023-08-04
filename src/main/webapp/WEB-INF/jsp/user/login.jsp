<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<style>
    .image-container {
        display: flex;
        align-items: center;
        justify-content: left;
    }
</style>
</head>
<body>

<div id="wrap">
    <c:import url="/WEB-INF/jsp/include/header.jsp" />
    <section class="contents d-flex justify-content-center">
        <div class="image-container">
            <img alt="사진" src="/static/duck.webp" class="mr-5" width="300">
        </div>
        <div class="join-box mt-5 text-center">
        <h1 class="my-5">로그인</h1>
            <input type="text" placeholder="아이디" class="form-control mt-2 mb-2"
                id="idInput">
            <input type="password" placeholder="비밀번호"
                class="form-control mt-2 mb-2" id="passwordInput">
            <a href="/user/join-view" class="">회원가입</a>
            <button type="button" class="btn btn-secondary btn-block mt-3 mb-3"
                id="loginBtn">로그인</button>
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

</body>
</html>
