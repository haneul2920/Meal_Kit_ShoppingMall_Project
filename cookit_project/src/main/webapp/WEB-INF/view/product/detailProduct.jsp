<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <style>
      html {
       scroll-behavior: smooth; /* 부드러운 스크롤 효과 */
      }

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
        
        .product-price {
            display: flex;
            justify-content: space-between;
        }

       .product-price span {
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
            width: 450px; /* 원하는 너비 설정 */
            border-radius: 8px;
        }

        .product-details {
            flex: 2;
            padding: 20px;
            margin-left: 100px;
            /* background-color: #fff; */
            /* border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
        }

        .details-section {
            margin-bottom: 20px;
        }

        .details-section h2 {
            font-size: 30px;
            margin-bottom: 10px;
        }
        
        span {
            font-size: 20px;
            font-weight: bold;
        }
        
        .details-section p {
            margin: 0;
        }
        
        .price h3 {
            font-size: 25px;
            margin-bottom: 10px;
        }
        
        .delivery-section {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .delivery-section .a {
            display: flex;
            align-items: center;
        }
        
        .delivery-section .a .a-1 {
           color: #A9A9A9;
        }
        
        .delivery-section .a .a-2 {
           font-weight: bold;
        }
        
          .delivery-section .b {
           font-size: 15px;
        }

        .buy-section {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            gap: 20px;
        }
        
        .quantity-section {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px 20px;
            width: 400px;
            gap:20px;
          /*   margin: 0 auto; */
        }
        .control-section {
           display: flex;
           justify-content: space-between;
        }

        .item-info {
            font-size: 14px;
            color: #333;
        }

        #price {
            font-weight: bold;
            color: #000;
            font-size: 16px;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            overflow: hidden;
        }

        .quantity-control button {
            background-color: #fff;
            border: none;
            width: 30px;
            height: 30px;
            font-size: 16px;
            cursor: pointer;
        }

        .quantity-control button:hover {
            background-color: #f0f0f0;
        }

        .quantity-control input {
            width: 40px;
            height: 30px;
            border: none;
            text-align: center;
            font-size: 14px;
            color: #333;
        }

        .quantity-control input:focus {
            outline: none;
        }

        .buy-buttons {
            display: flex;
            justify-content: space-between;
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
        
  /* --------------------------추천 상품 이미지--------------------------------------- */
  
     .product-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr); 
        gap: 20px; 
      }
   
       .product-card {
         border: none;
         border-radius: 8px;
          overflow: hidden;
           background-color: none;
         transition: transform 0.2s, box-shadow 0.2s;
       }
   
      .product-card:hover .product-image {
          border-color: #f56a00; 
      }
   
       .product-image {
        width: 100%;
        height: 100%px;
        object-fit: cover; /* 이미지를 잘라내면서 컨테이너에 꽉 차게 */
        border: 3px solid transparent; 
        box-sizing: border-box;
        background-color: #f9f9f9; 
        transition: border 0.1s ease-in-out;
       }
   
       .product-info {
         padding: 8px;
         text-align: center;
         display: flex;
        justify-content: space-between;
       }
   
       .product-name {
         font-size: 16px;
         font-weight: bold;
         margin-bottom: 5px;
       }
       
         .product-name  a{
         text-decoration: none;
       }
   
       .product-price {
         font-size: 18px;
         color: #f56a00;
         font-weight: bold;
         margin-bottom: 5px;
       }
   
