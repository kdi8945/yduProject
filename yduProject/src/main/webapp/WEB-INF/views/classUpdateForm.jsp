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
  <title>YDU 수업 정보 수정</title>
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
  	function cancel(c_num) {
		if(confirm("수업 정보 수정을 취소하고 수업 정보 조회화면으로 돌아가시겠습니까?")==true){
			location.href="classContent?c_num="+c_num; // 개설현황으로 가야됨
		}
	}
  	function classUpdate(c_name){
  		var today = new Date();
  		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var todayString = year + '-' + month  + '-' + day; // 오늘날짜
		var re_date = $('#c_re_date').val(); // 모집시작일
		var s_date = $('#c_s_date').val();   // 수업시작일
		var e_date = $('#c_e_date').val();   // 수업종료일
		if(re_date <= todayString){ // 모집일 < 오늘
			alert("오늘까지는 수업모집일로 설정할 수 없습니다.");
		} else if(re_date > s_date){ // 시작일<모집일
			alert("수업시작일을 모집일 이후로 설정해주세요.");
		} else if(e_date < s_date){ // 종료일<시작일
			alert("수업종료일을 수업시작일 이후로 설정해주세요.");
		} else {
			var e_time = $('#c_e_time').val(); // 시작시간
			var co_time = $('#c_co_time').val(); // 종료시간
			if(e_time > co_time){ // 시작시간>종료시간
				alert("수업 종료시간이 시작시간보다 빠릅니다.");
			} else if(e_time == co_time){ // 시작시간=종료시간
				alert("수업 종료시간이 시작시간과 같습니다.");
			} else {
		  		var params = $("#classUpdateFormId").serializeArray();
				console.log(params);
				$.ajax({
					url : "classUpdate",
					data : params,
					type : 'get',
					dataType : 'json',
					success : function(data){
						var result = $.trim(data.resultMsg);
						var subResult = $.trim(data.subResultMsg);
						if(!subResult){
							alert(result);
						} else{
							if(confirm(result+" 수업목록화면으로 돌아가시겠습니까?")==true){
								location.href="classList";
							}
						}
					} 
				})
			}
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
		        <h3><i class="fa fa-angle-right"></i> 수업 정보 수정</h3>
		        <!-- BASIC FORM ELELEMNTS -->
		        <div class="row mt">
		          <div class="col-lg-12">
		            <div class="form-panel">
		              <h4 class="mb"><i class="fa fa-angle-right"></i> 수업 정보 설정</h4>
		              <form class="form-horizontal style-form" method="get" id="classUpdateFormId">
		              	<input type="hidden" name="c_num" id="c_num" value="${classContent.c_num }">
		              	<input type="hidden" name="pro_id" id="pro_id" value="${sessionScope.sessionId}">
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="c_name">수업명</label>
		                  <div class="col-sm-10">
		                    <input type="text" class="form-control" id="c_name" name="c_name" required="required" value="${classContent.c_name}">
		                  </div>
		                </div>
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="c_overview">수업개요</label>
		                  <div class="col-sm-10">
		                    <textarea class="form-control" id="c_overview" name="c_overview" required="required" placeholder="수업 개요를 작성하세요">${classContent.c_overview}</textarea>
		                  </div>
		                </div>
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="c_re_date">학생모집일</label>
		                  <div class="col-md-3 col-xs-11"">
		                    <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="date" name="c_re_date" id="c_re_date" required="required" value="${classContent.c_re_date }">
		                  </div>
		                </div>
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="c_s_date">수업시작일</label>
		                  <div class="col-md-3 col-xs-11">
		                    <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="date" name="c_s_date" id="c_s_date" required="required" value="${classContent.c_s_date }">
		                  </div>
		                </div>
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="c_e_date">수업종료일</label>
		                  <div class="col-md-3 col-xs-11">
		                    <input class="form-control form-control-inline input-medium default-date-picker" size="16" type="date" name="c_e_date" id="c_e_date" required="required" value="${classContent.c_e_date }">
		                  </div>
		                </div>
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="c_e_time">수업시작시간</label>
		                  	<div class="col-md-3 col-xs-11">
				                <select style="width: 100px" required="required" id="c_e_time" name="c_e_time">
				                  <option value="09">오전 9시</option>
				                  <option value="10">오전 10시</option>
				                  <option value="11">오전 11시</option>
				                  <option value="12">오후 12시</option>
				                  <option value="13">오후 1시</option>
				                  <option value="14">오후 2시</option>
				                  <option value="15">오후 3시</option>
				                  <option value="16">오후 4시</option>
				                  <option value="17">오후 5시</option>
				                </select>
			                </div>
		                </div>
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="c_co_time">수업종료시간</label>
		                  	<div class="col-md-3 col-xs-11">
				                <select style="width: 100px" required="required" id="c_co_time" name="c_co_time">
				                  <option value="10">오전 10시</option>
				                  <option value="11">오전 11시</option>
				                  <option value="12">오후 12시</option>
				                  <option value="13">오후 1시</option>
				                  <option value="14">오후 2시</option>
				                  <option value="15">오후 3시</option>
				                  <option value="16">오후 4시</option>
				                  <option value="17">오후 5시</option>
				                  <option value="18">오후 6시</option>
				                </select>
			                </div>
		                </div>
		                <div class="form-group">
		                  <label class="col-sm-2 col-sm-2 control-label" for="s_closed">수강인원</label>
		                  	<div class="col-md-3 col-xs-11">
				                <select style="width: 100px" required="required" id="s_closed" name="s_closed">
				                  <option value="10">10명</option>
				                  <option value="20">20명</option>
				                  <option value="30">30명</option>
				                </select>
			                </div>
		                </div>
		                <div style="margin: 20px"><span>&nbsp;</span></div>
		                  <div class="form-group">
		                    <div style="text-align: center;">
		                      <button type="button" class="btn btn-theme" onclick="classUpdate('${classContent.c_name}')">수업정보수정</button>
		                      <button class="btn btn-theme04" type="button" onclick="cancel(${classContent.c_num })">취소</button>
		                    </div>
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