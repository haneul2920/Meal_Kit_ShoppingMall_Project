<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="list view">
		<tr style="background: #33ff00">
		<td class="fixed">구분</td>
		<td colspan=2 class="fixed">상품명</td>
		<td>정가</td>
		<td>판매가</td>
		<td>수량</td>
		<td>합계</td>
		<td>주문</td>
		</tr>
		
		<c:choose>
			<c:when test="${empty myCartList}">
				<tr>
					<td colspan=8 class="fixed">
						<strong>장바구니가 비어있습니다.</strong>
					</td>
				</tr>
			</c:when>
		</c:choose>
		
	</table>
	
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
	</tbody>
	     </table>
</body>
</html>