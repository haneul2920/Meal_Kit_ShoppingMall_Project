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
  });
</script>
<style>
body, html {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  overflow-x: hidden;
}
.swiper-container {
  width: 100vw;
  height: 450px;
  margin: 0 auto;
  padding: 0;
}

.swiper-wrapper {
  margin: 0;
  padding: 0;
  width: 100%;
}

.swiper-slide {
  margin: 0;
  padding: 0;
}

.inner-div-main-swiper img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

</style>
<html>
	<body>
		<div class="swiper-container">
		  <div class="swiper-wrapper">
		    <div class="swiper-slide">
		      <img src="${contextPath}/resources/image/banner_img1.jpg" alt="메인비쥬얼이미지" />
		    </div>
		    <div class="swiper-slide">
		      <img src="${contextPath}/resources/image/banner_img2.jpg" alt="메인비쥬얼이미지" />
		    </div>
		    <div class="swiper-slide">
		      <img src="${contextPath}/resources/image/banner_img3.jpg" alt="메인비쥬얼이미지" />
		    </div>
		  </div>
		</div>
	</body>
</html>



