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
      
      <section class="py-11 bg-light-gradient border-bottom border-white border-5">
        <div class="bg-holder overlay overlay-light" style="background-image:url(../assets/img/gallery/header-bg.png);background-size:cover;">
        </div>
        <!--/.bg-holder-->

        <div class="container">
          <div class="row flex-center">
            <div class="col-12 mb-10">
              <div class="d-flex align-items-center flex-column">
                <h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold">LOGIN</h1>
              </div>
            </div>
          </div>
        </div>
      </section>
      
       <section class="bg-light-gradient border-bottom border-white border-5">
        <div class="container">
            <div class="col-12">
            <form action="/member/loginPro.do" method="post">
            <div class="row">
				<div class="col-7 form-group">
					<label for="id">아이디</label>
					<input id="id" class="form-control" type="text" name="id">
				</div>
				<div class="col-7 form-group">
					<label for="pass">비밀번호</label>
					<input id="pass" class="form-control" type="password" name="pass">
				</div>
				<div class="col-7 text-center mt-5">
				<input class="btn btn-primary col-12" type="submit" value="로그인">
				</div>
            </div>
			</form>
            </div>
        </div>
      </section>
      
      <script>
			$(function() {
				if(${msg == false}) {
					alert("아이디나 비밀번호를 다시 확인해주세요.");
				}
			});
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
