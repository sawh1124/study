<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block" data-navbar-on-scroll="data-navbar-on-scroll">
        <div class="container"><a class="navbar-brand d-inline-flex" href="/main.do"><img class="d-inline-block" src="../assets/img/gallery/logo.png" alt="logo" /><span class="text-1000 fs-0 fw-bold ms-2">KwonSoonWoo</span></a>
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item px-2"><a class="nav-link fw-medium active" aria-current="page" href="/board/list.do">Board</a></li>
<!--               <li class="nav-item px-2"><a class="nav-link fw-medium" href="#header">Men</a></li> -->
<!--               <li class="nav-item px-2"><a class="nav-link fw-medium" href="#collection">Collection</a></li> -->
<!--               <li class="nav-item px-2"><a class="nav-link fw-medium" href="#outlet">Outlet</a></li> -->
            </ul>
            <form class="d-flex">
            	<%
            		if (session.getAttribute("id") != null) {
            			%>
		            	<span>Hello! &nbsp;<a class="text-1000" href="/member/info.do"><%=session.getAttribute("id") %></a></span>
            			<%
            		}
            	%>
                
<!--                 <a class="text-1000" href="#!"> -->
<!--                 <svg class="feather feather-shopping-cart me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"> -->
<!--                   <circle cx="9" cy="21" r="1"></circle> -->
<!--                   <circle cx="20" cy="21" r="1"></circle> -->
<!--                   <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path> -->
<!--                 </svg></a> -->
<!--                 <a class="text-1000" href="#!"> -->
<!--                 <svg class="feather feather-search me-3" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"> -->
<!--                   <circle cx="11" cy="11" r="8"></circle> -->
<!--                   <line x1="21" y1="21" x2="16.65" y2="16.65"></line> -->
<!--                 </svg></a> -->
<%
if(session.getAttribute("id") != null){
		
	}else{
		%>
		<a class="text-1000" href="/member/join.do">
                <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1 m-2">
                <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><line x1="20" y1="8" x2="20" y2="14"></line><line x1="23" y1="11" x2="17" y2="11"></line>
                </svg>
                </a>
                <a class="text-1000" href="/member/login.do">
                <svg viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="css-i6dzq1 m-2">
                <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path>
                <polyline points="10 17 15 12 10 7"></polyline>
                <line x1="15" y1="12" x2="3" y2="12"></line>
                </svg></a>
		
		<%
	}
%>
                
                <%
            		if (session.getAttribute("id") != null) {
            			%>
		            	<span>&nbsp;&nbsp;&nbsp;<a class="text-1000" href="/member/logout.do" >logout! &nbsp;</a></span>
            			<%
            		}
            	%>
               </form>
                
          </div>
        </div>
      </nav>
      
      <script>
      	
      </script>