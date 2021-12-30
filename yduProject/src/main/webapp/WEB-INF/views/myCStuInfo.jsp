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
<title>${sessionScope.sessionName}출결 현황 조회</title>
<!-- Favicons -->
<link href="img/favicon.ico" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Bootstrap core CSS -->
<link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!--external css-->
<link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
<link href="lib/advanced-datatable/css/demo_page.css" rel="stylesheet" />
<link href="lib/advanced-datatable/css/demo_table.css" rel="stylesheet" />
<link rel="stylesheet" href="lib/advanced-datatable/css/DT_bootstrap.css" />
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

<!-- Custom styles for this template -->
<script src="lib/chart-master/Chart.js"></script>
<script type="text/javascript">
</script>
</head>
<%@include file="header.jsp" %>
<%@include file="stuSide.jsp"%>
<body>
<section id="container">
<!-- **********************************************************************************************************************************************************
		MAIN CONTENT
	 *********************************************************************************************************************************************************** -->
<!--main content start-->
	<section id="main-content">
		<section class="wrapper site-min-height">
			<div style="margin-top: 50px"/>
			<h2><i class="fa fa-angle-right"></i>${applyClassInfo.c_name } 출결 정보(
				<c:if test="${applyClassInfo.c_status == 2}">수업중</c:if>
				<c:if test="${applyClassInfo.c_status == 3}">종강</c:if>
				)
			</h2>
			<h4>수업 일정 : ${applyClassInfo.c_s_date} ~ ${applyClassInfo.c_e_date}</h4>
			<h4>수업 시간 : ${applyClassInfo.c_e_time }시 ~ ${applyClassInfo.c_co_time}시</h4>
			<section id="unseen">
				<c:if test="${myCStuInfoSize > 0 }">
					<div style="background-color: white; width: 500px">
						<table class="table table-bordered table-striped table-condensed" style="width: 500px; text-align: center;">
							<thead>
								<tr>
									<th class="numeric" style="text-align: center;">출석일자</th>
									<th class="numeric" style="text-align: center;">출석상태</th>
									<th class="numeric" style="text-align: center;">입실시간</th>
									<th class="numeric" style="text-align: center;">퇴실시간</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="myCStuInfo" items="${myCStuInfo}">
									<tr>
										<td class="numeric">${myCStuInfo.attendance}</td>
										<td class="numeric">
											<c:if test="${myCStuInfo.attendstatus eq 'absent' || empty myCStuInfo.attendstatus}">
												결석
											</c:if>
											<c:if test="${myCStuInfo.attendstatus eq 'lateearly'}">
												지각 및 조퇴
											</c:if>
											<c:if test="${myCStuInfo.attendstatus eq 'late'}">
												지각
											</c:if>
											<c:if test="${myCStuInfo.attendstatus eq 'early'}">
												조퇴
											</c:if>
											<c:if test="${myCStuInfo.attendstatus eq 'attend'}">
												출석
											</c:if>
										</td>
										<td class="numeric">
											<c:if test="${empty myCStuInfo.e_time}">
												-
											</c:if>
											<c:if test="${not empty myCStuInfo.e_time }">
												${myCStuInfo.ehour}:${myCStuInfo.emin}
											</c:if>
										</td>
										<td class="numeric">
											<c:if test="${empty myCStuInfo.co_time}">
												-
											</c:if>
											<c:if test="${not empty myCStuInfo.co_time }">
												${myCStuInfo.cohour}:${myCStuInfo.comin}
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:if>
				<c:if test="${myCStuInfoSize == 0 }">
					<h2 style="text-align: center;">출결정보가 없습니다.</h2>
				</c:if>
			</section>
		</section>
	</section>
		<!--main content end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
</body>
	<%@include file="footer.jsp" %> 
</html>