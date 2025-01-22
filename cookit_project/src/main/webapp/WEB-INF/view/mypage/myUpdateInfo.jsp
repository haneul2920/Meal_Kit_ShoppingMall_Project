<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ include file="/WEB-INF/view/common/layout.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>나의 페이지</title>
    
    <script>
        function validatePassword() {
            const password2 = document.querySelector('input[name="password2"]').value;
            const password3 = document.querySelector('input[name="password3"]').value;
            if (password2 !== password3) {
                alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false;
            }
            return true;
        }
    </script>
    
</head>
<body>
    <div class="container">
        <h1>My Page</h1>
        

        <c:if test="${not empty message}">
            <p class="success-message">${message}</p>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <p class="error-message">${errorMessage}</p>
        </c:if>
        
        <form action="mypage/updateInfo.do" method="post" onsubmit="return validatePassword()">

            <div class="form-section">
                <h2>사용자 정보 수정</h2>
                <div class="form-group">
                    <label>아이디:</label>
                    <input type="text" name="name" value="${userInfo.name}" readonly>
                </div>
                <div class="form-group">
                    <label>사용자 이름:</label>
                    <input type="text" name="username" value="${userInfo.username}">
                </div>
                <div class="form-group">
                    <label>전화번호:</label>
                    <input type="text" name="phoneNum" value="${userInfo.phoneNum}">
                </div>
                <div class="form-group">
                    <label>이메일:</label>
                    <input type="email" name="email" value="${userInfo.email}">
                </div>
                <div class="form-group">
                    <label>주소:</label>
                    <input type="text" name="address" value="${userInfo.address}">
                </div>
            </div>
            
            <div class="form-section">
                <h2>비밀번호 변경</h2>
                <div class="form-group">
                    <label>기존 비밀번호:</label>
                    <input type="password" name="password1" required>
                </div>
                <div class="form-group">
                    <label>새 비밀번호:</label>
                    <input type="password" name="password2" minlength="8" required>
                </div>
                <div class="form-group">
                    <label>새 비밀번호 확인:</label>
                    <input type="password" name="password3" minlength="8" required>
                </div>
            </div>            
            
            <div class="form-actions">
                <button type="submit" class="save-btn">정보 수정</button>
                <button type="button" class="cancel-btn" onclick="window.location.href='/mypage';">취소</button>
            </div>
        </form>
    </div>
</body>
</html>