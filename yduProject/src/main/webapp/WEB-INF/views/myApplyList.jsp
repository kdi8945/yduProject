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
<title>YDU My 수업 목록 조회(수업개설)</title>
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
	function searchMyApplyClass(obj) {
		var searchContent = $(obj).val();
		var stu_id = "${sessionScope.sessionId}";
		if(window.event.keyCode == 13){
			if(!searchContent){
				location.href="myApplyList?stu_id="+stu_id;
			} else {
				var sendData = "searchContent="+searchContent+"&stu_id="+stu_id;
				$.ajax({
					url : "searchMyApplyClass",
					data : sendData,
					type : 'get',
					dataType : 'json',
					success : function(data) {
						var htmls = '';
						if(data.length == 0){
							htmls += '<h2 style="text-align : center; color: #4B89DC;" >';
							htmls += '<strong>'+searchContent+'에 대한 검색 결과가 없습니다.</strong>';
							htmls += '</h2>';
						} else{
							htmls += '<table class="table table-striped table-advance table-hover"';
							htmls += 'style="text-align: center;">';
							htmls += '<thead>';
							htmls += '<tr>';
							htmls += '<th style="text-align: center;"><i class="fa fa-desktop">&nbsp;</i>수업명</th>';
							htmls += '<th style="text-align: center;"><i class="fa fa-user">&nbsp;</i>교수명</th>';
							htmls += '<th style="text-align: center;"><i class="fa fa-flag">&nbsp;</i>모집기간</th>';
							htmls += '<th style="text-align: center;"><i class=" fa fa-group">&nbsp;</i>모집인원</th>';
							htmls += '<th style="text-align: center;"><i class="fa fa-calendar">&nbsp;</i>수업일정</th>';
							htmls += '<th style="text-align: center;"><i class=" fa fa-clock-o">&nbsp;</i>수업시간</th>';
							htmls += '<th style="text-align: center;"><i class=" fa fa-info-circle">&nbsp;</i>수업상태</th>';
							htmls += '</tr>';
							htmls += '</thead>';
							htmls += '<tbody>';
							$.each(data, function(idx, items) {
								htmls += '<tr>';
								htmls += '<td style="text-align: center;" width="400px">';
								htmls += '<a href="classContent?c_num='+items.c_num+'&stu_id='+stu_id+'" style="text-decoration: none">'+items.c_name+'</a>';
								htmls += '</td>';
								htmls += '<td style="text-align: center;" width="130px">'+items.name+'</td>';
								htmls += '<td style="text-align: center;" width="100px">'+items.c_re_date+'</td>';
								htmls += '<td style="text-align: center;" width="100px">'+items.s_closed+' 명</td>';
								htmls += '<td style="text-align: center; word-break:break-all;" width="200px">'+items.c_s_date+' ~ '+items.c_e_date+'</td>';
								htmls += '<td style="text-align: center; word-break:break-all;" width="100px">'+items.c_e_time+'시 ~ '+items.c_co_time+'시</td>';
								htmls += '<td style="text-align: center;" width="100px">수업개설</td>';
								htmls += '</tr>';
								
							})
							htmls += '</tbody>';
							htmls += '</table>';
						}
						$('#afterSearch').html(htmls);
						$('#pageNav').html('');
					}
				});
			}
		}
	}
