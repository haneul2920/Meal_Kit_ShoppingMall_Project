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
		<td class="fixed">����</td>
		<td colspan=2 class="fixed">��ǰ��</td>
		<td>����</td>
		<td>�ǸŰ�</td>
		<td>����</td>
		<td>�հ�</td>
		<td>�ֹ�</td>
		</tr>
		
		<c:choose>
			<c:when test="${empty myCartList}">
				<tr>
					<td colspan=8 class="fixed">
						<strong>��ٱ��ϰ� ����ֽ��ϴ�.</strong>
					</td>
				</tr>
			</c:when>
		</c:choose>
		
	</table>
	
		<table  width=80%   class="list_view" style="background:#cacaff">
	<tbody>
	     <tr  align=center  class="fixed" >
	       <td class="fixed">�� ��ǰ�� </td>
	       <td>�� ��ǰ�ݾ�</td>
	       <td>  </td>
	       <td>�� ��ۺ�</td>
	       <td>  </td>
	       <td>�� ���� �ݾ� </td>
	       <td>  </td>
	       <td>���� �����ݾ�</td>
	     </tr>
	</tbody>
	     </table>
</body>
</html>