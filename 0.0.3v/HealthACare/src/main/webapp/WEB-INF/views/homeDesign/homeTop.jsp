<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="${cp}/resources/js/ImgEncoding.js"></script>
<link rel="stylesheet" href="${cp}/resources/NullMemberCommon.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="top">
	<div id="Search">
	<img alt="" src="${cp}/resources/img/Magnifier.png">
	<input placeholder="Event, Place or type" type="search" >
	</div>
	<div>
	<c:choose>	
    <c:when test="${empty login}">
<!--         <p>비회원</p> -->
			<a href="${cp}/page/login">
        	<div id="signupBox"> SIGN UP	</div>
			</a>
    </c:when>
    <c:otherwise>
<%--         <p>${login}</p> --%>
<!--         마이페이지(로그인 시 노출)</a> -->
	<div id="user">	
    <a href="${cp}/page/logout" class="out">LOGOUT</a>
	<img class="icon" alt="bell" src="${cp}/resources/img/bell.png"> 
	<a href="${cp}/page/myPage?uno=${login.getU_no()}">
	<div class="box">
<<<<<<< HEAD
	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">
	${login.getI_name()}
=======
<<<<<<< HEAD

	<img class="Profile"  alt="사용자 프로필" src="${cp}/resources/img/profile.jpg">
	${login.getI_name()}

=======
	${login.getI_name()}
>>>>>>> 4658aa8b20a89a788332ab83f3266adfa31f6803
>>>>>>> 48e00d35c6a152e4a20d24d542d4ce586ecc5440
	<div  class="myImg"></div>
	</div>
	</a>
	</div>
    </c:otherwise>
</c:choose>
	</div>
</div>


</body>
</html>