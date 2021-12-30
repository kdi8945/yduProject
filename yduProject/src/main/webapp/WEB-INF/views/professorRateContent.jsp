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
<title>YDU 학사관리 시스템</title>
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
	function profRateUpdateForm(c_num) {
		var stu_id = "${sessionScope.sessionId}";
		location.href="professorRateUpdateForm?c_num="+c_num+"&stu_id="+stu_id;
	}
	function profRateDelete(c_num, stu_id) {
		if(confirm("삭제 후엔 복구가 불가능합니다. 교수 평가를 삭제하시겠습니까?")==true){
			var sendData = "c_num="+c_num+"&stu_id="+stu_id;
			$.ajax({
				url : "professorRateDelete",
				data : sendData,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					var result = $.trim(data.resultMsg);
					alert(result);
					location.reload();
				}
			})
			
			location.href="professorRateDelete?c_num="+c_num+"&stu_id="+stu_id;
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

				<!-- 교수 평가 상세  -->
				 <div class="row content-panel" style="margin-top: 70px;">
          <!--     <div class="col-md-4 profile-text mt mb centered">   나중에 포트폴리오용
                <div class="right-divider hidden-sm hidden-xs">
              /col-md-4
                <div class="img-circle">
                  <p><img src="img/k_prof.png" height="150px;" width="150px;"></p>
                </div>
              /col-md-4
                </div>
              </div> -->
              <!-- /col-md-4 -->
              <div class="col-md-4 profile-text" style="margin-left: 250px;">
                <h1 style="width: 1000px">${cInfo.name } &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;평점 : ${cInfo.prof_rates}</h1>
                &emsp;&emsp;<h4 style="width: 1000px">- 수업명 : ${cInfo.c_name}</h4>
                <br>
              </div>
            </div>
				
				<!-- 학생들이 썼던 내용들 조회  -->
				<div style="margin-top: 50px">&nbsp;</div>
				<c:forEach var="list" items="${profRateContList}" varStatus="status"> 
						<div class="center2" style="width: 900px; margin: auto;">
							<table class="table table-striped table-advance table-hover">
								<tr>
									<td width="800px;" style="text-align: right; background-color: #808000;">
									<font color="white"> <i class="fa fa-book">&nbsp;</i>${list.prof_rate_num}&nbsp;
									 <i class="fa fa-user"></i>&nbsp;작성자&ensp; 익명<p>
									<i class="fa fa-star-half-o"></i>&nbsp;평점&ensp;<strong>${list.prof_rates }</strong></font>
									 </td>
								</tr>
								<tr>
									<td height="100px;" width="800px;" style="background-color: white;">${list.rate_content }</td>
								</tr>
								<tr>
									<td>
										<c:if test="${sessionScope.sessionAutority == 3}">
											<button class="btn btn-round btn-danger" style="float: right; margin-right: 20px;" onclick="profRateDelete(${list.c_num}, '${list.stu_id }')">삭제</button>
										</c:if>
										<c:if test="${sessionScope.sessionId == list.stu_id}">
											<button class="btn btn-round btn-success" style="float: right; margin-right: 10px;" onclick="profRateUpdateForm(${list.c_num})">수정</button>
										</c:if>
									</td>
								</tr>
							</table>
							<div style="margin-bottom: 50px"></div>
						</div>
						<br>
				</c:forEach>
			</main>
		</section>
	</section>
</body>
<%@include file="footer.jsp"%>
</html>