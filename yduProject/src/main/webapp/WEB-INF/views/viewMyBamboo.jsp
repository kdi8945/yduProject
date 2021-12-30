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
<title>YDU 대나무숲</title>
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
<script src="lib/common-scripts.js"></script>
<!--script for this page-->
<script src="lib/sparkline-chart.js"></script>
<script src="lib/zabuto_calendar.js"></script>
<style type="text/css">
.center2 {
   margin-top: 50px;
}
</style>
<script type="text/javascript">
   function viewMyBambooDelete(b_num) {
      var sendData = 'b_num='+b_num;
      
      if(confirm("내가 쓴 대나무숲을 삭제 하시겠습니까? 확인을 누르시면 정상적으로 삭제가 됩니다.") == true){
         $.ajax({
            url : "viewMyBambooDelete",
            type: 'get',
            data : sendData,
            dataType : 'json',
            success : function(data){
               alert(data.resultMsg);
               location.reload();
            },
            error : function(){
               alert("데이터 처리에 오류가 발생했습니다.");
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
      <!--main content start-->
      <section id="main-content">
         <main>
            <div style="height: 50px"></div>
            <div style="margin-top: 50px">&nbsp;</div>

            <div class="row mt">
               <div class="col-md-12">
                  <div class="content-panel" style="width: 1250px; margin: 30px;">
                     <h2 style="margin: 18px; color: #228B22;">
                        <i class="fa fa-pagelines"></i> <strong>My 대나무 숲 조회</strong>
                     </h2>
                     <hr>
                     <c:if test="${viewMyBambooSize > 0 }">
                     <c:forEach var="viewMyBamboo" items="${viewMyBamboo}"
                        varStatus="status">
                        <div id="bambooUpdateForm${viewMyBamboo.b_num }">
                           <div class="center2" style="width: 900px; margin: auto;">
                              <table class="table table-striped table-advance table-hover">
                                 <tr>
                                    <td class="scrolling" data-b_num="${viewMyBamboo.b_num}"
                                       width="800px;"
                                       style="text-align: right; background-color: #20B2AA;">
                                       <font color="white"> 
                                          <i class="fa fa-pagelines">&nbsp;</i>${viewMyBamboo.b_num }&nbsp; 
                                          <i class="fa fa-user"></i>&nbsp;작성자&ensp;${sessionScope.sessionId}<p>
                                          <i class="fa fa-clock-o"></i>&nbsp;작성일&ensp;${viewMyBamboo.b_w_date }
                                       </font>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td height="260px;" width="800px;" style="background-color: #F8F8FF;">${viewMyBamboo.b_content }</td>
                                 </tr>
                                 <tr>
                                    <td>
                                       <button class="btn btn-round btn-danger" style="float: right; margin-right: 20px;" onclick="viewMyBambooDelete(${viewMyBamboo.b_num})">삭제</button>
                                    </td>
                                 </tr>
                              </table>
                              <div style="margin-bottom: 50px"></div>
                           </div>
                           <br>
                        </div>
                     </c:forEach>
                     </c:if>
                     <c:if test="${viewMyBambooSize == 0 }">
                     <h4 style="text-align : center; color: #A9A9A9; margin-top: 60px; margin-bottom: 60px;" >
                        <strong>My 대나무숲이 없습니다. 대나무 숲에서 글 작성을 해보세요..</strong>
                     </h4>
                     </c:if>
                  </div>
               </div>
            </div>
         </main>
      </section>
   </section>
</body>
<%@include file="footer.jsp"%>
</html>