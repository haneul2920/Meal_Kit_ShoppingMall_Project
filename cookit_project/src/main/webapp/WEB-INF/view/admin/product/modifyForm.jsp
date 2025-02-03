<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<meta charset="utf-8">
<head>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet"
	type="text/css" media="screen">
<script type="text/javascript">
	function updateProduct(obj) {
		// 폼 제출
		obj.submit();
	}
</script>
</head>

<BODY>
	<form id="modifyForm" action="${contextPath}/admin/modifyProduct.do" method="post"
		enctype="multipart/form-data">
		<h1>상품 수정창</h1>
		<div class="tab_container">
			<!-- 내용 들어 가는 곳 -->
			<div class="tab_container" id="container">
				<ul class="tabs">
					<li><a href="#tab1">상품정보</a></li>
					<li><a href="#tab2">상품상세 정보</a></li>
					<li><a href="#tab3">상품상세 이미지</a></li>
				</ul>
				<div class="tab_container">
					<div class="tab_content" id="tab1">
						<table>
							<tr>
								<td width=200>상품 카테고리</td>
								<td width=500><select name="product_category">
										<option value="한식" ${product.category_id eq '1' ? 'selected' : ''}>한식
										<option value="중식" ${product.category_id eq '2' ? 'selected' : ''}>중식
										<option value="일식" ${product.category_id eq '3' ? 'selected' : ''}>일식
										<option value="양식" ${product.category_id eq '4' ? 'selected' : ''}>양식
										<option value="분식" ${product.category_id eq '5' ? 'selected' : ''}>분식
										<option value="동남아식" ${product.category_id eq '6' ? 'selected' : ''}>동남아식
								</select></td>
							</tr>
							<tr>
								<td>상품가격</td>
								<td><input name="price" value="${product.price}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>상품이름</td>
								<td><input name="product_name" value="${product.product_name}" type="text" size="40" readonly /></td>
							</tr>

							<tr>
								<td>상품 재고</td>
								<td><input name="product_amount" value="${product.product_amount}" type="text" size="40" /></td>
							</tr>
						</table>
					</div>
					<div class="tab_content" id="tab2">
						<H4>상품 상세 정보</H4>
						<table>
							<tr>
								<td>소비기한</td>
								<td><input name="product_ex_date" value="${productInform.product_ex_date}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>원재료명 및 함량</td>
								<td><input name="ingredient_info" value="${productInform.ingredient_info}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>유전자재조합식품 여부</td>
								<td><input name="GMO_status" value="${productInform.GMO_status}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>영양성분</td>
								<td><input name="nutrition_facts" value="${productInform.nutrition_facts}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>생산자</td>
								<td><input name="producer" value="${productInform.producer}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>생산자 소재지</td>
								<td><input name="product_addr" value="${productInform.product_addr}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>중량</td>
								<td><input name="product_weight" value="${productInform.product_weight}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>배송가능지역</td>
								<td><input name="delivery_area" value="${productInform.delivery_area}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>배송방법</td>
								<td><input name="delivery_method" value="${productInform.delivery_method}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>수입식품 문구</td>
								<td><input name="import_notice" value="${productInform.import_notice}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>영유아식 또는 체중조절식품 등에 해당 여부</td>
								<td><input name="special_category" value="${productInform.special_category}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>소비자 상담번호</td>
								<td><input name="customer_service" value="${productInform.customer_service}" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>주의사항</td>
								<td><input name="warnings" value="${productInform.warnings}" type="text" size="40" /></td>
							</tr>
						</table>
					</div>
					<div class="tab_content" id="tab3">
						<h4>상품이미지
						</h4>
						<table>
							<tr>
								<td align="right">상품 이미지 첨부</td>
								<td align="left"><input type="file" name="product_image_"  /></td>
								<td align="right">상품 세부정보 이미지 첨부</td>
								<td align="left"><input type="file" name="product_inform_"  /></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<center>
				<table>
					<tr>
						<td align=center>
						<input type="button" value="상품 수정하기" onClick="updateProduct(this.form)" />
						</td>
					</tr>
				</table>
			</center>
		</div>
	</form>