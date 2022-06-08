<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <h1 class="fs-4 fs-lg-8 fs-md-6 fw-bold">LIST</h1>
              </div>
            </div>
          </div>
        </div>
      </section>
    <div class="container">
        <table class="table table-hover table-striped text-center"
            style="border: 1px solid;margin-top:5%;">
            <colgroup>
                <col width="10%" />
                <col width="50%" />
                <col width="20%" />
                <col width="20%" />
            </colgroup>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록일자</th>
                </tr>
            </thead>
 
            <tbody>
                <c:forEach items="${list }" var="result">
                    <tr>
                        <td>${result.no}</td>
                        <td><a href="/board/BoardDetail.do?no=${result.no}">${result.title}
                        <c:if test="${result.fileName != '' and result.fileName != null}">
                        <svg viewBox="0 0 24 24" width="16" height="16" stroke="currentColor" stroke-width="1.5" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1"><path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"></path><polyline points="17 21 17 13 7 13 7 21"></polyline><polyline points="7 3 7 8 15 8"></polyline></svg>
                        </c:if> 
                        </a></td>
                        <td>${result.write_id}</td>
                        <td>${result.reg_date}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- pagination start -->
        <div id="paginationBox" class="pagination1">
            <ul class="pagination" style="justify-content: center;">
 
                <c:if test="${paginationBean.prev}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_prev('${paginationBean.page}', '${paginationBean.range}', '${paginationBean.rangeSize}', '${paginationBean.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">이전</a></li>
                </c:if>
 
                <c:forEach begin="${paginationBean.startPage}" end="${paginationBean.endPage}" var="testId">
                    <li class="page-item <c:out value="${paginationBean.page == testId ? 'active' : ''}"/> ">
                    <a class="page-link" href="#"
                        onClick="fn_pagination('${testId}', '${paginationBean.range}', '${paginationBean.rangeSize}', '${paginationBean.listSize}'
                     ,'${search.searchType}', '${search.keyword}')">
                            ${testId} </a></li>
                </c:forEach>
 
                <c:if test="${paginationBean.next}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_next('${paginationBean.range}', '${paginationBean.range}', '${paginationBean.rangeSize}', '${paginationBean.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">다음</a></li>
                </c:if>
            </ul>
        </div>
        <!-- pagination end -->
        <hr />
        <%if(session.getAttribute("id") != null){%>
        		<a class="btn btn-outline-info" style="float: right" href="/board/write.do">글쓰기</a>
		 <%}else{%>
        		 <a class="btn btn-outline-info" style="float: right" href="/member/login.do">글쓰기</a>
        <%}%>
        <!-- search start -->
        <div class="">
 
            <div class="w100" style="width:150px;display: inline-block;">
                <select class="form-control form-control-sm" name="searchType" id="searchType">
                    <option value="Title">제목</option>
                    <option value="Content">내용</option>
                    <option value="Name">작성자</option>
                </select>
            </div>
 
            <div class="w300" style="width:250px;display: inline-block;">
                <input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
            </div>
 
            <div style="display: inline-block;">
                <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
            </div>
 
        </div>
        <!-- search end -->
    
    </div>
   <%@include file="/inc/footer.jsp"%>

 </main>
 <!-- ===============================================-->
 <!--    End of Main Content-->
 <!-- ===============================================-->
 <%@include file="/inc/script.jsp"%>
 
 <script type="text/javascript">
    //이전 버튼 이벤트
    //5개의 인자값을 가지고 이동 testList.do
    //무조건 이전페이지 범위의 가장 앞 페이지로 이동
    function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
            
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;
            
        var url = "/board/list.do";
        url += "?page=" + page;
        url += "&range=" + range;
        url += "&listSize=" + listSize;
        url += "&searchType=" + searchType;
        url += "&keyword=" + keyword;
        location.href = url;
        }
 
 
    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {
 
        var url = "/board/list.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&searchType=" + searchType;
            url += "&keyword=" + keyword; 
 
            location.href = url;    
        }
 
    //다음 버튼 이벤트
    //다음 페이지 범위의 가장 앞 페이지로 이동
    function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;            
        var url = "/board/list.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&searchType=" + searchType;
            url += "&keyword=" + keyword;
            location.href = url;
        }
        
    // 검색
    $(document).on('click', '#btnSearch', function(e){
        e.preventDefault();
        var url = "/board/list.do";
        url += "?searchType=" + $('#searchType').val();
        url += "&keyword=" + $('#keyword').val();
        location.href = url;
        console.log(url);
 
    });    
 
    </script>
</body>

</html>
    



