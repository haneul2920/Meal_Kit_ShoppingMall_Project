<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<html>
<head>
<meta charset="utf-8">
<title>회원 정보 페이지</title>

<body>
	<div>
		<div class="section info">
			<h2>회원 정보</h2>
			<p><strong>이름: ${user.name}</strong></p>
			<p><strong>이메일: ${user.name}</strong></p>
			<p><strong>전화번호: ${user.name}</strong></p>
			
			<div class="section points">
				<h2>포인트 및 쿠폰</h2>
				<p><strong>보유 포인트: </strong>${user.points}.</p>
				<a href="${contextPath}/point/pointHistory.do" class="button">포인트 내역</a>
				<p><strong>보유 쿠폰: </strong>${user.points}.</p>
				<a href="${contextPath}/coupon/couponHistory.do" class="button">쿠폰 내역</a>
			</div>
			
			<div class="section account">
				<h2>회원 관리</h2>
				<a href="${contextPath}/mypage/myUpdateInfo.do">개인 정보 수정</a>
				<a href="" class="button danger"
				onclick="return confirm('정말로 계정을 삭제하시겠습니까? 삭제 시 복구할 수 없습니다.');">계정 삭제</a>
			</div>
		</div>
	</div>
</body>
</html>