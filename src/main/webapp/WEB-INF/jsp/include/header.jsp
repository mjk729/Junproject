<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header>
    <div class="d-flex flex-column">
    	<div class="d-flex align-items-center justify-content-center">
        <h1>Jungram</h1>
    	</div>
        <div class="d-flex align-items-center justify-content-end">
        <%-- 세션에 userId 값이 있으면 사용자 정보 태그 포함 --%>
        <c:if test="${not empty userId }" >
            <div class="mr-2">${userName}<a href="/user/logout"> 로그아웃</a></div>
        </c:if>
        </div>
    </div>
    </header>
</body>
</html>
