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
<title>탈퇴 교수 정보 조회</title>
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
<script src="lib/common-scripts.js"></script>
<script type="text/javascript">
	function memberInfo() {
		location.href="memberInfo";
	}
</script>
</head>
<%@include file="header.jsp"%>
<%@include file="adminSide.jsp"%>
<body>
	<section id="container">
		<section id="main-content">
			<section class="wrapper">
				<div class="col-md-12 mt">
				<c:if test="${total > 0 }">
					<div class="content-panel">
						<div>
							<h4><i class="fa fa-angle-right"></i>&nbsp;'${id}'회원 정보 조회(탈퇴회원/교수)</h4>
						</div>
						<hr>
						<table class="table table-hover">
							<thead>
								<tr>
									<th style="text-align: center; width: 80px">수업번호</th>
									<th style="text-align: center; width: 150px">수업명</th>
									<th style="text-align: center; width: 150px">수업일정</th>
									<th style="text-align: center; width: 100px">수업시간</th>
									<th style="text-align: center; width: 80px">수업상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="widrawProfessorInfo" items="${widrawProfessorInfo}">
									<tr>
										<td style="text-align: center;">${widrawProfessorInfo.c_num}</td>
										<td style="text-align: center;"><a href="classContent?c_num=${widrawProfessorInfo.c_num}">${widrawProfessorInfo.c_name}</a></td>
										<td style="text-align: center;">${widrawProfessorInfo.c_s_date} ~ ${widrawProfessorInfo.c_e_date}</td>
										<td style="text-align: center;">${widrawProfessorInfo.c_e_time}시 ~ ${widrawProfessorInfo.c_co_time}시</td>
										<td style="text-align: center;">
											<c:if test="${widrawProfessorInfo.c_status == 1}">
												수업개설
											</c:if>
											<c:if test="${widrawProfessorInfo.c_status == 2}">
												수업중
											</c:if>
											<c:if test="${widrawProfessorInfo.c_status == 3}">
												수업종료
											</c:if>
											<c:if test="${widrawProfessorInfo.c_status == 4}">
												수업취소
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div style="text-align: center; text-decoration: none; margin: 30px">
							<a href="#" onclick="memberInfo()">목록으로</a>
						</div>
					</div>
				</c:if>
				<c:if test="${total == 0 }">
					<div style="text-align: center; margin: 100px" >
						<h3>해당 정보가 없습니다.</h3>
					</div>
				</c:if>
				</div>
			</section>				
		</section>
	<!--main content end-->
	</section>
</body>
<%@include file="footer.jsp"%>
</html>