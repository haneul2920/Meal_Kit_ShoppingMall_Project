<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="myCartList"  value="${cartMap.myCartList}"  />
<c:set var="myProductList"  value="${cartMap.myProductList}"  />

<c:set  var="totalProductNum" value="0" />  <!--주문 개수 -->
<c:set  var="totalDeliveryPrice" value="0" /> <!-- 총 배송비 --> 
<c:set  var="totalDiscountedPrice" value="0" /> <!-- 총 할인금액 -->
<head>
<script type="text/javascript">
function calcProductPrice(productPrice,obj){
	var totalPrice,final_total_price,totalNum;
	var prodyct_qty=document.getElementById("select_product_qty");
	//alert("총 상품금액"+goods_qty.value);
	var p_totalNum=document.getElementById("p_totalNum");
	var p_totalPrice=document.getElementById("p_totalPrice");
	var p_final_totalPrice=document.getElementById("p_final_totalPrice");
	var h_totalNum=document.getElementById("h_totalNum");
	var h_totalPrice=document.getElementById("h_totalPrice");
	var h_totalDelivery=document.getElementById("h_totalDelivery");
	var h_final_total_price=document.getElementById("h_final_totalPrice");
	if(obj.checked==true){
	//	alert("체크 했음")
		
		totalNum=Number(h_totalNum.value)+Number(product_qty.value);
		//alert("totalNum:"+totalNum);
		totalPrice=Number(h_totalPrice.value)+Number(product_qty.value*productPrice);
		//alert("totalPrice:"+totalPrice);
		final_total_price=totalPrice+Number(h_totalDelivery.value);
		//alert("final_total_price:"+final_total_price);

	}else{
	//	alert("h_totalNum.value:"+h_totalNum.value);
		totalNum=Number(h_totalNum.value)-Number(product_qty.value);
	//	alert("totalNum:"+ totalNum);
		totalPrice=Number(h_totalPrice.value)-Number(product_qty.value)*productPrice;
	//	alert("totalPrice="+totalPrice);
		final_total_price=totalPrice-Number(h_totalDelivery.value);
	//	alert("final_total_price:"+final_total_price);
	}
	
	h_totalNum.value=totalNum;
	
	h_totalPrice.value=totalPrice;
	h_final_total_price.value=final_total_price;
	
	p_totalNum.innerHTML=totalNum;
	p_totalPrice.innerHTML=totalPrice;
	p_final_totalPrice.innerHTML=final_total_price;
}

