<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
   content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>YDU 수업 공지사항</title>
<!-- Favicons -->
<link href="img/favicon.ico" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Bootstrap core CSS -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--external css-->
<link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet">
<script src="lib/jquery/jquery.min.js"></script>
<script src="lib/bootstrap/js/bootstrap.min.js"></script>
<script class="include" type="text/javascript"
   src="lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/jquery.scrollTo.min.js"></script>
<script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
<script src="lib/jquery.sparkline.js"></script>
<!--common script for all pages-->
<!-- <script type="text/javascript" src="../js/jquery.js"></script>
 --><script src="lib/common-scripts.js"></script>
<script type="text/javascript">
   //notiContent Ajax 참고용 
    function classNotiDelete(b_num,b_type) {
      if(confirm("게시물을 정말 삭제하시겠습니까?") == true){
         var sendData = 'b_num='+b_num+'&b_type='+b_type;
         $.ajax({
            url: 'classNotiDelete',
            type : 'get',
            data : sendData,
            success : function(data){
               var data = $.trim(data);
               if(data == 'deleteok'){
                  alert("게시물이 삭제되었습니다!");               
                  location.href="classNotiList?b_type=2";
               } else if(data =='deleteError'){
                  alert("게시물 삭제에 실패하였습니다.");
               }
            }
         })
      }   
   }    
</script>

</head>
<%@include file="header.jsp"%>
<c:choose>
   <c:when test="${sessionScope.sessionAutority == 3 }">
      <%@include file="adminSide.jsp"%>
   </c:when>
   <c:when test="${sessionScope.sessionAutority == 2 }">
      <%@include file="profSide.jsp"%>
   </c:when>
   <c:when test="${sessionScope.sessionAutority == 1 }">
      <%@include file="stuSide.jsp"%>
   </c:when>
</c:choose>
<body>
   <section id="container">
      <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
         <main>
            <div style="height: 100px"></div>
            <div class="row mt">
               <div class="col-md-12">
                  <div class="content-panel" style="width: 1250px; margin: 30px;">
                     <c:if test="${classBoardListSize > 0 }">
                        <h2 style="margin: 18px; color: #4B89DC;">
                           <i class="fa fa-bullhorn"></i> <strong>수업 공지사항</strong>
                        </h2>
                        <hr>
   
                        <table class="table table-striped table-advance table-hover"
                           style="text-align: center;">
                           <thead>
                              <tr>
                                 <th style="text-align: center;"><i class="fa fa-asterisk">&nbsp;</i>번호</th>
                                 <th style="text-align: center;"><i class="fa fa-bullhorn">&nbsp;</i>제목</th>
                                 <th style="text-align: center;"><i class="fa fa-user">&nbsp;</i>작성자</th>
                                 <th style="text-align: center;"><i class=" fa fa-clock-o">&nbsp;</i>작성일</th>
                                 <th style="text-align: center;"><i class=" fa fa-eye">&nbsp;</i>조회수</th>
                              </tr>
                           </thead>
   
                           <!-- List  -->
                           <c:forEach var="list" items="${classBoardList}" varStatus="status">
                              <tbody>
                                 <tr>
                                    <td>${list.b_num }</td>
                                    <td>
                                       <a href="classNotiContent?b_num=${list.b_num }&b_type=${list.b_type}">${list.b_title }</a>
                                       <c:if test="${list.b_w_date == today}">
                                          <img alt="img" src="img/newicon.png">
                                       </c:if>
                                    </td>
                                    <td>${list.name }</td>
                                    <td>${list.b_w_date }</td>
                                    <td>${list.b_view }</td>
                                 <td>
                                       <!-- 수정하기  버튼 -->
                                    <c:if test="${sessionScope.sessionId == list.id}">
                                       <button class="btn btn-success btn-xs">
                                          <a href="classNotiUpdateForm?b_num=${list.b_num }&b_type=${list.b_type }">
                                             <i class="fa fa-pencil-square-o"  style="color: white;">
                                             </i>
                                          </a>
                                       </button>
                                    </c:if>
                                          <!-- 삭제하기  버튼-->
                                    <c:if test="${sessionScope.sessionAutority == 3 || sessionScope.sessionId == list.id}">
                                       <button class="btn btn-danger btn-xs"
                                          onclick="classNotiDelete(${list.b_num},${list.b_type })">
                                          <i class="fa fa-trash-o "></i>
                                       </button>
                                    </c:if>
                                 </td>
                              </tr>
                           </tbody>
                        </c:forEach>
                     </table>
                     <!-- 작성하기  버튼 -->
                     <div>
                        <c:if test="${sessionScope.sessionAutority == 2}">
                        <button class="btn btn-info" style="width: 50x; margin: 22px;">
                           <a href="classNotiWriteForm?id=${sessionScope.sessionId }&b_type=2" style="color: white;">작성하기</a>
                        </button>
                        </c:if>
                           
                     <!-- 페이지 네비게이터 -->
                     <nav aria-label="Page navigation example" style="margin-left: 510px ;">
                        <ul class="pagination justify-content-center mt-5">
                        <!-- 이전 페이지 -->
                        <c:if test="${page.currentPage > 1 }">
                                 <li class="page-item"><a
                                    class="pagenav_a page-link" href="classNotiList?b_type=2&currentPage=${page.currentPage - 1}" aria-label="Previous">
                                       &lt;
                                 </a></li>
                        </c:if>
                     <!-- 페이지 목록 -->
                        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
                           <li class="page-item"><a class="pagenav_a page-link"
                              href="classNotiList?b_type=2&currentPage=${i }&rowPage=${page.rowPage }">${i }</a></li>
                        </c:forEach>
                     <!-- 다음 페이지 -->
                        <c:choose>
                           <c:when test="${page.currentPage < page.totalPage }">
                              <li class="page-item"><a
                                 class="pagenav_a page-link" href="classNotiList?b_type=2&currentPage=${page.currentPage + 1}" aria-label="Previous">
                                    &gt;
                              </a></li>
                           </c:when>
                           <c:otherwise>
                              <li class="page-item" style="visibility: hidden;"><a
                                    class="pagenav_a page-link" href="classNotiList?b_type=2&currentPage=${page.currentPage + 1}" aria-label="Previous">
                                       &gt;
                              </a></li>
                           </c:otherwise>               
                        </c:choose>      
                           </ul></nav>   
                     </div>
                  </c:if>
                  <c:if test="${classBoardListSize == 0 }">
                     <h2 style="text-align : center; color: #4B89DC;" >
                        <strong>공지사항이 없습니다.</strong>
                     </h2>
                  </c:if>
                  </div>
               </div>
            </div>
         </main>
      </section>
      <!--main content end-->
   </section>
</body>
<%@include file="footer.jsp"%>
</html>