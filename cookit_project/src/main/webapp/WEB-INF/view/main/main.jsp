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
                            <a href="#main-event" class="btn-slide-all ui-open-pop"><span class="blind">이벤트 전체보기</span></a>
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
		<c:forEach var="item" items="${productList}">
			<div class="product_card">
				<div class="product_info">
					<img class="product_image" width="75" alt="" 
					     src="${contextPath}/thumbnails.do?product_id=${item.product_id}&imageName=${item.product_image}">
					<div class="product_details">
						<h2 class="product_name">
							<a href="${contextPath}/main/main.do">${item.product_name}</a>
						</h2>
						<span class="product_price">${item.price}원</span>
					</div>
				</div>
	<!-- 			<div class="product_actions">
					<input type="checkbox" class="product_checkbox" value="">
					<div class="buy_buttons">
						<ul>
							<li><a href="#">장바구니</a></li>
							<li><a href="#">구매하기</a></li>
							<li><a href="#">비교하기</a></li>
						</ul>
					</div>
				</div> -->
			</div>
		</c:forEach>
	</div>
