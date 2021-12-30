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
<title>${sessionScope.sessionName }학생 정보</title>
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
			<c:if test="${myApplyClassSize > 0}">
				<h3><i class="fa fa-angle-right"></i>
					수강 정보 조회(
					<c:if test="${myAstatus == 3 }">수강포기</c:if>
					<c:if test="${myAstatus == 2 }">참여중</c:if>
					)
					
				
				
				</h3>
				<div class="row mb">
				<!-- page start-->
					<div class="content-panel">
						<div class="adv-table">
							<table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
								<thead>
									<tr>
										<th style="text-align: center;">과목명</th>
										<th style="text-align: center;">교수명</th>
										<th style="text-align: center;">중간고사점수</th>
										<th style="text-align: center;">기말고사점수</th>
										<th style="text-align: center;">출석점수</th>
										<th style="text-align: center;">출석율 (출석일 / 수업일)</th>
										<th style="text-align: center;">학점</th>
										<th style="text-align: center;">수업상태</th>
										<th style="text-align: center;">참여상태</th>
										<th style="text-align: center;">교수평가</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="myApplyClassList" items="${myApplyClassList}">
										<c:if test="${myApplyClassList.c_status == 2 || myApplyClassList.c_status == 3 }">
											<tr
											   <c:if test="${myApplyClassList.a_status == 3}">class="gradeX"</c:if>
											   <c:if test="${myApplyClassList.a_status == 2}">class="gradeA"</c:if>
											   >
												<td style="text-align: center;"><a href="classContent?c_num=${myApplyClassList.c_num }&stu_id=${sessionScope.sessionId }">${myApplyClassList.c_name }</a></td>
												<td style="text-align: center;">${myApplyClassList.name }</td>
												<td style="text-align: center;">${myApplyClassList.m_score }점</td>
												<td style="text-align: center;">${myApplyClassList.f_score }점</td>
												<td style="text-align: center;">${myApplyClassList.a_score }점</td>
												<td style="text-align: center;"><a href="myCStuInfo?stu_id=${sessionScope.sessionId}&c_num=${myApplyClassList.c_num}">${myApplyClassList.attendPercent }% (${myApplyClassList.attendClassDay}일 / ${myApplyClassList.totalClassDay}일)</a></td>
												<td style="text-align: center;">${myApplyClassList.grade }</td>
												<td style="text-align: center;">
													<c:if test="${myApplyClassList.c_status == 2 }">
													수업중
													</c:if>
													<c:if test="${myApplyClassList.c_status == 3 }">
													수업종료
													</c:if>
												</td>
												<td style="text-align: center;">
													<c:if test="${myApplyClassList.a_status == 2 }">
														<c:if test="${myApplyClassList.c_status == 2}">
														참여중
														</c:if>
														<c:if test="${myApplyClassList.c_status == 3 && myApplyClassList.grade != 'F'}">
														이수
														</c:if>
														<c:if test="${myApplyClassList.c_status == 3 && myApplyClassList.grade == 'F'}">
														미이수
														</c:if>
													</c:if>
													<c:if test="${myApplyClassList.a_status == 3 }">
													수강포기
													</c:if>
												</td>
												<td style="text-align: center;">
													<c:if test="${myApplyClassList.c_status == 3}">
														<c:if test="${myApplyClassList.rateChk == 0 }">
															<a href="professorRateForm?c_num=${myApplyClassList.c_num }">[평가하기]</a>
														</c:if>
														<c:if test="${myApplyClassList.rateChk > 0 }">
															<a href="professorRateUpdateForm?c_num=${myApplyClassList.c_num }&stu_id=${sessionScope.sessionId}">[수정하기]</a>
														</c:if>
													</c:if>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- page end-->
				</div>
			</c:if>
			<c:if test="${myApplyClassSize == 0}">
				<div style="text-align: center; margin: 100px" >
					<h3 style="margin-left: 100px">해당 수업이 없습니다.</h3>
				</div>
			</c:if>
		</section>
	</section>
		<!--main content end-->
</section>
<!-- js placed at the end of the document so the pages load faster -->
</body>
	<%@include file="footer.jsp" %> 
</html>