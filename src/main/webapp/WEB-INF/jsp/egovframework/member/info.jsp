<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<%@include file="/inc/head.jsp"%>
  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
    <%@include file="/inc/nav.jsp"%>
      
      <section class="py-11 bg-light-gradient border-bottom border-white border-5">
        <div class="bg-holder overlay overlay-light" style="background-image:url(../assets/img/gallery/header-bg.png);background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row flex-center">
            <div class="col-12 mb-10">
              <div class="d-flex align-items-center flex-column">
                <h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold">info</h1>
              </div>
            </div>
          </div>
        </div>
      </section>
      
       <section class="bg-light-gradient border-bottom border-white border-5">
        <div class="container">
            <div class="col-12">
            	<form action="/member/updatePro.do" method="post" id="update" name="fr"
						onsubmit="return check();">		
						<p>가입일자 : <fmt:formatDate value="${resultBean.createdAt }" pattern="yyyy년 MM월 dd일"/>
						<div class="row">
							<div class="col-12 form-group">
								<label for="id">아이디</label> <input id="id" class="form-control"
									type="text" name="id" value="<%=session.getAttribute("id") %>" readonly>
							</div>
							<div class="col-12 form-group">
								<label for="name">이름</label> <input id="name"
									class="form-control" type="text" name="name" value="${resultBean.name}">
							</div>
							<div class="col-12 form-group">
								<label for="nickname">닉네임</label> <input id="nickname"
									class="form-control" type="text" name="nickname" value="${resultBean.nickname}">
							</div>
				
							<div class="col-12 form-group">
								<label for="email">이메일</label> <input id ="email" type="email"
									class="form-control" name="email"
									placeholder="예시 : funweb@funweb.com (@포함기입)"  value="${resultBean.email}"><br>
							</div>
							<div class="col-12 form-group">
								<label for="birth">생년월일</label> <input id ="birth"type="text" class="form-control"
									name="birth" placeholder="예시 : 000000 (6자리)" maxlength="6"  value="${resultBean.birth}"
									><br>
							</div>
							<div class="col-12 form-group">
								<label for="gender">성별</label> <select class="form-control" id="gender" name="gender">
									<option class="form-control" value="" <c:if test="${resultBean.gender eq '' }">selected</c:if>>선택</option>
									<option class="form-control" value="f" <c:if test="${resultBean.gender eq 'f' }">selected</c:if>>여자</option>
									<option class="form-control" value="m" <c:if test="${resultBean.gender eq 'm' }">selected</c:if>>남자</option>

								</select><br>
							</div>
						</div>


						<fieldset>
							
							<div class="col-12 form-group">
								<label for="mobile">휴대폰번호</label> <input id="mobile" type="text" class="form-control"
									name="mobile" placeholder="예시 : 010-1234-5678" maxlength="13" value="${resultBean.mobile}"><br>
							</div>
						</fieldset>



						<div class="col-12 text-center mt-5">
							<input class="btn btn-primary col-5" type="submit" value="수정하기">
						</div>
					</form>
            </div>
        </div>
      </section>

      <!-- ============================================-->
  <script>
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

		var mobile = $("#mobile");
		if(mobile.val() == ""){
			writeMsg('mobile', mobile, '필수 값');
			return false;
		} else if (!isPhoneNumber(mobile.val())){
			writeMsg('mobile', mobile, '적합하지 않은 휴대폰번호 형식');
			return false;
		}
	}
	
  </script>
  
<%@include file="/inc/footer.jsp"%>

 </main>
 <!-- ===============================================-->
 <!--    End of Main Content-->
 <!-- ===============================================-->
 <%@include file="/inc/script.jsp"%>
</body>

</html>