function modify_cart_qty(product_id,productPrice,index){
	//alert(index);
   var length=document.frm_order_all_cart.amount.length;
   var _amount=0;
	if(length>1){ //카트에 제품이 한개인 경우와 여러개인 경우 나누어서 처리한다.
		_amount=document.frm_order_all_cart.amount[index].value;		
	}else{
		_amount=document.frm_order_all_cart.amount.value;
	}
		
	var amount=Number(_amount);
	//alert("cart_goods_qty:"+cart_goods_qty);
	//console.log(cart_goods_qty);
	$.ajax({
		type : "post",
		async : false, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/cart/modifyCartQty.do",
		data : {
			product_id:product_id,
			amount:amount
		},
		
		success : function(data, textStatus) {
			//alert(data);
			if(data.trim()=='modify_success'){
				alert("수량을 변경했습니다!!");	
			}else{
				alert("다시 시도해 주세요!!");	
			}
			
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
}

function delete_cart_product(cart_id){
	var cart_id=Number(cart_id);
	var formObj=document.createElement("form");
	var i_cart = document.createElement("input");
	i_cart.name="cart_id";
	i_cart.value=cart_id;
	
	formObj.appendChild(i_cart);
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/cart/removeCartProduct.do";
    formObj.submit();
}

function fn_order_each_product(product_id,product_name,price,product_image){
	var total_price,final_total_price,_product_qty;
	var amount=document.getElementById("amount");
	
	_order_product_qty=amount.value; //장바구니에 담긴 개수 만큼 주문한다.
	var formObj=document.createElement("form");
	var i_product_id = document.createElement("input"); 
    var i_product_name = document.createElement("input");
    var i_product_price=document.createElement("input");
    var i_product_image=document.createElement("input");
    var i_order_product_qty=document.createElement("input");
    
    i_product_id.name="product_id";
    i_product_name.name="product_name";
    i_product_price.name="price";
    i_product_image.name="product_image";
    i_order_product_qty.name="order_product_qty";
    
    i_product_id.value=product_id;
    i_order_product_qty.value=_order_product_qty;
    i_product_name.value=product_name;
    i_product_price.value=price;
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

function fn_order_all_cart_product(){
//	alert("모두 주문하기");
	var order_product_qty;
	var order_product_id;
	var objForm=document.frm_order_all_cart;
	var amount=objForm.amount;
	var h_order_each_product_qty=objForm.h_order_each_product_qty;
	var checked_product=objForm.checked_product;
	var length=checked_product.length;
	
	
	//alert(length);
	if(length>1){
		for(var i=0; i<length;i++){
			if(checked_product[i].checked==true){
				order_product_id=checked_product[i].value;
				order_product_qty=amount[i].value;
				amount[i].value="";
				amount[i].value=order_product_id+":"+order_product_qty;
				//alert(select_goods_qty[i].value);
				console.log(amount[i].value);
			}
		}	
	}else{
		order_product_id=checked_product.value;
		order_product_qty=amount.value;
		amount.value=order_product_id+":"+order_product_qty;
		//alert(select_goods_qty.value);
	}
		
 	objForm.method="post";
 	objForm.action="${contextPath}/order/orderAllCartProduct.do";
	objForm.submit();
}

</script>
</head>
<body>
	<table class="list_view">
		<tbody align=center >
			<tr style="background:#33ff00" >
				<td class="fixed" >구분</td>
				<td colspan=2 class="fixed">상품명</td>
				<td>정가</td>
				<td>판매가</td>
				<td>수량</td>
				<td>합계</td>
				<td>주문</td>
			</tr>
			
			 <c:choose>
				    <c:when test="${ empty myCartList }">
				    <tr>
				       <td colspan=8 class="fixed">
				         <strong>장바구니에 상품이 없습니다.</strong>
				       </td>
				     </tr>
				    </c:when>
			        <c:otherwise>
			 <tr>       
               <form name="frm_order_all_cart">
				      <c:forEach var="item" items="${myProductList }" varStatus="cnt">
				       <c:set var="amount" value="${myCartList[cnt.count-1].amount}" />
				       <c:set var="cart_id" value="${myCartList[cnt.count-1].cart_id}" />
					<td><input type="checkbox" name="checked_product"  checked  value="${item.product_id }"  onClick="calcProductPrice(${item.price },this)"></td>
					<td class="product_image">
					<a href="${contextPath}/product/productDetail.do?product_id=${item.product_id }">
						<img width="75" alt="" src="${contextPath}/thumbnails.do?product_id=${item.product_id}&imageName=${item.product_image}"  />
					</a>
					</td>
					<td>
						<h2>
							<a href="${contextPath}/product/productDetail.do?product_id=${item.product_id }">${item.product_name }</a>
						</h2>
					</td>
					<td class="price"><span>${item.price }원</span></td>
					<td>
					   <strong>
					      <fmt:formatNumber  value="${item.price*0.9}" type="number" var="discounted_price" />
				            ${discounted_price}원(10%할인)
				         </strong>
					</td>
					<td>
					   <input type="text" id="amount" name="amount" size=3 value="${amount}"><br>
						<a href="javascript:modify_cart_qty(${item.product_id },${item.price*0.9 },${cnt.count-1 });" >
						    <img width=25 alt=""  src="${contextPath}/resources/image/btn_modify_qty.jpg">
						</a>
					</td>
					<td>
					   <strong>
					    <fmt:formatNumber  value="${item.price*0.9*amount}" type="number" var="total_sales_price" />
				         ${price}원
					</strong> </td>
					<td>
					      <a href="javascript:fn_order_each_product('${item.product_id }','${item.product_name }','${item.price}','${item.product_image}');">
					       	<img width="75" alt=""  src="${contextPath}/resources/image/btn_order.jpg">
							</a><br>
					 	<a href="#"> 
					 	   <img width="75" alt=""
							src="${contextPath}/resources/image/btn_order_later.jpg">
						</a><br> 
						<a href="#"> 
						   <img width="75" alt=""
							src="${contextPath}/resources/image/btn_add_list.jpg">
						</A><br> 
						<a href="javascript:delete_cart_product('${cart_id}');"> 
						   <img width="75" alt=""
							   src="${contextPath}/resources/image/btn_delete.jpg">
					   </a>
					</td>
			</tr>
				<c:set  var="totalProductPrice" value="${totalProductPrice+item.price*0.9*amount }" />
				<c:set  var="totalProductNum" value="${totalPtoductNum+1 }" />
			   </c:forEach>
		    
		</tbody>
	</table>
     	
	<div class="clear"></div>
	 </c:otherwise>
	</c:choose> 
	<br>
	<br>
	
	<table  width=80%   class="list_view" style="background:#cacaff">
	<tbody>
	     <tr  align=center  class="fixed" >
	       <td class="fixed">총 상품수 </td>
	       <td>총 상품금액</td>
	       <td>  </td>
	       <td>총 배송비</td>
	       <td>  </td>
	       <td>총 할인 금액 </td>
	       <td>  </td>
	       <td>최종 결제금액</td>
	     </tr>
		<tr cellpadding=40  align=center >
			<td id="">
			  <p id="p_totalProductNum">${totalProductNum}개 </p>
			  <input id="h_totalProductNum"type="hidden" value="${totalProductNum}"  />
			</td>
	       <td>
	          <p id="p_totalProductPrice">
	          <fmt:formatNumber  value="${totalProductPrice}" type="number" var="total_product_price" />
				         ${total_product_price}원
	          </p>
	          <input id="h_totalProductPrice"type="hidden" value="${totalProductPrice}" />
	       </td>
	       <td> 
	          <img width="25" alt="" src="${contextPath}/resources/image/plus.jpg">  
	       </td>
	       <td>
	         <p id="p_totalDeliveryPrice">${totalDeliveryPrice }원  </p>
	         <input id="h_totalDeliveryPrice"type="hidden" value="${totalDeliveryPrice}" />
	       </td>
	       <td> 
	         <img width="25" alt="" src="${contextPath}/resources/image/minus.jpg"> 
	       </td>
	       <td>  
	         <p id="p_totalSalesPrice"> ${totalDiscountedPrice}원</p>
	         <input id="h_totalSalesPrice"type="hidden" value="${totalSalesPrice}" />
	       </td>
	       <td>  
	         <img width="25" alt="" src="${contextPath}/resources/image/equal.jpg">
	       </td>
	       <td>
	          <p id="p_final_totalPrice">
	          <fmt:formatNumber  value="${totalProductPrice+totalDeliveryPrice-totalDiscountedPrice}" type="number" var="total_price" />
	            ${total_price}원
	          </p>
	          <input id="h_final_totalPrice" type="hidden" value="${totalProductPrice+totalDeliveryPrice-totalDiscountedPrice}" />
	       </td>
		</tr>
		</tbody>
	</table>
	<center>
    <br><br>	
		 <a href="javascript:fn_order_all_cart_product()">
		 	<img width="75" alt="" src="${contextPath}/resources/image/btn_order_final.jpg">
		 </a>
		 <a href="#">
		 	<img width="75" alt="" src="${contextPath}/resources/image/btn_shoping_continue.jpg">
		 </a>
	<center>
</form>	
