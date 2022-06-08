<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<style>
th {

}
</style>
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
                <h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold">WRITE</h1>
              </div>
            </div>
          </div>
        </div>
      </section>
<div class="container">
        <form id="form_test" action="/board/writePro.do" name="insertForm" method="post" encType="multipart/form-data">
            <table class="table table-bordered" style="width: 60%;margin-top: 5%;margin-left: 20%;">
                <tbody>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" placeholder="제목을 입력하세요."
                            name="Title" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea placeholder="내용을 입력하세요 ." name="contents"
                                class="form-control" style="height: 200px;"></textarea></td>
                    </tr>
                      <tr>
                        <th>첨부파일</th>
                        <td><input type="file" name="uploadFile"></td>    
                    </tr>
                        <tr>
                        <th>작성자</th>
                        <td> <input class="form-control" name="write_id" id="write_id" value="<%=session.getAttribute("id")%>" readonly>
                                 </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <div style="float:right;"><button id="btn_register" type="button" class="btn_register" onclick="/board/list.do">등록</button>
                            <button id="btn_previous" type="button" class="btn_previous">이전</button></div>
                            
                        </td>
                    </tr>
 
                </tbody>
            </table>
        </form>
    </div>
</body>
<script type="text/javascript">
    //글쓰기
    $(document).on('click', '#btn_register', function(e) {
 		if($("input[name=Title]").val() != ''){
        	$("#form_test").submit();
 		} else {
 			alert("제목을 입력하세요.");
 		}
    });
 
    //이전 클릭 시 testList로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', '/board/list.do');
 
    });
    
</script>
<%@include file="/inc/footer.jsp"%>

 </main>
 <!-- ===============================================-->
 <!--    End of Main Content-->
 <!-- ===============================================-->
 <%@include file="/inc/script.jsp"%>
</html>