/* -------------------------------하단 메뉴------------------------------------------ */
        .product_menu {
            border-top: 1px solid black;  /* 상단 테두리 - 검은색 */
            border-bottom: 1px solid #E0E0E0; /* 하단 테두리 - 연한 회색 */
            border-left: none; /* 좌측 테두리 제거 */
            border-right: none; /* 우측 테두리 제거 */
            padding: 10px 0; /* 상하 여백 조정 */
            text-align: center; /* 내부 요소 가운데 정렬 */
            margin-top: 20px; /* 메뉴와 첫 번째 섹션 간 간격 추가 */
        }

        .product_menu ul {
            list-style: none; /* 기본 리스트 스타일 제거 */
            padding: 0;
            margin: 0;
            display: flex; /* 가로 정렬 */
            gap: 15px; /* 메뉴 간격 조정 */
            justify-content: center; /* 메뉴 항목 가운데 정렬 */
        }

        .product_menu li {
            display: inline-block;
        }

        .product_menu a {
             text-decoration: none; /* 밑줄 제거 */
           color: black; /* 기본 텍스트 색 */
           font-weight: bold;
           padding-bottom: 5px; /* 하단 테두리 공간 확보 */
           display: inline-block; /* 테두리 적용을 위해 inline-block 설정 */
           border-bottom: 2px solid transparent; /* 기본 상태에서 하단 테두리 없음 */
           transition: border-color 0.3s ease-in-out; /* 애니메이션 효과 */
        }    
        
        .product_menu a.active {
           border-bottom: 2px solid orange; /* 클릭한 요소의 하단 테두리 주황색 */
      }
        
        .product_menu span {
          font-size: 18px; /* 폰트 크기 줄임 */
          margin: 0 20px; /* 좌우 간격 추가 */
      }
      
      #product-detail1 {
          margin-top: 20px; /* 메뉴와 첫 번째 섹션 간 간격 추가 */
      }
      /* ------------------------------------------------------ */
      .product-detail-wrap {
         display: flex;
            flex-direction: column;
            justify-content: center;
      }
      
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
/* --------------------리뷰------------------------------------- */
      #product-detail4 {
          width: 100%;
          margin: 0 auto;
          font-family: Arial, sans-serif;
          color: #333;
          margin-top:5px;
      }
      
      .review-header {
          display: flex;
          justify-content: space-between;
          align-items: center;
          padding: 10px 0;
      }
      
      .write-review-button {
          padding: 5px 10px;
          border: 1px solid #ccc;
          border-radius: 20px;
          background-color: white;
          cursor: pointer;
          font-size: 14px;
      }
      
      .review-header h3 {
          font-size: 18px;
          font-weight: bold;
          margin: 0;
          color: #333;
      }
      
      .review-header .review-count {
          color: orange;
          font-size: 16px;
      }
      
      .write-review-link {
          padding: 5px 10px;
          border: 1px solid #ccc;
          border-radius: 20px;
          background-color: white;
          color: #333;
          text-decoration: none;
          font-size: 14px;
          display: inline-block;
          cursor: pointer;
      }

      .write-review-link:hover {
          background-color: #f0f0f0;
      }
      
      .divider {
          border: none;
          border-bottom: 1px solid #ccc;
          margin: 10px 0;
      }
      
      .review-content {
          text-align: center;
          padding: 20px 0;
          color: #888;
      }
      
      .review-content .no-review {
          display: flex;
          flex-direction: column;
          align-items: center;
          gap: 10px;
      }
      
      .review-content .no-review-icon {
          font-size: 50px;
          color: #ccc;
      }
        
    </style>
<script type="text/javascript">
function add_cart(product_id) {
    $.ajax({
        type: "post",
        url: "${contextPath}/cart/addProductInCart.do",
        data: { product_id: product_id },
        success: function(data, textStatus) {
            if (data.trim() === "add_success") {
                imagePopup('open', '.layer01');   
                alert("장바구니에 담겻습니다.");   
            } else if (data.trim() === "already_existed") {
                alert("이미 장바구니에 등록된 상품입니다.");   
            } else if (data.trim() === "not_logged_in") {
                alert("로그인이 필요합니다.");   
            }
        },
        error: function(xhr, textStatus, errorThrown) {
            alert("에러가 발생했습니다. " + xhr.responseText);
        }
    });
}
function imagePopup(type) {
   if (type == 'open') {
      // 팝업창을 연다.
      jQuery('#layer').attr('style', 'visibility:visible');

      // 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
      jQuery('#layer').height(jQuery(document).height());
   }

   else if (type == 'close') {

      // 팝업창을 닫는다.
      jQuery('#layer').attr('style', 'visibility:hidden');
   }
}