</script>
</head>
<%@include file="header.jsp"%>
<%@include file="stuSide.jsp"%>
<body>
	<section id="container">
		<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section id="main-content">
			<main>
				<div style="height: 100px"></div>
				<div class="row mt">
					<div class="col-md-12">
						<c:if test="${total > 0 }">
							<div class="content-panel" style="width: 1250px; margin: 30px;">
								<h3 style="margin: 18px; color: #4B89DC;">
									<i class="fa fa-bar"></i> <strong>My 수업 목록 조회(수업개설)</strong>
									<span class="input-append" style="width: 200px; float: right;">
										<input type="text" class="form-control " placeholder="Search MyApplyClass" id="searchMyApplyClass" onkeyup="searchMyApplyClass(this)">
									</span>
								</h3>
								<hr>
								<div id="afterSearch">
									<table class="table table-striped table-advance table-hover"
										style="text-align: center;">
										<thead>
											<tr>
												<th style="text-align: center;"><i class="fa fa-desktop">&nbsp;</i>수업명</th>
												<th style="text-align: center;"><i class="fa fa-user">&nbsp;</i>교수명</th>
												<th style="text-align: center;"><i class="fa fa-flag">&nbsp;</i>모집기간</th>
												<th style="text-align: center;"><i class=" fa fa-group">&nbsp;</i>모집인원</th>
												<th style="text-align: center;"><i class="fa fa-calendar">&nbsp;</i>수업일정</th>
												<th style="text-align: center;"><i class=" fa fa-clock-o">&nbsp;</i>수업시간</th>
												<th style="text-align: center;"><i class=" fa fa-info-circle">&nbsp;</i>수업상태</th>
											</tr>
										</thead>
		
										<!-- List  -->
										<tbody>
											<c:forEach var="myApplyList" items="${myApplyList}" varStatus="status">
												<tr>
													<td style="text-align: center;" width="400px">
														<a href="classContent?c_num=${myApplyList.c_num }&stu_id=${sessionScope.sessionId }" style="text-decoration: none">${myApplyList.c_name }</a>
													</td>
													<td style="text-align: center;" width="130px">${myApplyList.name }</td>
													<td style="text-align: center;" width="100px">${myApplyList.c_re_date}</td>
													<td style="text-align: center;" width="100px">${myApplyList.s_closed} 명</td>
													<td style="text-align: center; word-break:break-all;" width="200px">${myApplyList.c_s_date} ~ ${myApplyList.c_e_date }</td>
													<td style="text-align: center; word-break:break-all;" width="100px">${myApplyList.c_e_time}시 ~ ${myApplyList.c_co_time }시</td>
													<td style="text-align: center;" width="100px">수업개설</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- 페이지 네비게이터 -->
			                  	<nav aria-label="Page navigation example" style="margin-left: 520px ;" id="pageNav">
			                    	<ul class="pagination justify-content-center mt-5">
			                    	<!-- 이전 페이지 -->
			                    		<c:if test="${page.currentPage > 1 }">
			                              <li class="page-item">
				                              <a class="pagenav_a page-link" href="myApplyList?stu_id=${sessionScope.sessionId}&currentPage=${page.currentPage - 1}" aria-label="Previous">
				                                    &lt;
				                              </a>
			                              </li>
			                     		</c:if>
			                     	<!-- 페이지 목록 -->
			                        <c:forEach var="i" begin="${page.startPage}" end="${page.endPage }">
			                           <li class="page-item">
				                          <a class="pagenav_a page-link" href="myApplyList?stu_id=${sessionScope.sessionId}&currentPage=${i }">${i }
				                          </a>
			                           </li>
			                        </c:forEach>
			                     <!-- 다음 페이지 -->
			                        <c:choose>
			                           <c:when test="${page.currentPage < page.totalPage }">
			                              <li class="page-item">
				                              <a class="pagenav_a page-link" href="myApplyList?stu_id=${sessionScope.sessionId}&currentPage=${page.currentPage + 1}" aria-label="Previous">
				                                    &gt;
				                              </a>
			                              </li>
			                           </c:when>
			                           <c:otherwise>
			                           <li class="page-item" style="visibility: hidden;"><a
			                                 class="pagenav_a page-link" href="myApplyList?stu_id=${sessionScope.sessionId}&currentPage=${page.currentPage + 1}" aria-label="Previous">
			                                    &gt;
			                              </a></li>
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
			</div>
		</main>
	</section>
	<!--main content end-->
</section>
</body>
<%@include file="footer.jsp"%>
</html>