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
<title>YDU 회원 목록 조회</title>
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
 --><script src="lib/common-scripts.js"></script>
<script type="text/javascript">
	
</script>
</head>
<%@include file="header.jsp"%>
<%@include file="adminSide.jsp"%>
<body>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">
				<div class="col-md-12 mt">
				<c:if test="${total > 0 }">
					<div class="content-panel">
						<div>
							<h4><i class="fa fa-angle-right"></i>&nbsp;회원 목록</h4>
							<span style="margin-left: 10px">
								<select>
									<option value="none,0">전체보기</option>
									<optgroup label="회원권한">
										<option value="autority,1">학생</option>
										<option value="autority,2">교수</option>
										<option value="autority,3">관리자</option>
									</optgroup>
									<optgroup label="회원상태">
										<option value="memStatus,1">승인</option>
										<option value="memStatus,2">승인대기</option>
										<option value="memStatus,3">회원탈퇴</option>
									</optgroup>
								</select>
							</span>
							<span class="input-append" style="width: 200px; float: right; margin-right: 10px">
								<input type="text" class="form-control " placeholder="Search Member" id="searchMember" onkeyup="searchMember()">
							</span>
						</div>
						<hr>
						<div id="afterSearch">
							<table class="table table-hover">
								<thead>
									<tr>
										<th style="text-align: center; width: 100px">아이디</th>
										<th style="text-align: center; width: 80px">이름</th>
										<th style="text-align: center; width: 100px">YDU 번호</th>
										<th style="text-align: center; width: 60px">회원권한</th>
										<th style="text-align: center; width: 60px">회원상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="memberInfoList" items="${memberInfoList}">
										<tr>
										<%-- id 클릭할때 조건검사로 권한에 따라서 학생이면 수강목록, 교수면 강의목록 띄워야됨, 거기서 상태변경 --%>
											<td style="text-align: center;">${memberInfoList.id}</td>
											<td style="text-align: center;">${memberInfoList.name}</td>
											<td style="text-align: center;">${memberInfoList.yducode}</td>
											<td style="text-align: center;">
											<%-- 권한변경할때 학생은 수강신청정보, 교수는 수업개설정보 파악하고 있으면 막아야됨(메세지출력) --%>
											<%-- ydu번호에 따라 권한변경 if confirm으로 ~인데 변경하겠냐는 메세지 출력 --%>
												<select>
													<option style="text-align: center;" value="1"
														<c:if test="${memberInfoList.autority == 1}">selected</c:if>>학생</option>
													<option style="text-align: center;" value="2"
														<c:if test="${memberInfoList.autority == 2}">selected</c:if>>교수</option>
													<option style="text-align: center;" value="3"
														<c:if test="${memberInfoList.autority == 3}">selected</c:if>>관리자</option>
												</select>
											</td>
											<td style="text-align: center;">
												<select>
													<option style="text-align: center;" value="1"
														<c:if test="${memberInfoList.mem_status == 1}">selected</c:if>>승인완료</option>
													<option style="text-align: center;" value="2"
														<c:if test="${memberInfoList.mem_status == 2}">selected</c:if>>승인대기</option>
													<option style="text-align: center;" value="3"
														<c:if test="${memberInfoList.mem_status == 3}">selected</c:if>>회원탈퇴</option>
												</select>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<nav aria-label="Page navigation example" style="margin-left: 520px ;" id="pageNav">
							<ul class="pagination justify-content-center mt-5">
							<!-- 이전 페이지 -->
								<c:if test="${page.currentPage > 1 }">
									<li class="page-item">
										<a class="pagenav_a page-link" href="memberInfo?currentPage=${page.currentPage - 1}" aria-label="Previous">
											&lt;
										</a>
									</li>
								</c:if>
								<!-- 페이지 목록 -->
								<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
									<li class="page-item">
										<a class="pagenav_a page-link" href="memberInfo?currentPage=${i }">
											${i }
										</a>
									</li>
								</c:forEach>
								<!-- 다음 페이지 -->
								<c:choose>
									<c:when test="${page.currentPage < page.totalPage }">
										<li class="page-item">
											<a class="pagenav_a page-link" href="memberInfo?currentPage=${page.currentPage + 1}" aria-label="Previous">
												&gt;
											</a>
										</li>
									</c:when>
									<c:otherwise>
									<li class="page-item" style="visibility: hidden;">
										<a class="pagenav_a page-link" href="memberInfo?currentPage=${page.currentPage + 1}" aria-label="Previous">
											&gt;
										</a>
									</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
				</c:if>
				<c:if test="${total == 0 }">
					<div style="text-align: center; margin: 100px" >
						<h3>해당 수업이 없습니다.</h3>
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