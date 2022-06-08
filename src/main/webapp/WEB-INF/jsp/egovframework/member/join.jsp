<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<%@include file="/inc/head.jsp"%>
<body>

	<!-- ===============================================-->
	<!--    Main Content-->
	<!-- ===============================================-->
	<main class="main" id="top">
		<%@include file="/inc/nav.jsp"%>

		<section
			class="py-11 bg-light-gradient border-bottom border-white border-5">
			<div class="bg-holder overlay overlay-light"
				style="background-image: url(../assets/img/gallery/header-bg.png); background-size: cover;">
			</div>
			<!--/.bg-holder-->

			<div class="container">
				<div class="row flex-center">
					<div class="col-12 mb-10">
						<div class="d-flex align-items-center flex-column">
							<h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold">JOIN</h1>
						</div>
					</div>
				</div>
			</div>
		</section>

		<style>
			.label-msg {
				color: red;
			}
		</style>

		<section class="bg-light-gradient border-bottom border-white border-5">
			<div class="container">
				<div class="col-12">
					<form action="/member/joinPro.do" method="post" id="join" name="fr"
						onsubmit="return check();">		
						<div class="row">
							<div class="col-12 form-group">
								<label for="name">이름</label> <input id="name"
									class="form-control" type="text" name="name">
							</div>
							<div class="col-12 form-group">
								<label for="nickname">닉네임</label> <input id="nickname"
									class="form-control" type="text" name="nickname">
							</div>
							<div class="col-12 form-group">
								<label for="id">아이디</label> <input id="id" class="form-control"
									type="text" name="id"> <input type="button" class="dup"
									value="중복확인" onclick="winopen()">
							</div>
							<div class="col-12 form-group">
								<label for="pass">비밀번호</label> <input id="pass"
									class="form-control" type="password" name="pass"
									placeholder="영문 숫자 기호 조합의 4자리 이상">
							</div>
							<div class="col-12 form-group">
								<label for="pass2">비밀번호 재확인</label> <input id="pass2"
									class="form-control" type="password" name="pass2" onkeyup="checkPass2()">
							</div>
							<div class="col-12 form-group">
								<label for="email">이메일</label> <input id ="email" type="email"
									class="form-control" name="email"
									placeholder="예시 : funweb@funweb.com (@포함기입)"><br>
							</div>
							<div class="col-12 form-group">
								<label for="birth">생년월일</label> <input id ="birth"type="text" class="form-control"
									name="birth" placeholder="예시 : 000000 (6자리)" maxlength="6"
									><br>
							</div>
							<div class="col-12 form-group">
								<label for="gender">성별</label> <select class="form-control" id="gender" name="gender">
									<option class="form-control" value="">선택</option>
									<option class="form-control" value="f">여자</option>
									<option class="form-control" value="m">남자</option>

								</select><br>
							</div>
						</div>


						<fieldset>
							<div class="col-12 form-group">
								<label for="userZipcode">주소</label>
								<!-- <input type="text" name="address"><br> -->
								<input type="text" class="form-control" id="userZipcode"
									placeholder="우편번호" readonly> <input type="button"
									class="form-control" onclick="execPostCode()" value="우편번호 찾기"><br>
							</div>
							<div class="col-12 form-group">
								<label for="userAddress">도로명주소(자동입력)</label> <input type="text"
									class="form-control" name="addr" id="userAddress"
									placeholder="우편번호찾기를 이용해주세요" readonly><br> <input
									type="hidden" class="form-control" 
									placeholder="지번주소">
							</div>
							<div class="col-12 form-group">
							<label for="userAddress">상세주소(직접입력)</label> 
								<input type="text"
									class="form-control" id="detail" name="detail"
									placeholder="상세주소"><br>
							</div>
							<div class="col-12 form-group">
								<span id="guide" class="form-control"
									style="color: #999; display: none"></span> <input type="hidden"
									class="form-control" id="sample4_extraAddress"
									placeholder="참고항목">
							</div>
							<div class="col-12 form-group">
								<label for="mobile">휴대폰번호</label> <input id="mobile" type="text" class="form-control"
									name="mobile" placeholder="예시 : 010-1234-5678" maxlength="13"><br>
							</div>
						</fieldset>



						<div class="col-12 text-center mt-5">
							<input class="btn btn-primary col-5" type="submit" value="회원가입">
							<input class="btn btn-primary col-5" type="reset" value="초기화">
						</div>
					</form>

				</div>
			</div>
			

		</section>

		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

		<!-- 유효성체크 : 데이터 빈공백체크(id와 성별) -->
		<script type="text/javascript">
		
			function isId(asValue) {
			var regExp = /^[a-z]+[a-z0-9]{4,12}$/g;
				return regExp.test(asValue);
			}
		
			function isPassword(asValue) {
				var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{4,16}$/;

				return regExp.test(asValue); 
			}
			function isEmail(asValue) {
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

				return regExp.test(asValue);
			}
			function isPhoneNumber(asValue) {
				var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

				return regExp.test(asValue);
			}
			function isBirth(asValue) {
				var regExp = /^[0-9]{1,6}$/
				return regExp.test(asValue);
			}
			
			function writeMsg(name, input, msg) {
				$(".label-msg").remove();
				var text = $("label[for='"+name+"']").text();
				$("label[for='"+name+"']").after("<span class='label-msg'> * "+text+"은(는) "+msg+" 입니다.</span");
				input.focus();
			}
			
		 	function checkPass2() {
		 		var pass = $("#pass");
		 		var pass2 = $("#pass2");
		 		if(pass.val() != pass2.val()){
					writeMsg('pass2', pass2, '비밀번호와 불일치');
				} else {
					$(".label-msg").remove();
				}
		 	}
					
			function check(){ 
				// 이름 유효성 검사 
				var name = $("#name");
				if(name.val() == ""){
					writeMsg('name', name, '필수 값');
					return false;
				}
				
				var nickname = $("#nickname");
				if(nickname.val() == ""){
					writeMsg('nickname', nickname, '필수 값');
					return false;
				}
				
				var id = $("#id");
				if(id.val() == ""){
					writeMsg('id', id, '필수 값');
					return false;
				} else if(!isId(id.val())) {
					writeMsg('id', id, '영문 대소문자와 숫자 4~12글자');
					return false;
				}
				
				var pass = $("#pass");
				if(pass.val() == ""){
					writeMsg('pass', pass, '필수 값');
					return false;
				} else if(!isPassword(pass.val())) {
					writeMsg('pass', pass, '영문+숫자 특수문자 조합의 4 ~ 16글자');
					return false;
				}
				
				var pass2 = $("#pass2");
				if(pass.val() != pass2.val()){
					writeMsg('pass2', pass2, '비밀번호와 불일치');
					return false;
				}
				
				var email = $("#email");
				if(email.val() == ""){
					writeMsg('email', email, '필수 값');
					return false;
				} else if (!isEmail(email.val())) {
					writeMsg('email', email, '적합하지 않는 이메일 형식');
					return false;
				}
				var birth = $("#birth");
				if(birth.val() == ""){
					writeMsg('birth', birth, '필수 값');
					return false;
				} else if (!isBirth(birth.val())){
					writeMsg('birth', birth, '적합하지 않은 생년월일 형식');
					return false;
				}
				var gender = $("#gender");
				if(gender.val() == ""){
					writeMsg('gender', gender, '필수 값');
					return false;
				}
				var userZipcode = $("#userZipcode");
				if(userZipcode.val() == ""){
					writeMsg('userZipcode', userZipcode, '필수 값');
					return false;
				}
				var mobile = $("#mobile");
				if(mobile.val() == ""){
					writeMsg('mobile', mobile, '필수 값');
					return false;
				} else if (!isPhoneNumber(mobile.val())){
					writeMsg('mobile', mobile, '적합하지 않은 휴대폰번호 형식');
					return false;
				}
			}
			
			<!-- 아이디중복체크 -->
			function winopen(){
				//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
				//1. 아이디가 없으면 알림창과 진행x
				if(document.fr.id.value =="" || document.fr.id.value.length < 0){
					alert("아이디를 먼저 입력해주세요")
					document.fr.id.focus();
				}else{
					//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
					//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
					window.open("/member/joinIdCheck.do?id="+document.fr.id.value,"","width=500, height=300");
				}
			}
			
			
			//도로명주소 카카오API사용
			function execPostCode(){
				daum.postcode.load(function(){
			        new daum.Postcode({
			            oncomplete: function(data) {
			            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			               // 내려오는 변수가 값이 없을땐 공백('')값을 가지므로, 이를 참고하여 분기한다.
			                var addr = ''; // 주소 변수
							
			                
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('userZipcode').value = data.zonecode;
			                document.getElementById("userAddress").value = addr;
			                
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("userAddress").focus();
			            }
			        }).open();
			    });
			}
			
			</script>
			


		<!-- ============================================-->

		<%@include file="/inc/footer.jsp"%>

	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->
	<%@include file="/inc/script.jsp"%>


</body>

</html>
