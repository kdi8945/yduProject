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
<title>YDU 수업개설 목록 조회</title>
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
	function searchMyClass(c_status) {
		var searchContent = $('#searchMyClass').val();
		var pro_id = "${sessionScope.sessionId}";
		if(window.event.keyCode == 13){
			if(!searchContent){
				location.href="myCreateClassList?pro_id="+pro_id+"&c_status="+c_status;
			} else {
				var sendData = "searchContent="+searchContent+"&pro_id="+pro_id+"&c_status="+c_status;
				$.ajax({
					url : "searchMyClass",
					data : sendData,
					type : 'get',
					dataType : 'json',
					success : function(data) {
						var htmls = '';
						var nohtmls = '';
						if(!data[0].resultCode) {
							htmls += '<table class="table table-striped table-advance table-hover" style="text-align: center;">';
							htmls += '<thead>';
							htmls += '<tr>';
							htmls += '<th style="text-align: center;"><i class="fa fa-desktop">&nbsp;</i>수업명</th>';
							htmls += '<th style="text-align: center;"><i class="fa fa-user">&nbsp;</i>교수명</th>';
							htmls += '<th style="text-align: center;"><i class="fa fa-flag">&nbsp;</i>모집기간</th>';
							htmls += '<th style="text-align: center;"><i class=" fa fa-group">&nbsp;</i>모집인원</th>';
							htmls += '<th style="text-align: center;"><i class="fa fa-calendar">&nbsp;</i>수업일정</th>';
							htmls += '<th style="text-align: center;"><i class=" fa fa-clock-o">&nbsp;</i>수업시간</th>';
							htmls += '<th style="text-align: center;"><i class=" fa fa-info-circle">&nbsp;</i>수업상태</th>';
							htmls += '<th style="text-align: center;">&nbsp;</th>';
							htmls += '</tr>';
							htmls += '</thead>';
							htmls += '<tbody>';
							$.each(data, function(idx, searchList){
								htmls += '<tr>';
								htmls += '<td style="text-align: center;" width="400px">';
								htmls += '<a href="classContent?c_num='+searchList.c_num+'" style="text-decoration: none">'+searchList.c_name+'</a>';
								htmls += '</td>';
								htmls += '<td style="text-align: center;" width="130px">'+searchList.name+'</td>';
								htmls += '<td style="text-align: center;" width="100px">'+searchList.c_re_date+'</td>';
								htmls += '<td style="text-align: center;" width="100px">'+searchList.s_closed+' 명</td>';
								htmls += '<td style="text-align: center; word-break:break-all;" width="200px">'+searchList.c_s_date+' ~ '+searchList.c_e_date+'</td>';
								htmls += '<td style="text-align: center; word-break:break-all;" width="100px">'+searchList.c_e_time+'시 ~ '+searchList.c_co_time+'시</td>';
								htmls += '<td style="text-align: center;" width="100px">';
								if(c_status == 1){
									htmls += '수업개설';
								} else if(c_status == 4){
									htmls += '수업취소';
								}
								htmls += '</td>';
								htmls += '<td style="width: 100px">';
								if(c_status == 1){
									htmls += '<button class="btn btn-success btn-xs">';
									htmls += '<i class="fa fa-pencil-square-o" onclick="classUpdate(&quot;'+searchList.c_name+'&quot;, '+searchList.c_num+')"></i>';
									htmls += '</button>';
								}
								htmls += '<button class="btn btn-danger btn-xs">';
								htmls += '<i class="fa fa-trash-o" onclick="classDelete(&quot;'+searchList.c_name+'&quot;, '+searchList.c_num+')"></i>';
								htmls += '</button>';
								htmls += '</td>';
								htmls += '</tr>';
							})
							htmls += '</tbody>';
							htmls += '</table>';
						} else{
							var searchContent = data[0].searchContent;
							htmls += '<h2 style="text-align : center; color: #4B89DC;" >';
							htmls += '<strong>'+searchContent+'에 대한 검색 결과가 없습니다.</strong>';
							htmls += '</h2>';
						}
						$('#afterSearch').html(htmls);
						$("#pageNav").html(nohtmls);
					}
				})
			}
		}
	}
	function classUpdate(c_name, c_num) {
		if(confirm(c_name + " 과목의 수업정보를 수정하시겠습니까?") == true){
			location.href="classUpdateForm?c_num="+c_num;
		}
	}
	function classDelete(c_name, c_num) {
		if(confirm(c_name + " 과목의 수업정보를 삭제하시겠습니까?") == true){
			var sendData = "c_num="+c_num;
			$.ajax({
				url : "classDelete",
				type : 'get',
				data : sendData,
				dataType : 'text',
				success : function(data) {
					var result = $.trim(data);
					if(result == 'classDeleteOk'){
						alert("수업 정보가 삭제되었습니다.");
						location.reload();
					} else {
						alert("수업정보 삭제에 실패하였습니다.")
						location.reload();
					}
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
		<!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
		<!--main content start-->
		<section id="main-content">
			<main>
				<div style="height: 100px"></div>
				<div class="row mt">
					<c:if test="${myClassListSize > 0 }">
						<div class="col-md-12">
							<div class="content-panel" style="width: 1250px; margin: 30px;">
								<h3 style="margin: 18px; color: #4B89DC;">
									<i class="fa fa-bar"></i>
										<strong>My 수업 목록 조회(
											<c:if test="${c_status == 1 }">
												수업개설
											</c:if>
											<c:if test="${c_status == 4 }">
												수업취소
											</c:if>
										)</strong>
									<span class="input-append" style="width: 200px; float: right;">
										<input type="text" class="form-control " placeholder="Search MyClass" id="searchMyClass" onkeyup="searchMyClass(${c_status})">
								</span>
								</h3>
								<hr>
								<div id = "afterSearch">
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
												<th style="text-align: center;">&nbsp;</th>
											</tr>
										</thead>
		
										<!-- List  -->
										<tbody id="selectClassList">
											<c:forEach var="classList" items="${myClassList}" varStatus="status">
												<tr>
													<td style="text-align: center;" width="400px">
														<a href="classContent?c_num=${classList.c_num }" style="text-decoration: none">${classList.c_name }</a>
													</td>
													<td style="text-align: center;" width="130px">${classList.name }</td>
													<td style="text-align: center;" width="100px">${classList.c_re_date}</td>
													<td style="text-align: center;" width="100px">${classList.s_closed} 명</td>
													<td style="text-align: center; word-break:break-all;" width="200px">${classList.c_s_date} ~ ${classList.c_e_date }</td>
													<td style="text-align: center; word-break:break-all;" width="100px">${classList.c_e_time}시 ~ ${classList.c_co_time }시</td>
													<td style="text-align: center;" width="100px">
														<c:if test="${c_status == 1}">
															수업개설
														</c:if>
														<c:if test="${c_status == 4}">
															수업취소
														</c:if>
													</td>
													<td style="width: 100px">
														<!-- 수정하기 버튼 -->
														<c:if test="${c_status == 1 }">
															<button class="btn btn-success btn-xs">
																<i class="fa fa-pencil-square-o" onclick="classUpdate('${classList.c_name }', ${classList.c_num})"></i>
															</button>
														</c:if>
														<!-- 삭제하기  버튼-->
														<button class="btn btn-danger btn-xs">
															<i class="fa fa-trash-o" onclick="classDelete('${classList.c_name }', ${classList.c_num})"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- 작성하기  버튼 -->
								<div>
									<button class="btn btn-info" style="width: 50x; margin: 22px;">
										<a href="createClassForm" style="color: white;">수업 개설하기</a>
									</button>
								</div>	
								<!-- 페이지 네비게이터 -->
			                  	<nav aria-label="Page navigation example" style="margin-left: 520px ;" id="pageNav">
			                    	<ul class="pagination justify-content-center mt-5">
			                    	<!-- 이전 페이지 -->
			                    		<c:if test="${page.currentPage > 1 }">
			                              <li class="page-item">
				                              <a class="pagenav_a page-link" href="myCreateClassList?pro_id=${sessionScope.sessionId}&currentPage=${page.currentPage - 1}" aria-label="Previous">
				                                    &lt;
				                              </a>
			                              </li>
			                     		</c:if>
			                     	<!-- 페이지 목록 -->
			                        <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
			                           <li class="page-item">
				                          <a class="pagenav_a page-link" href="myCreateClassList?pro_id=${sessionScope.sessionId}&currentPage=${i }">${i }
				                          </a>
			                           </li>
			                        </c:forEach>
			                     <!-- 다음 페이지 -->
			                        <c:choose>
			                           <c:when test="${page.currentPage < page.totalPage }">
			                              <li class="page-item">
				                              <a class="pagenav_a page-link" href="myCreateClassList?pro_id=${sessionScope.sessionId}&currentPage=${page.currentPage + 1}" aria-label="Previous">
				                                    &gt;
				                              </a>
			                              </li>
			                           </c:when>
			                           <c:otherwise>
			                           <li class="page-item" style="visibility: hidden;"><a
			                                 class="pagenav_a page-link" href="myCreateClassList?pro_id=${sessionScope.sessionId}&currentPage=${page.currentPage + 1}" aria-label="Previous">
			                                    &gt;
			                              </a></li>
										</c:otherwise>
									</c:choose>
								</ul>
							</nav>
						</div>
					</div>
				</c:if>
				<c:if test="${myClassListSize == 0}">
					<div style="text-align: center; margin: 100px" >
						<h3 style="margin-left: 100px">해당 수업이 없습니다.</h3>
					</div>
				</c:if>
			</div>
		</main>
	</section>
	<!--main content end-->
</section>
</body>
<%@include file="footer.jsp"%>
</html>