<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .product-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .product-header h1 {
            font-size: 24px;
            margin: 0;
        }

       span {
            font-size: 24px;
            font-weight: bold;
            color: #f36a1d;
        }

        .product {
            display: flex;
            margin-top: 20px;
        }

        .product-image {
            flex: 1;
            max-width: 400px;
            padding: 10px;
        }

        .product-image img {
            width: 100%;
            border-radius: 8px;
        }

        .product-details {
            flex: 2;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .details-section {
            margin-bottom: 20px;
        }

        .details-section h2 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .details-section p {
            margin: 0;
        }

        .buy-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .quantity {
            display: flex;
            align-items: center;
        }

        .quantity input {
            width: 50px;
            text-align: center;
            margin: 0 10px;
        }

        .buy-buttons {
            display: flex;
            gap: 10px;
        }

        .buy-buttons button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }

        .buy-now {
            background-color: #f36a1d;
            color: white;
        }

        .add-cart {
            background-color: #eeeeee;
        }
    </style>
</head>
<body>
    <div class="container">
<!--         <div class="product-header">
            <h1>[투다리] 푸짐한 사각 꼬치어묵탕</h1>
            <span class="product-price">12,900원</span>
        </div> -->
        <div class="product">
            <div class="product-image">
            	<img alt="HTML5 &amp; CSS3"
				src="${contextPath}/thumbnails.do?product_id=${product.product_id}&fileName=${product.product_imageName}">
            </div>
            <div class="product-details">
                <div class="details-section">
                    <h2>>${goods.goods_title }</h2>
                </div>
                <div class="price">
                	<h3>12,900원</h3>
                </div>
                <div class="details-section">
                    <h2>배송 안내</h2>
                    <p>배송비: 3,000원</p>
                    <p>40,000원 이상 구매 시 무료배송</p>
                </div>
                <div class="buy-section">
                    <div class="quantity">
                        <label for="quantity">수량:</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1">
                    </div>
                <div class="product_price">
                	<label for="price">구매예정 금액:</label>
                	<span>12,900원</span>
                </div>
                    <div class="buy-buttons">
                        <button class="add-cart">장바구니</button>
                        <button class="buy-now">바로구매</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</body>
</html>