<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<title>회원 가입 창</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


function execDaumPostcode() {
	  // Daum 주소 검색 API 객체 생성
	  var postcode = new daum.Postcode({
	    oncomplete: function(data) {
	      // 주소 선택 후 실행될 로직
	      
	      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	      // 법정동명이 있을 경우 추가
	      if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
	        extraRoadAddr += data.bname;
	      }
	      // 건물명이 있고, 공동주택일 경우 추가
	      if (data.buildingName !== '' && data.apartment === 'Y') {
	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	      }
	      // 도로명, 지번 조합형 주소가 있을 경우 괄호 추가
	      if (extraRoadAddr !== '') {
	        extraRoadAddr = ' (' + extraRoadAddr + ')';
	      }
	      // 도로명 주소와 추가 주소 조합
	      if (fullRoadAddr !== '') {
	        fullRoadAddr += extraRoadAddr;
	      }

	      // 우편번호와 주소 정보를 입력 필드에 삽입
	      document.getElementById('zipcode').value = data.zonecode; // 5자리 새 우편번호
	      document.getElementById('roadAddress').value = fullRoadAddr;
	      document.getElementById('jibunAddress').value = data.jibunAddress;

	      // 예상 주소 안내 표시
	      if (data.autoRoadAddress) {
	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	      } else if (data.autoJibunAddress) {
	        var expJibunAddr = data.autoJibunAddress;
	        document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	      } else {
	        document.getElementById('guide').innerHTML = '';
	      }

	      // 팝업 닫기 (확실히 팝업을 닫기 위한 명시적 호출)
	      postcode.close();
	    }
	  });

	  // 팝업 열기
	  postcode.open();
	};



function fn_overlapped(){
    var _id=$("#_user_id").val();
    if(_id==''){
   	 alert("ID를 입력하세요");
   	 return;
    }
    $.ajax({
       type:"post",
       async:false,  
       url:"${contextPath}/user/overlapped.do",
       dataType:"text",
       data: {id:_id},
       success:function (data,textStatus){
          if(data=='false'){
       	    alert("사용할 수 있는 ID입니다.");
/*        	    $('#btnOverlapped').prop("disabled", true);
       	    $('#_user_id').prop("disabled", true); */
       	    $('#user_id').val(_id);
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
          alert("에러가 발생했습니다.");ㅣ
       },
       complete:function(data,textStatus){
          //alert("작업을완료 했습니다");
       }
    });  //end ajax	 
 }	
</script>
</head>
<body>
<h3>필수입력사항</h3>
	<form action="${contextPath}/user/addUser.do" method="post">	
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">아이디</td>
					<td>
					  <input type="text" name="user_id"  id="_user_id"  size="20" />

					  
					  <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped()" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td><input name="user_pwd" type="password" size="20" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td><input name="username" type="text" size="20" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">성별</td>
					<td><input type="radio" name="gender" value="female" />
						여성<span style="padding-left:120px"></span>
						 <input type="radio" name="gender" value="male" checked />남성
					</td>
				</tr>			
				<tr class="dot_line">
					<td class="fixed_join">휴대폰번호</td>
					<td><select  name="phone_num">
							<option>없음</option>
							<option selected value="010">010</option>							
					</select> - <input size="10px"  type="text" name="phone_num"> - <input size="10px"  type="text"name="phone_num"><br> <br> 
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일<br>(e-mail)</td>
					<td><input size="10px"   type="text" name="email1" /> @ <input  size="10px"  type="text" name="email2" /> 
						  <select name="email2" onChange=""	title="직접입력">
									<option value="non">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="nate.com">nate.com</option>
									<option value="google.com">google.com</option>
									<option value="empal.com">empal.com</option>
									<option value="korea.com">korea.com</option>
									<option value="freechal.com">freechal.com</option>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" size="10" > <a href="javascript:execDaumPostcode()">우편번호검색</a>
					  <br>
					  <p> 
					  도로명 주소: <input type="text" id="roadAddress" name="roadAddress" size="50"><br><br>
					  지번 주소:<br><input type="text" id="jibunAddress"  name="jibunAddress" size="50"><br><br>
					  나머지 주소: <input type="text"  name="namujiAddress" size="50" />
					 <!--   <span id="guide" style="color:#999"></span> -->
					   </p>
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="clear">
		<br><br>
		<table align=center>
		<tr >
			<td >
				<input type="submit"  value="회원 가입">
				<input  type="reset"  value="다시입력">
			</td>
		</tr>
	</table>
	</div>
</form>	
</body>
</html>