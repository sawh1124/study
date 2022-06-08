<%@page import="egovframework.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

<!-- 4.팝업창구현  -->
<form method="post" name="wfr">
		<input type="hidden" name="id" value="${id}"> 
	</form>
<div id="text"></div>
<input type="button" value="아이디 사용하기" id="idcheck" onclick="result();">
<!-- 6. 선택된아이디는 중복확인창에서 회원가입 페이지로 정보전달  -->
 <script type="text/javascript">
 	$(function() {
		if(${result} == 0) {
			$("#text").text("사용가능한 아이디입니다.");
			$("#idcheck").show();
		}else if(${result} == 1){
			$("#text").text("중복된 아이디입니다.");
			$("#idcheck").hide();
		}else{
			$("#text").text("에러발생---(-1)");
		}
	});
    function result(){
    	//팝업창의 아이디정보를 회원가입창에 아이디정보로 전달
    	//팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
    	//alert("팝업창의 id값"+document.wfr.userid.value + ", 회원가입창의 id값 : " +opener.document.fr.id.value)
    	//6-1. 회원가입페이지의 id값에 아이디중복으로 선택된 id값을 대입.
    	opener.document.fr.id.value = document.wfr.id.value;
    	
    	//6-3. 회원가입창 제어
    	//readonly 속성제어(커멜표기가 아닐때는 제어가 안됨 신기하네 ㅋㅋㅋ)
    	opener.document.fr.id.readOnly=true;
    	
    	//6-2. 창닫기
    	window.close();
    }
 
 </script>



</body>
</html>