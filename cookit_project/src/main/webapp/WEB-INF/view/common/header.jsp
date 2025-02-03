	<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<link href="${contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" media="screen">
<style>
    #search-bar button {
        border: none;
        background: transparent url("${contextPath}/resources/image/search_icon.png") no-repeat center;
        background-size: 20px 20px; /* 아이콘 크기 설정 */
        cursor: pointer;
        padding: 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 30px; /* 버튼 크기 지정 */
        height: 30px;
    }
	/* 버튼 호버 시 배경 이미지 변경 */
	#search-bar button:hover {
	    background-image: url("${contextPath}/resources/image/search_hover_icon.png");
	}
</style>
<div id="header">
    <!-- 로고 -->
    <div id="logo">
        <a href="${contextPath}/main/main.do">
            <img alt="cookit" src="${contextPath}/resources/image/logo2.png">
        </a>
    </div>
    <!-- 검색창 -->
<form id="search-bar" action="${contextPath}/product/searchProduct.do" method="GET">
	<input type="search" name="searchWord" placeholder="인기 맛집 콜라보 제품은 여기">
	<button></button>
</form>

    <div id="head_link">		
		 <c:choose>
			  <c:when test="${isLogOn==true and not empty userInfo }">
			   <a href="${contextPath}/user/logout.do">로그아웃</a>
			   <a href="${contextPath}/mypage/myPageMain.do">마이페이지</a>
			   <a href="${contextPath}/cart/myCartList.do">장바구니</a>
			   <a href="#">배송조회</a>
			 </c:when>
		 <c:otherwise>
			   <a href="${contextPath}/user/loginForm.do">로그인</a>
			   <a href="${contextPath}/user/loginSelectForm.do">회원가입</a>
		 </c:otherwise>
		</c:choose>
			   <a href="${contextPath}/service/center.do">고객센터</a>
      	<c:if test="${isLogOn==true and userInfo.user_id =='admin' }">  
	   	  		<a class="no_line" href="${contextPath}/admin/adminProductMain.do">관리자페이지</a>
	    </c:if>
	</div>
</div>

<!-- 메뉴 -->
<ul id="menu">
    <li class="dropdown">카테고리
        <ul class="dropdown-menu">
        	<li><a href="${contextPath}/product/productCategory.do?category_id=0" style="text-decoration:none;color:black;">전체</a></li>
            <li><a href="${contextPath}/product/productCategory.do?category_id=1" style="text-decoration:none;color:black;">한식</a></li>
            <li><a href="${contextPath}/product/productCategory.do?category_id=2" style="text-decoration:none;color:black;">중식·일식</a></li>
            <li><a href="${contextPath}/product/productCategory.do?category_id=4" style="text-decoration:none;color:black;">양식</a></li>
            <li><a href="${contextPath}/product/productCategory.do?category_id=5" style="text-decoration:none;color:black;">분식</a></li>
            <li><a href="${contextPath}/product/productCategory.do?category_id=6" style="text-decoration:none;color:black;">동남아</a></li>
        </ul>
    </li>
    <li>신제품</li>
    <li>베스트</li>
    <li>특가</li>
    <li>선물하기</li>
    <li>이벤트</li>
</ul>