function fn_order_each_product(product_id,product_name,product_price,product_image){
var _isLogOn=document.getElementById("isLogOn");
var isLogOn=_isLogOn.value;

 if(isLogOn=="false" || isLogOn=='' ){
   alert("로그인 후 주문이 가능합니다!!!");
} 


   var total_price,final_total_price;
   var order_product_qty=document.getElementById("order_product_qty");
   
   var formObj=document.createElement("form");
   var i_product_id = document.createElement("input"); 
var i_product_name = document.createElement("input");
var i_product_price=document.createElement("input");
var i_product_image=document.createElement("input");
var i_order_product_qty=document.createElement("input");

i_product_id.name="product_id";
i_product_name.name="product_name";
i_product_price.name="product_price";
i_product_image.name="product_image";
i_order_product_qty.name="order_product_qty";

i_product_id.value=product_id;
i_order_product_qty.value=order_product_qty.value;
i_product_name.value=product_name;
i_product_price.value=product_price;
i_product_image.value=product_image;

formObj.appendChild(i_product_id);
formObj.appendChild(i_product_name);
formObj.appendChild(i_product_price);
formObj.appendChild(i_product_image);
formObj.appendChild(i_order_product_qty);

document.body.appendChild(formObj); 
formObj.method="post";
formObj.action="${contextPath}/order/orderEachProduct.do";
formObj.submit();
}   
</script>
</head>
<body>
    <div class="container">
        <div class="product">
            <div class="product-image">
               <img alt="HTML5 &amp; CSS3"
            src="${contextPath}/download.do?product_id=${product.product_id}&imageName=${product.product_image}">
            </div>
            <div class="product-details">
                <div class="details-section">
                    <h2>${product.product_name }</h2>
                </div>
                <div class="product-rating"><span style="margin-left:auto;">★ 4.8</span></div>
                <div class="price">
                   <h3><fmt:formatNumber value="${product.price}" pattern="#,###" />원</h3>
                </div>
                <div class="delivery-section">
                   <div class="a">
                      <div class="a-1">배송비</div>&nbsp&nbsp&nbsp&nbsp
                       <div class="a-2">3,000원</div>
                   </div>
                    <div class="b"><p>40,000원 이상 구매 시 무료배송</p></div>
                </div>
   <div class="buy-section">
                    <div class="quantity-section">
                        <div class="product_name">${product.product_name}</div>
                        <div class="control-section">
                            <div 
                            class="quantity-control">
                                <button onclick="updateQuantity(-1)">-</button>
                                <input type="text" id="quantity" value="1" readonly>
                                <button onclick="updateQuantity(1)">+</button>
                            </div>
                            <div id="currentPrice"><fmt:formatNumber value="${product.price}" pattern="#,###" />원</div>
                        </div>
                    </div>
                    <div class="product-price">
                        <label for="price">구매예정 금액</label>
                        <span id="finalPrice"><fmt:formatNumber value="${product.price}" pattern="#,###" />원</span>
                    </div>
                    <div class="buy-buttons">
                        <a class="add-cart" href="javascript:add_cart('${product.product_id }')">장바구니</a>
                        <button class="buy-now">바로구매</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // JSP에서 서버로부터 받은 product 가격을 JavaScript 변수에 저장
        const productPrice = ${product.price}; // 기본 가격 (서버에서 전달)
        const quantityInput = document.getElementById('quantity'); // 수량 입력 필드
        const currentPriceElement = document.getElementById('currentPrice'); // 실시간 가격
        const finalPriceElement = document.getElementById('finalPrice'); // 구매예정 금액

        // 수량 변경 시 호출되는 함수
        function updateQuantity(change) {
            let quantity = parseInt(quantityInput.value) + change;
            if (quantity < 1) quantity = 1; // 최소 수량은 1로 제한
            quantityInput.value = quantity;

            // 총 가격 계산
            const totalPrice = productPrice * quantity;

            // 실시간 가격 및 구매예정 금액 업데이트
            currentPriceElement.textContent = totalPrice.toLocaleString('ko-KR') + '원';
            if(totalPrice >= 40000){
               finalPriceElement.textContent = (totalPrice).toLocaleString('ko-KR') + '원';   
            }
            else {
               finalPriceElement.textContent = (totalPrice + 3000).toLocaleString('ko-KR') + '원';   
            }
        }
    </script>
    <div style="border-bottom: 1px solid #E0E0E0; width: 100%; padding-bottom: 5px;">
    <h2>고객님을 위한 추천상품</h2>
   </div>
       <div class="product-grid">
      <c:forEach var="item" items="${relationProduct}">
         <div class="product-card">
            <a href="${contextPath}/product/detailProduct.do?product_id=${item.product_id }">
               <img class="product-image" width="75" alt=""
               src="${contextPath}/thumbnails.do?product_id=${item.product_id}
               &imageName=${item.product_image}">
            </a>
            <div class="product-info">
               <div class="product-name">${item.product_name}</div>
               <div class="product-price"><fmt:formatNumber value="${item.price}" pattern="#,###" />원</div>
            </div>
         </div>
      </c:forEach>
   </div>
   <div class="product-detail-wrap">
      <div class="product_menu">
         <ul>
            <li class="menu1"><a href="#product-detail1"><span>상세정보</span></a></li>
            <li class="menu2"><a href="#product-detail2"><span>기본정보</span></a></li>
            <li class="menu3"><a href="#product-detail3"><span>배송/교환반품 안내</span></a></li>
            <li class="menu4"><a href="#product-detail4"><span>상품리뷰</span></a></li>
         </ul>
      </div>
      <div id="product-detail1">
               <img alt="HTML5 &amp; CSS3"
            src="${contextPath}/download.do?product_id=${product.product_id}&imageName=${product.product_inf_image}">
          </div>
          <div id="product-detail2">
             <table>
             <tr>
                  <th>식품 이름</th>
                  <td>${productInform.product_name}</td>
                  <th>중량</th>
                  <td>상세페이지 참고</td>
              </tr>
              <tr>
                  <th>소비기한</th>
                  <td>${productInform.product_ex_date}</td>
                  <th>배송 가능 지역</th>
                  <td>${productInform.delivery_area}</td>
              </tr>
              <tr>
                  <th>원재료명 및 함량</th>
                  <td>${productInform.ingredient_info}</td>
                  <th>배송 방법</th>
                  <td>${productInform.delivery_method}</td>
              </tr>
              <tr>
                  <th>유전자재조합식품 여부</th>
                  <td>${productInform.GMO_status}</td>
                  <th>수입식품 문구</th>
                  <td>${productInform.import_notice}</td>
              </tr>
              <tr>
                  <th>영양성분</th>
                  <td>${productInform.nutrition_facts}</td>
                  <th>영유아식 또는 체중조절식품 등에 해당 여부</th>
                  <td>${productInform.special_category}</td>
              </tr>
              <tr>
                  <th>제조사</th>
                  <td>${productInform.producer}</td>
                  <th>소비자 상담 번호</th>
                  <td>${productInform.customer_service}</td>
              </tr>
              <tr>
                  <th>생산자 소재지</th>
                  <td>${productInform.product_addr}</td>
                  <th>주의사항</th>
                  <td>${productInform.warnings}</td>
              </tr>
             </table>
          </div>
          <div id="product-detail3">
              <img alt="cookit" src="${contextPath}/resources/image/delivery_inform_수정.jpg">
          </div>
          <div id="product-detail4">
          <div class="review-header">
              <h3>상품리뷰 <span class="review-count">${reviews }건</span></h3>
              <a href="/write-review" class="write-review-link">상품리뷰 쓰기</a>
       </div>
       <hr class="divider" />
          <div class="review-content">
                <div class="no-review">
               <div class="no-review-icon">❌</div>
               <p>등록된 리뷰가 없습니다.</p>
              </div>
             </div>
      </div>
   </div>
