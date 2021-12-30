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
<title>YDU 교수 평가 목록</title>
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
 -->
<script src="lib/common-scripts.js"></script>
<script type="text/javascript">
   function searchProfRate() {
      var searchContent = $('#searchProfRate').val();
      if(window.event.keyCode == 13){
         if(!searchContent){
            location.href="professorRateList";
         } else {
            var sendData = "searchContent="+searchContent;
            $.ajax({
               url : "searchProfRate",
               data : sendData,
               type : 'get',
               dataType : 'json',
               success : function(data) {
                  var htmls = '';
                  
                  htmls += '<h2 style="margin: 18px; color: #A0522D;" >';
                  htmls += '<i class="fa fa-star-half-o"></i> <strong>교수자 평가 조회</strong>';
                  htmls += '<span class="input-append" style="width: 200px; float: right;">';
                  htmls += '<input type="text" class="form-control " placeholder="Search ProfessorRate" id="searchProfRate" onkeyup="searchProfRate()">';
                  htmls += '</span>';
                  htmls += '</h2>';
                  htmls += '<hr>';
                  if(!data[0].resultCode) {
                     htmls += '<table class="table table-striped table-advance table-hover" style="text-align: center;">';
                     htmls += '<thead>';
                     htmls += '<tr>';
                     htmls += '<th style="text-align: center; width: 150px;"><i class="fa fa-asterisk">&nbsp;</i>수업번호</th>';
                     htmls += '<th style="text-align: center;"><i class="fa fa-book">&nbsp;</i>수업명</th>';
                     htmls += '<th style="text-align: center; width: 200px;"><i class="fa fa-user">&nbsp;</i>교수명</th>';
                     htmls += '<th style="text-align: center; width: 150px"><i class=" fa fa-star-half-o">&nbsp;</i>과목평점</th>';
                     htmls += '<th style="text-align: center; width: 200px"><i class=" fa fa-calendar">&nbsp;</i>수업종료일</th>';
                     htmls += '</tr>';
                     htmls += '</thead>';
                     htmls += '<tbody>';
                     $.each(data, function(idx, searchList){ // list를 반복문으로 꺼냄
                        console.log(searchList);
                        htmls += '<tr>'; 
                        htmls += '<td>'+searchList.c_num+'</td>';
                        htmls += '<td><a href="professorRateContent?c_num='+searchList.c_num+'">'+searchList.c_name+'</a></td>';
                        htmls += '<td><strong>'+searchList.name+'</strong></td>';
                        htmls += '<td>'+searchList.prof_rates+'</td>';
                        htmls += '<td>'+searchList.c_e_date+'</td>';
                        htmls += '</tr>'; 
                     })
                     htmls += '</tbody>';
                     htmls += '</table>';
                  } else{
                     var searchContent = data[0].searchContent;
                     htmls += '<h2 style="text-align : center; color: #4B89DC;" >';
                     htmls += '<strong>'+searchContent+'에 대한 검색 결과가 없습니다.</strong>';
                     htmls += '</h2>';
                  }
                  $('#afterSearch').html(htmls);
               }
            });
         }
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
      <!--main content start-->
      <section id="main-content">
         <main>
            <div style="height: 100px"></div>
            <div class="row mt">
               <div class="col-md-12">
                  <div class="content-panel" style="width: 1250px; margin: 30px;">
                     <div id = "afterSearch">
                        <c:if test="${listSize > 0}">
                           <h2 style="margin: 18px; color: #A0522D;" >
                              <i class="fa fa-star-half-o"></i> <strong>교수자 평가 조회</strong>
                                 <span class="input-append" style="width: 200px; float: right;">
                                    <input type="text" class="form-control " placeholder="Search ProfessorRate" id="searchProfRate" onkeyup="searchProfRate()">
                                 </span>
                           </h2>
                           <hr>
                           <table class="table table-striped table-advance table-hover" style="text-align: center;">
                              <thead>
                                 <tr>
                                    <th style="text-align: center; width: 150px;"><i class="fa fa-asterisk">&nbsp;</i>수업번호</th>
                                    <th style="text-align: center;"><i class="fa fa-book">&nbsp;</i>수업명</th>
                                    <th style="text-align: center; width: 200px;"><i class="fa fa-user">&nbsp;</i>교수명</th>
                                    <th style="text-align: center; width: 150px"><i class=" fa fa-star-half-o">&nbsp;</i>과목평점</th>
                                    <th style="text-align: center; width: 200px"><i class=" fa fa-calendar">&nbsp;</i>수업종료일</th>
                                 </tr>
                              </thead>
                              <!-- List  -->
                              <tbody>
                                 <c:forEach var="list" items="${professorRateList}">
                                    <tr> 
                                       <td>${list.c_num}</td>
                                       <td><a href="professorRateContent?c_num=${list.c_num}">${list.c_name }</a></td>
                                       <td><strong>${list.name }</strong></td>
                                       <td>${list.prof_rates }</td>
                                       <td>${list.c_e_date }</td>
                                    </tr> 
                                 </c:forEach>
                              </tbody>
                           </table>
                        </c:if>
                        <c:if test="${listSize == 0 }">
                           <h2 style="text-align : center; color: #4B89DC;" >
                              <strong>종강한 수업이 없습니다.</strong>
                           </h2>
                        </c:if>
                     </div>
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