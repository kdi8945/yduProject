<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>YDU 수업 공지사항 수정</title>
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
    //수업 공지사항 수정 취소
    function classNotiUpdCancel() {
		if(confirm("게시물 수정을 취소하시겠습니까?")==true){
			history.back();
		}
	}
  
  	//수업 공지사항 수정에 대한 Ajax
  	function classNotiUpdate() {
		var b_title = $('#b_title').val(); //밑의 input tag 에 id안에 선언해준 이름을 가져온다
		var b_content = $('#b_content').val();
		var b_view = $('#b_view').val();
		var b_num = $('#b_num').val();
		var b_type = $('#b_type').val();
		var sendData = 'b_title='+b_title+'&b_content='+b_content+"&b_view="+b_view+"&b_num="+b_num+"&b_type="+b_type;
		console.log(sendData);
		$.ajax({
			url : 'classNotiUpdate',
			type : 'get', 
			data : sendData,
			dataType : 'text',
			success : function(result) {
				console.log(typeof(result)); // result의 데이터 타입 확인
				if(result > 0){
					alert("수정에 성공하였습니다.");
					location.href="classNotiList?b_type="+b_type;
				} else{
					alert("수정을 실패하였습니다.");
				}
			}
		})
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
    <section id="main-content">
		<main>
			<div style="height: 65px"></div>
			<section id="main-content">
      <section class="wrapper">
        <h3><i class="fa fa-edit">&nbsp;</i>수업 공지사항 수정하기</h3>
        <div class="row mt">
          <div class="col-lg-8 col-md-7 col-sm-7">
            <div id="message"></div>
            <form class="contact-form php-mail-form" role="form">
			<input type="hidden" id="b_view" value="${notiBoardInfo.b_view }">
			<input type="hidden" id="b_num" value="${notiBoardInfo.b_num }">
			<input type="hidden" id="b_type" value="${notiBoardInfo.b_type }">
			<!-- 제목 -->
              <div class="form-group">
                <input type="text" name="b_title" class="form-control" id="b_title" placeholder="수정할 제목을 입력해주세요." data-rule="minlen:4" required="required">
                <div class="validate"></div>
              </div>
			<!-- 내용   -->
              <div class="form-group">
                <textarea class="form-control" name="b_content" id="b_content" placeholder="수정할 내용을 입력해주세요." rows="7" data-rule="required" ></textarea>
                <div class="validate"></div>
              </div>
            <!-- 수정하기 버튼 --> 
              <div class="form-send">
                <button type="button" class="btn btn-large btn-primary" onclick="classNotiUpdate()">수정하기</button>
                <button class="btn btn-theme04" style="background-color: #FF0000;">
					<a href="#" style="color: white;" onclick="classNotiUpdCancel()">수정취소</a>
				</button>
              </div>
            <!-- 수정하기 취소 버튼  -->
            </form>
          </div>
        </div>
      </section>
    </section>
		</main>
    </section>
  </section>
</body>
	<%@include file="footer.jsp" %> 
</html>