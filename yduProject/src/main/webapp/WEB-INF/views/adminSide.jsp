<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
</head>
<script type="text/javascript">
	function logougChk() {
		if(confirm("로그아웃 하시겠습니까?")==true){
			location.href="logout";
		}
	}
</script>
<%@include file="header.jsp" %>
<body>
  <section id="container">
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><img src="img/ktk.jpg" class="img-circle" width="110"></a></p>
          <h5 class="centered">${sessionScope.sessionName }</h5>
          
          <!-- 공지사항   -->
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-bullhorn"></i>
              <span>공지사항 관리</span>
            </a>
           <!-- 전체 공지사항, 수업 공지사항 -->   
            <ul class="sub">
              <li><a href="notiList?b_type=1"><i class="fa fa-caret-right"></i>전체 공지사항 관리</a></li>
              <li><a href="classNotiList?b_type=2"><i class="fa fa-caret-right"></i>수업 공지사항 관리</a></li>
            </ul> 
          </li>    
          <!-- 관리자 페이지  -->
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>관리자 페이지</span>
            </a>
            <ul class="sub">
              <li><a href="memberInfo"><i class="fa fa-caret-right"></i>회원 관리</a></li>
            </ul>
          </li>
          <!-- 수업목록조회 페이지  -->
          <li class="sub-menu">
            <a href="classList">
              <i class="fa fa-cogs"></i>
              <span>수업 목록 조회</span>
            </a>
          </li>
          <!-- 대나무숲 관리   -->
          <li class="bamboo">
           <a href="bambooList?b_type=3">
              <i class="fa fa-pagelines"></i>
              <span>대나무숲 관리</span>
            </a>
          </li>
          <li class="rate my prof">
             <a href="professorRateList">
              <i class="fa fa-star-half-full"></i>
              <span>교수진 평가 조회</span>
            </a>
          </li>
     	  <li class="logout">
             <a href="#" onclick="logougChk()">
              <i class="fa fa-sign-out"></i>
              <span>로그아웃</span>
            </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
  </section>
</body>

</html>