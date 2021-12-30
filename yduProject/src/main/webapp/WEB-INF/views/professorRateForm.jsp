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
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>YDU 교수 평가</title>
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
  <script src="lib/chart-master/Chart.js"></script>
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="lib/common-scripts.js"></script>
  <!--script for this page-->
  <script src="lib/sparkline-chart.js"></script>
  <script src="lib/zabuto_calendar.js"></script>
  <script type="text/javascript">
     function cancel() {
      if(confirm("교수 평가를 취소하고 이전 화면으로 돌아가시겠습니까?")==true){
         history.back();
      }
   }
     function professorRate(){
        var prof_rates = $('#prof_rates').val();
        var rate_content = $('#rate_content').val();
        if(prof_rates == 0){
           alert("평점이 입력되지 않았습니다.");
        } else if(!rate_content){
           alert("평가내용이 입력되지 않았습니다.");
        } else{
           var stu_id = "${sessionScope.sessionId}";
           var c_num = ${professorRateForm.c_num};
           var sendData = "stu_id="+stu_id+"&c_num="+c_num+"&prof_rates="+prof_rates+"&rate_content="+rate_content;
           $.ajax({
              url : "professorRate",
              data : sendData,
              type : 'get',
              dataType : 'json',
              success : function(data) {
               var result = $.trim(data.resultMsg);
               if(!data.errorCode){
                  alert(result);
                  location.href="professorRateList";
               } else{
                  alert(result);
               }
            }
           })
        }
     }
  </script>
</head>
   <%@include file="header.jsp" %>
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
         <section class="wrapper">
              <h2 style="margin: 18px; color: #A0522D;"><i class="fa fa-star-half-o">&nbsp;</i><strong>교수자 평가하기</strong></h2>
              <!-- BASIC FORM ELELEMNTS -->
              <div class="row mt">
                <div class="col-lg-12">
                  <div class="form-panel">
                    <form class="form-horizontal style-form" method="get" id="createClassFormId">
                      <div class="form-group">
                        <div class="col-sm-2 col-sm-2 control-label">수업명</div>
                        <div class="col-sm-10">
                          ${professorRateForm.c_name}
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-2 col-sm-2 control-label">수업개요</div>
                        <div class="col-sm-10">
                          ${professorRateForm.c_overview}
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-2 col-sm-2 control-label">수업일정</div>
                        <div class="col-md-3 col-xs-11">
                          ${professorRateForm.c_s_date} ~ ${professorRateForm.c_e_date}
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-2 col-sm-2 control-label">평점</div>
                           <div class="col-md-3 col-xs-11">
                            <select style="width: 100px" required="required" id="prof_rates" name="prof_rates">
                              <option value="0">평점선택</option>
                              <option value="5">5점</option>
                              <option value="4">4점</option>
                              <option value="3">3점</option>
                              <option value="2">2점</option>
                              <option value="1">1점</option>
                            </select>
                         </div>
                      </div>
                      <div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label" for="rate_content">교수자 평가 내용</label>
                        <div class="col-sm-10">
                          <textarea class="form-control" id="rate_content" name="rate_content" required="required" placeholder="교수 평가 내용을 작성하세요"></textarea>
                        </div>
                      </div>
                      <div style="margin: 20px"><span>&nbsp;</span></div>
                          <div style="text-align: center;">
                            <button type="button" class="btn btn-theme" onclick="professorRate()">평가제출</button>
                            <button class="btn btn-theme04" type="button" onclick="cancel()">취소</button>
                          </div>
                    </form>
                  </div>
                </div>
                <!-- col-lg-12-->
              </div>
            </section>
            <!-- /wrapper -->
      </main>
    </section>
    <!--main content end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
</body>
   <%@include file="footer.jsp" %> 
</html>