<script>
   document.addEventListener("DOMContentLoaded", function () {
       const menuLinks = document.querySelectorAll(".product_menu a");
   
       menuLinks.forEach(link => {
           link.addEventListener("click", function (event) {
               event.preventDefault(); // 기본 동작 방지
   
               // 모든 링크의 'active' 클래스 제거
               menuLinks.forEach(item => item.classList.remove("active"));
   
               // 현재 클릭한 요소에 'active' 클래스 추가
               this.classList.add("active");
               
               // 클릭한 요소의 href 속성을 가져와 해당 ID로 스크롤 이동
               const targetId = this.getAttribute("href");
               const targetElement = document.querySelector(targetId);

               if (targetElement) {
                   window.scrollTo({
                       top: targetElement.offsetTop - 20, // 상단에서 20px 여백을 둠
                       behavior: "smooth" // 부드러운 스크롤 이동
           });
       });
   });
       
       document.addEventListener("DOMContentLoaded", function () {
           // 예제: 서버에서 받아온 리뷰 데이터 (API로부터 받아야 함)
           const reviews = [
               // 리뷰가 없으면 빈 배열로 설정
               // { id: 1, title: "좋아요!", description: "배송이 빠르고 품질이 좋습니다.", image: "path/to/image.jpg" },
           ];

           // 리뷰 건수 표시
           const reviewCount = document.getElementById("review-count");
           reviewCount.textContent = `${reviews.length}건`;

           const reviewContent = document.getElementById("review-content");

           if (reviews.length === 0) {
               // 리뷰가 없을 때 표시할 내용
               reviewContent.innerHTML = `
                   <div class="no-review">
                       <div class="no-review-icon">❌</div>
                       <p>등록된 리뷰가 없습니다.</p>
                   </div>
               `;
           } else {
               // 리뷰가 있을 때 카드 렌더링
               reviewContent.innerHTML = reviews
                   .map(
                       (review) => `
                       <div class="review-card">
                           <img src="${review.image}" alt="Review Image" />
                           <div class="review-details">
                               <p class="review-title">${review.title}</p>
                               <p class="review-description">${review.description}</p>
                           </div>
                       </div>
                   `
                   )
                   .join("");
           }
       });

</script>
</body>
</body>
</html>