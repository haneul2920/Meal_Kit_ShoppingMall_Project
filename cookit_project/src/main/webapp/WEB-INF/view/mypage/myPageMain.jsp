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
    			<p><strong>아이디: ${userInfo.user_id}</strong></p>
    			<p><strong>이메일: ${userInfo.email1}@${userInfo.email2}</strong></p>
    			<p><strong>이름: ${userInfo.username}</strong></p>
   		 		<p><strong>전화번호: ${userInfo.phone_num}</strong></p>
    			<p><strong>주소: ${userInfo.roadAddress}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    							${userInfo.jibunAddress}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    							${userInfo.namujiAddress}</strong></p>
    			<p><strong>우편번호: ${userInfo.zipcode}</strong></p>

			<div class="section points">
				<h2>포인트</h2>
				<p><strong>보유 포인트: </strong>${user.cash_point}원</p>
				<a href="${contextPath}/point/pointHistory.do" class="button">포인트 내역</a>
			</div>
			
			<div class="section account">
				<h2>회원 관리</h2>
				<a href="${contextPath}/user/updateForm.do">개인 정보 수정</a>
				<a href="" class="button danger"
				onclick="return confirm('정말로 탈퇴 하시겠습니까? 탈퇴 시 복구할 수 없습니다.');">회원 탈퇴</a>
			</div>
		</div>
	</div>
</body>
</html>