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
	//상품 등록 함수
	function fn_add_new_goods(obj) {
		var mainImageInput = document.querySelector("input[name='file1']"); // 첫 번째 파일 입력 필드
		if (!mainImageInput || !mainImageInput.value) {
			alert("메인 이미지는 반드시 첨부해야 합니다.");
			return;
		}

		// 폼 제출
		obj.submit();
	}
</script>
</head>

<BODY>
	<form action="${contextPath}/product/insertProduct.do" method="post"
		enctype="multipart/form-data">
		<h1>새상품 등록창</h1>
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
										<option value="한식" selected>한식
										<option value="중식">중식
										<option value="일식">일식
										<option value="양식">양식
										<option value="분식">한식
										<option value="동남아식">동남아식
								</select></td>
							</tr>
							<tr>
								<td>상품가격</td>
								<td><input name="pirce" type="text" size="40" /></td>
							</tr>

							<tr>
								<td>상품 재고</td>
								<td><input name="goods_amount" type="text" size="40" /></td>
							</tr>
						</table>
					</div>
					<div class="tab_content" id="tab2">
						<H4>상품 상세 정보</H4>
						<table>
							<tr>
								<td>작성자</td>
								<td><input name="user_id" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>소비기한</td>
								<td><input name="product_ex_date" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>원재료명 및 함량</td>
								<td><input name="ingredient_info" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>유전자재조합식품 여부</td>
								<td><input name="GMO_status" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>영양성분</td>
								<td><input name="nutrition_facts" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>생산자</td>
								<td><input name="producer" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>생산자 소재지</td>
								<td><input name="product_addr" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>중량</td>
								<td><input name="product_weight" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>배송가능지역</td>
								<td><input name="delivery_area" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>배송방법</td>
								<td><input name="delivery_method" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>수입식품 문구</td>
								<td><input name="import_notice" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>영유아식 또는 체중조절식품 등에 해당 여부</td>
								<td><input name="special_category" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>소비자 상담번호</td>
								<td><input name="cusomer_service" type="text" size="40" /></td>
							</tr>
							<tr>
								<td>주의사항</td>
								<td><input name="warnings" type="text" size="40" /></td>
							</tr>
						</table>
					</div>
					<div class="tab_content" id="tab3">
						<h4>상품이미지
						</h4>
						<table>
							<tr>
								<td align="right">상품 이미지 첨부</td>
								<td align="left"><input type="file" value="파일 추가"  name="product_image" onClick="fn_addFile()" /></td>
								<td align="right">상품 세부정보 이미지 첨부</td>
								<td align="left"><input type="file" value="파일 추가" name="product_inform" onClick="fn_addFile()" /></td>
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
						<input type="button" value="상품 등록하기" onClick="fn_add_new_goods(this.form)" />
						</td>
					</tr>
				</table>
			</center>
		</div>
	</form>