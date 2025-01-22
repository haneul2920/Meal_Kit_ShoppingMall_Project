	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">

<div id="header">
    <!-- 로고 -->
    <div id="logo">
        <a href="${contextPath}/main/main.do">
            <img alt="cookit" src="${contextPath}/resources/image/logo2.png">
        </a>
    </div>
    
    <!-- 검색창 -->
<div id="search-bar">
    <input type="search" placeholder="인기 맛집 콜라보 제품은 여기">
    <button></button>
</div>
    
    <!-- 아이콘 섹션 -->
    <div id="icon-section">
        <a href="${contextPath}/user/userForm.do">회원가입</a>
        <a href="${contextPath}/user/loginForm.do">로그인</a>
        <a href="${contextPath}/service_center">고객센터</a>
    </div>
</div>

<!-- 메뉴 -->
<ul id="menu">
    <li class="dropdown">카테고리
        <ul class="dropdown-menu">
            <li><a href="#">카테고리1</a></li>
            <li><a href="#">카테고리2</a></li>
            <li><a href="#">카테고리3</a></li>
        </ul>
    </li>
    <li>신제품</li>
    <li>베스트</li>
    <li>특가</li>
    <li>선물하기</li>
    <li>이벤트</li>
</ul>

