	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<html>
<head>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
	<div id="logo">
		<a href="${contextPath}/main/main.do">로고(홈버튼)</a>
	</div>
	<div id="search-bar">
		<input type="text" placeholder="검색창" />
	</div>
	<div id="icon-section">
		<a href="${contextPath}/user/userForm.do">회원가입</a>
		<a href="${contextPath}/user/loginForm.do">로그인</a>
		<a href="${contextPath}/service/center.do">고객센터</a>
	</div>
	<ul id="menu">
		<li>카테고리</li>
		<li>신제품</li>
		<li>베스트</li>
		<li>특가</li>
		<li>선물하기</li>
		<li>이벤트</li>
	</ul>
	<div id="banner">광고 배너</div>

<ul id="menu">
    <li class="dropdown">
        카테고리
        <ul class="dropdown-menu">
            <li><a href="#">카테고리1</a></li>
            <li><a href="#">카테고리2</a></li>
            <li><a href="#">카테고리3</a></li>
        </ul>
    </li>
</ul>

</body>
</html>