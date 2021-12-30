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
<script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
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
   function bambooDelete(b_num) {
      var sendData = 'b_num='+b_num;
      
      if(confirm("대나무숲을 삭제 하시겠습니까?") == true){
         $.ajax({
            url : "bambooDelete",
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
  
   function bambooWrite() {
      var id = "${sessionScope.sessionId}";
      var b_content = $('#b_content').val();
        var sendData = 'id='+id+'&b_content='+b_content;
        $.ajax({
           url : "bambooWrite",
           type : 'get',
           data : sendData,
           dataType : 'json',
           success : function(data){
              alert(data.resultMsg); // insert 결과가 1이면 성공메세지 0이면 실패메세지 출력(dao 보셈)
              location.reload();
           },
           error : function(){
              alert("데이터 처리에 오류가 발생했습니다.");
           }
        })
     }
   
   //update 수정 폼
   function bambooUpdateForm(b_num){
      var today = new Date();
      var year = today.getFullYear();
      var month = ('0'+(today.getMonth() + 1)).slice(-2);
      var day = ('0'+today.getDate()).slice(-2);
      var dateString = year + '/' + month + '/' + day;
      var id = "${sessionScope.sessionId}";
      console.log(dateString);
      
      var htmls = "";
         htmls += '<input type ="hidden" id="b_num'+b_num+'" value="'+b_num+'">';
         htmls += '<div class="center2" style="width: 900px; margin: auto;">';
         htmls += '<form>';
         htmls += '<table class="table table-striped table-advance table-hover">';
         htmls += '<tr>';
         htmls += '<td  class="scrolling" data-b_num='+b_num+' width="800px;" style="text-align: right; background-color: #1E90FF; font" >';
         htmls += '<font color="white">';
         htmls += '<i class="fa fa-pagelines">&nbsp;</i>'+b_num+'&nbsp;';
         htmls += '<i class="fa fa-user"></i>&nbsp;작성자&ensp; 익명<p>';
         htmls += '<i class="fa fa-clock-o"></i>&nbsp;작성일&ensp;'+dateString+'</font>';//현재날짜
         htmls += '</td>';
         htmls += '</tr>';
         
         htmls += '<tr>'; 
         htmls += '<td height="260px;" width="800px;" style="background-color: white;">';
         htmls += '<div class="mb-3">';
         htmls += '<textarea class="form-control" id="b_content'+b_num+'" rows="9" placeholder="여기에 수정하고 싶은 내용을 적어주세요.."></textarea>';
         htmls += '</div>';
         htmls += '</td>';
         htmls += '</tr>';
         
         htmls += '<tr>';
         htmls += '<td>';
         htmls += '<button type="button" class="btn btn-danger" style="float: right; margin-right: 10px;" onclick="bambooUpdateCancel('+b_num+')">';
         htmls += '<i class="fa fa-times">&nbsp;취소</i></button>';
         htmls += '<button type="button" class="btn btn-theme02" style="float: right; margin-right: 20px;" onclick="bambooUpdate('+b_num+')">';
         htmls += '<i class="fa fa-pencil">&nbsp;완료</i></button>';
         htmls += '</td>';
         htmls += '</tr>';
         
         htmls += '</talbe>';
         htmls += '<div style="margin-bottom: 50px"></div>';
         htmls += '</form>';
         htmls += '</div>';
         htmls += '<br>'; 
         $('#bambooUpdateForm'+b_num).html(htmls);
      }
      
   //수정폼에서 update 취소를 누르면 되돌아가기
   function bambooUpdateCancel(b_num){
      var sendData = 'b_num='+b_num;
      if(confirm("확인을 누르시면 작성하던 내용들이 사라지고 수정 취소가 됩니다.") == true){
         $.ajax({
            url : "bambooUpdateCancel",
            type : 'get',
            data : sendData,
            dataType : 'json',
            
            success : function(data){
               var htmls = "";
               htmls += '<div class="center2" style="width: 900px; margin: auto;">';
               htmls += '<table class="table table-striped table-advance table-hover">';
               htmls += '<tr>';
               htmls += '   <td class="scrolling" data-b_num="'+b_num+'" width="800px;" style="text-align: right; background-color: #20B2AA;">';
               htmls += '<font color="white"> <i class="fa fa-pagelines">&nbsp;</i> '+b_num+'&nbsp;';
               htmls += '<i class="fa fa-user"></i>&nbsp;작성자&ensp; 익명 <p>';
               htmls += '<i class="fa fa-clock-o"></i>&nbsp;작성일&ensp;'+data.b_w_date+'</font>';
               htmls += '</td>';
               htmls += '</tr>';
               htmls += '<tr>';
               htmls += '<td height="260px;" width="800px;" style="background-color: white;">&quot;'+data.b_content+'&quot;</td>';
               htmls += '</tr>';
               htmls += '<tr>';
               htmls += '<td>';
               htmls += '<button type="button" class="btn btn-round btn-danger" style="float: right; margin-right: 20px;" onclick="bambooDelete('+b_num+')">삭제</button>';
               htmls += '<button type="button" class="btn btn-round btn-success" style="float: right; margin-right: 10px;" onclick="bambooUpdateForm('+b_num+')">수정</button>';
               htmls += '</td>';
               htmls += '</tr>';
               htmls += '</table>';
               htmls += '<div style="margin-bottom: 50px"></div>';
               htmls += '</div>';
               htmls += '<br>';
               
               $('#bambooUpdateForm'+b_num).html(htmls);
               location.reload();
               
            }
            
         })
      }
   }
   //대나무숲 수정하기
   function bambooUpdate(b_num) {
      var b_content = $('#b_content'+b_num).val();
      var sendData = 'b_content='+b_content+'&b_num='+b_num;
      if(confirm("확인을 누르시면 수정이 완료 됩니다.")==true){
         $.ajax({
            url : "bambooUpdate",
            type : 'get',
            data : sendData,
            dataType : 'json',
            success : function(data){
               console.log(data);
               
               var htmls = "";
               
                  htmls += '<div class="center2" style="width: 900px; margin: auto;">';
                  htmls += '<table class="table table-striped table-advance table-hover">';
                  htmls += '<tr>';
                  
                  htmls += '<td class="scrolling" data-b_num="'+data.b_num+'" width="800px;" style="text-align: right; background-color: #20B2AA;">';
                  htmls += '<font color="white"> <i class="fa fa-pagelines">&nbsp;</i>'+data.b_num+'&nbsp;';
                  htmls += '<i class="fa fa-user"></i>&nbsp;작성자&ensp; 익명 <p>';
                  htmls += '<i class="fa fa-clock-o"></i>&nbsp;작성일&ensp;'+data.b_w_date+'</font>';
                  htmls += '</td>';
                  htmls += '</tr>';
                  
                  htmls += '<tr>';
                  htmls += '<td height="260px;" width="800px;" style="background-color: white;">'+data.b_content;
                  htmls += '</td>';
                  htmls += '</tr>';
                  
                  htmls += '<tr>';
                  htmls += '<td>';
                  htmls += '<button type="button" class="btn btn-round btn-danger" style="float: right; margin-right: 20px;" onclick="bambooDelete('+data.b_num+')">삭제</button>';
                  htmls += '<button type="button" class="btn btn-round btn-success" style="float: right; margin-right: 10px;" onclick="bambooUpdateForm('+data.b_num+')">수정</button>';
                  htmls += '</td>';
                  htmls += '</tr>';
                  htmls += '</table>';
                  htmls += '<div style="margin-bottom: 50px">';
                  htmls += '</div>';
                  htmls += '</div>';
                  htmls += '<br>';
               $('#bambooUpdateForm'+b_num).html(htmls);
               alert(data.resultMsg);
               location.reload();
            },
            error : function(){
                 alert("데이터 수정 처리에 오류가 발생했습니다.");
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
            <table border="1">
               <tr>
                  <td
                     style="background-color: #5cdec1; text-align: center; height: 250px; width: 1500px;">
                     <h1>
                        <font color="white"><strong>YDU 대나무숲</strong></font>
                     </h1>
                  </td>
               </tr>
            </table>

            <%-- 작성폼 --%>
            <c:if test="${sessionScope.sessionAutority == 1}">
            <div class="center2"
               style="width: 900px; margin: auto; margin-top: 50px;">
               <form>
                  <table class="table table-striped table-advance table-hover">
                     <tr>
                        <td style="background-color: #1E90FF;" height="50px"></td>
                     </tr>
                     <tr>
                        <td height="260px;" width="800px;"
                           style="background-color: white;">
                           <div class="mb-3">
                              <textarea class="form-control" id="b_content" rows="9"
                                 placeholder="여기에 대나무숲 글 작성을 해주세요.."></textarea>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <button type="reset" class="btn btn-danger"
                              style="float: right; margin-right: 10px;">
                              <i class="fa fa-times">&nbsp;취소</i>
                           </button>
                           <button class="btn btn-theme02"
                              style="float: right; margin-right: 20px;"
                              onclick="bambooWrite()">
                              <i class="fa fa-pencil">&nbsp;작성</i>
                           </button>
                        </td>
                     </tr>
                  </table>
               </form>
               <div style="margin-bottom: 50px"></div>
            </div>
            </c:if>
            
            <div style="margin-top: 50px">&nbsp;</div>
            <c:forEach var="bambooList" items="${bambooList}" varStatus="status">
               <div id ="bambooUpdateForm${bambooList.b_num }">
                  <div class="center2" style="width: 900px; margin: auto;">
                     <table class="table table-striped table-advance table-hover">
                        <tr>
                           <td class="scrolling" data-b_num="${bambooList.b_num}" width="800px;" style="text-align: right; background-color: #20B2AA;">
                           <font color="white"> <i class="fa fa-pagelines">&nbsp;</i> ${bambooList.b_num }&nbsp;
                            <i class="fa fa-user"></i>&nbsp;작성자&ensp; 익명 <p>
                            <i class="fa fa-clock-o"></i>&nbsp;작성일&ensp;${bambooList.b_w_date }</font>
                            </td>
                        </tr>
                        <tr>
                           <td height="260px;" width="800px;" style="background-color: white;">${bambooList.b_content }</td>
                        </tr>
                        <tr>
                           <td><c:if test="${sessionScope.sessionAutority == 3 || sessionScope.sessionId == bambooList.id}">
                                 <button class="btn btn-round btn-danger" style="float: right; margin-right: 20px;" onclick="bambooDelete(${bambooList.b_num})">삭제</button>
                                 <c:if test="${sessionScope.sessionId == bambooList.id}">
                                    <button class="btn btn-round btn-success" style="float: right; margin-right: 10px;" onclick="bambooUpdateForm(${bambooList.b_num})">수정</button>
                                 </c:if>
                              </c:if></td>
                        </tr>
                     </table>
                     <div style="margin-bottom: 50px"></div>
                  </div>
                  <br>
               </div>
               
            </c:forEach>
         </main>
      </section>
   </section>
</body>
<%@include file="footer.jsp"%>
</html>