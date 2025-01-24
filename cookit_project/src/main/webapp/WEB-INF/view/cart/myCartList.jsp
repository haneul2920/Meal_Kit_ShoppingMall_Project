<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="utf-8">
<title>장바구니</title>
    <style>
        .cart-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin: 20px;
            font-family: Arial, sans-serif;
        }
        .cart-items {
            flex: 3;
            border: 1px solid #ccc;
            padding: 10px;
        }
        .cart-summary {
            flex: 1;
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        .cart-summary button {
            background-color: orange;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        .cart-summary button:hover {
            background-color: darkorange;
        }
        .cart-totals {
            flex-basis: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            padding: 10px;
            border-top: 1px solid #ccc;
        }
        .cart-totals div {
            font-size: 16px;
        }
    </style>
</head>
<body>
	<h2>장바구니</h2>

	<div id="cart">
		<c:choose>
			<c:when test="${empty cartItems}">
				<p>장바구니에 담긴 상품이 없습니다.</p>
				<input type="button" value="쇼핑계속하기"
					onclick="location.href='${contextPath}/main/main.do'">
			</c:when>
			<c:otherwise>
				<h3>장바구니 상품</h3>
				<c:forEach var="item" items="${cartItems}">
					<div class="cart-item">
						<p>상품명: ${item.product_name}</p>
						<p>가격: ${item.price}원</p>
						<p>수량: ${item.product_amount}</p>
					</div>
				</c:forEach>

				<div class="cart-summary">
					<h3>결제 예정 금액</h3>
					<p>상품금액: ${totalPrice}원</p>
					<p>배송비: ${shippingFee}원</p>
					<p>
						<strong>총 결제 예정 금액: ${finalPrice}원</strong>
					</p>
					<button onclick="location.href='${contextPath}/checkout.do'">주문하기</button>
				</div>

				<div class="cart-totals">
					<div>장바구니 총합: ${totalPrice}원</div>
					<div>+</div>
					<div>배송비: ${shippingFee}원</div>
					<div>=</div>
					<div>
						<strong>총합 가격: ${finalPrice}원</strong>
					</div>
				</div>

			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>