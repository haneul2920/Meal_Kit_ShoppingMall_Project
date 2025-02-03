<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var swiper = new Swiper(".swiper-container", {
      slidesPerView: 1,
      spaceBetween: 0,
      loop: true,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      pagination: {
        el: ".swiper-pagination",
        type: "fraction",
      },
      autoplay: {
        delay: 3000,
        disableOnInteraction: false,
      },
    });

    // Play/Pause 버튼 동작
    document.querySelector(".swiper-button-play").addEventListener("click", function () {
      swiper.autoplay.start();
      this.style.display = "none";
      document.querySelector(".swiper-button-pause").style.display = "inline-block";
    });

    document.querySelector(".swiper-button-pause").addEventListener("click", function () {
      swiper.autoplay.stop();
      this.style.display = "none";
      document.querySelector(".swiper-button-play").style.display = "inline-block";
    });
  });
</script>
<style>
  .swiper-container {
    width: 100%;
    height: 500px;
  }

  .swiper-slide img {
    width: 100%;
    height: auto;
  }

  .swiper-button-next, .swiper-button-prev {
    color: #fff;
  }

  .swiper-pagination {
    color: #fff;
  }

  .swiper-button-play, .swiper-button-pause {
    position: absolute;
    bottom: 20px;
    right: 20px;
    background: rgba(0, 0, 0, 0.5);
    color: #fff;
    border: none;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
  }
  /* ---------------------상품------------------------- */
   .container1, .container2 {
   	margin-top: 100px;
    width: 80%;
    margin: 0 auto;
    text-align: center;
    }
      
  .container1 {
   margin-bottom: 100px;
   }
      
  .container1, .container2 .header {
   margin-top: 20px;
   font-size: 24px;
   font-weight: bold;
   color: #FF4500;
   }
      
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
   
   .container2 .product-card:hover .product-image {
   border-color: #f56a00; 
   }
   
   .product-image {
   width: 150px; /* 이미지 요소의 너비 */
   height: 150px; /* 이미지 요소의 높이 */
   object-fit: contain; /* 이미지를 잘라내면서 컨테이너에 꽉 차게 */
   border: 3px solid transparent; 
   box-sizing: border-box;
   background-color: #f9f9f9; 
   transition: border 0.1s ease-in-out;
   }
   
   .product-info {
    padding: 8px;
    text-align: center;
    }

   .product-name {
    font-size: 16px;
    font-weight: bold;
    color: black;
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
   
   .product-rating span {
  	font-size: 15px;
  	color: gray;
    }
   
   .container2 p {
   color: gray;
   }
</style>

<div class="swiper-container main-slide swiper-container-initialized swiper-container-horizontal">
                <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-5760px, 0px, 0px);"><div class="swiper-slide swiper-slide-duplicate" style="width: 1920px;" data-swiper-slide-index="2">
                            <div class="inner-div-main-swiper">
                                    <a href="javascript:;" onclick="#" class="btn-back">
                                        <img src="${contextPath}/resources/image/banner_img1.jpg" alt="메인비쥬얼이미지">
                                    </a>
                                </div>
                            </div>
                    <div class="swiper-slide" style="width: 1920px;" data-swiper-slide-index="0">
                            <div class="inner-div-main-swiper">
                                    <a href="javascript:;" onclick="#" class="btn-back">
                                        <img src="${contextPath}/resources/image/banner_img2.jpg" alt="메인비쥬얼이미지">
                                    </a>
                                </div>
                            </div>
                    <div class="swiper-slide swiper-slide-prev" style="width: 1920px;" data-swiper-slide-index="1">
                            <div class="inner-div-main-swiper">
                                    <a href="javascript:;" onclick="#" class="btn-back">
                                        <img src="${contextPath}/resources/image/banner_img3.jpg" alt="메인비쥬얼이미지">
                                    </a>
                                </div>
                            </div>
                   </div><!--// swiper-wrapper -->
                <div class="main-slide-bottom">
                    <div class="inner">
                        <div class="main-slide-btns">
                            <div class="swiper-pagination swiper-pagination-fraction"><span class="swiper-pagination-current">3</span>｜<span class="swiper-pagination-total">11</span></div>
                        </div><!--// main-slide-btns -->
                        <div class="main-slide-playctrl">
                            <button type="button" class="swiper-button-pause"><span class="blind">PLAY</span></button>
                            <button type="button" class="swiper-button-play" style="display: none;"><span class="blind">STOP</span></button>
                        </div>
                        <!--<button type="button" class="swiper-button-ctrl pause"></button>-->
                    </div>
                </div><!--// main-slide-bottom -->
            <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>       
			<div class="main_product">
			 	<div class="container1">
			    	<div class="header">고객님, 이 밀키트 어때요?</div>
			    	<div class="product-grid">
						<c:forEach var="item" items="${recommendProduct}">
							<div class="product-card">
								<a href="${contextPath}/product/detailProduct.do?product_id=${item.product_id }">
								<img class="product-image" width="75" alt=""
								src="${contextPath}/thumbnails.do?product_id=${item.product_id}
								&imageName=${item.product_image}">
								</a>
								<div class="product-info">
									<div class="product-name">${item.product_name}</div>
									<div class="product-price"><fmt:formatNumber value="${item.price}" pattern="#,###" />원</div>
									<div class="product-rating"><span style="margin-left:auto;">★ 4.8</span></div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="container2">
			    	<div class="header">이주의 신상 밀키트예요</div>
			    	 <p>주목 할 만한 신제품을 소개합니다.</p>
			    	<div class="product-grid">
						<c:forEach var="item" items="${newProduct}">
							<div class="product-card">
								<a href="${contextPath}/product/detailProduct.do?product_id=${item.product_id }">
								<img class="product-image" width="75" alt=""
								src="${contextPath}/thumbnails.do?product_id=${item.product_id}
								&imageName=${item.product_image}">
								</a>
								<div class="product-info">
									<div class="product-name">${item.product_name}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>	
				 	

