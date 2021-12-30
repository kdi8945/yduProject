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
<title>${preClassInfo.c_name }과목 학생 정보</title>
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
	function fnSelect(obj) {
		console.log($(obj).val());
		var c_status = ${preClassInfo.c_status};
		var pro_id = "${sessionScope.sessionId}";
		console.log(c_status);
		location.href="profCInfo?pro_id="+pro_id+"&c_status="+c_status+"&c_num="+$(obj).val();
	}
	function maxLengthCheck(object) {
		if(object.value.length > object.maxLength){
			object.value = object.value.slice(0,object.maxLength);
		}
	}
	function fScoreUpdateCancel() {
		if(confirm("기말고사 점수 입력을 취소하시겠습니까?")==true)
			location.reload();
	}
	/*  */
	function fScoreUpdateForm(c_i_num) {
		console.log(c_i_num);
		var htmlForm = "";
			htmlForm += '<input class="form-control" style="width: 100%" required="required" type="number"  min="0" max="40" maxlength="2" oninput="maxLengthCheck(this)" name="f_score" id="f_score'+c_i_num+'"/>';
			htmlForm += '<p></p>';
			htmlForm += '<button class="btn btn-success btn-xs">';
			htmlForm += '<i class="fa fa-pencil-square-o" onclick="fScoreUpdate('+c_i_num+')"></i>';
			htmlForm += '</button>';
			htmlForm += '<button class="btn btn-danger btn-xs">';
			htmlForm += '<i class="fa fa-trash-o " onclick="fScoreUpdateCancel()"></i>';
			htmlForm += '</button>';
		
		$('#fScoreUpdateForm'+c_i_num).html(htmlForm);
	}
	function fScoreUpdate(c_i_num) {
		var f_score = $('#f_score'+c_i_num).val();
		if(!f_score){
			alert("기말고사 점수를 입력해주세요");
		} else if(f_score > 40){
			alert("40점 이상 줄 수 없습니다.");
		} else{
			var sendData = "c_i_num="+c_i_num+"&f_score="+f_score+"&updateChk=f";
			$.ajax({
				url : "scoreUpdate",
				data : sendData,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					var resultMsg = $.trim(data.updateChk);
					alert(resultMsg);
					location.reload();
				}
			})
		}
	}
	
	
	
	/*  */
	function mScoreUpdateCancel() {
		if(confirm("중간고사 점수 입력을 취소하시겠습니까?")==true)
			location.reload();
	}
	function mScoreUpdateForm(c_i_num) {
		console.log(c_i_num);
		var htmlForm = "";
			htmlForm += '<input class="form-control" style="width: 100%" required="required" type="number"  min="0" max="40" maxlength="2" oninput="maxLengthCheck(this)" name="m_score" id="m_score'+c_i_num+'"/>';
			htmlForm += '<p></p>';
			htmlForm += '<button class="btn btn-success btn-xs">';
			htmlForm += '<i class="fa fa-pencil-square-o" onclick="mScoreUpdate('+c_i_num+')"></i>';
			htmlForm += '</button>';
			htmlForm += '<button class="btn btn-danger btn-xs">';
			htmlForm += '<i class="fa fa-trash-o " onclick="mScoreUpdateCancel()"></i>';
			htmlForm += '</button>';
		
		$('#mScoreUpdateForm'+c_i_num).html(htmlForm);
	}
	function mScoreUpdate(c_i_num) {
		var m_score = $('#m_score'+c_i_num).val();
		if(!m_score){
			alert("중간고사 점수를 입력해주세요");
		} else if(m_score > 40){
			alert("40점 이상 줄 수 없습니다.");
		} else{
			var sendData = "c_i_num="+c_i_num+"&m_score="+m_score+"&updateChk=m";
			$.ajax({
				url : "scoreUpdate",
				data : sendData,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					var resultMsg = $.trim(data.updateChk);
					alert(resultMsg);
					location.reload();
				}
			})
		}
	}
</script>
</head>
<%@include file="header.jsp" %>
<%@include file="profSide.jsp"%>
<body>
<section id="container">
<!-- **********************************************************************************************************************************************************
		MAIN CONTENT
	 *********************************************************************************************************************************************************** -->
<!--main content start-->
	<section id="main-content">
		<section class="wrapper site-min-height">
			<c:if test="${cNums.c_num > 0}">
				<h3><i class="fa fa-angle-right"></i><a href="classContent?c_num=${preClassInfo.c_num }">${preClassInfo.c_name } 과목 학생 정보</a></h3>
				<div class="row mb">
				<!-- page start-->
					<div class="content-panel">
						<div class="adv-table">
							<select onchange="fnSelect(this)">
								<option>과목선택</option>
								<c:forEach var="myClassInfoList" items="${myClassInfoList}">
									<option value="${myClassInfoList.c_num }">${myClassInfoList.c_name }</option>
								</c:forEach>
							</select>
							<table cellpadding="0" cellspacing="0" border="0" class="display table table-bordered" id="hidden-table-info">
								<thead>
									<tr>
										<th style="text-align: center;">학생명</th>
										<th style="text-align: center;">중간고사점수</th>
										<th style="text-align: center;">기말고사점수</th>
										<th style="text-align: center;">출석점수</th>
										<th style="text-align: center;">출석율 (출석일 / 수업일)</th>
										<th style="text-align: center;">학점</th>
										<th style="text-align: center;">학생상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="classInfo" items="${classInfo}">
										<c:if test="${classInfo.a_status == 2 || classInfo.a_status == 3 }">
											<tr
											   <c:if test="${classInfo.a_status == 3}">class="gradeX"</c:if>
											   <c:if test="${classInfo.a_status == 2}">class="gradeA"</c:if>
											   >
												<td style="text-align: center;">${classInfo.name }</td>
												<td style="text-align: center;">
													<c:if test="${classInfo.a_status ==2}">
														<div id="mScoreUpdateForm${classInfo.c_i_num }">
															${classInfo.m_score }점
															<span>
																<button class="btn btn-success btn-xs">
																	<i class="fa fa-pencil-square-o" onclick="mScoreUpdateForm(${classInfo.c_i_num})"></i>
																</button>
															</span>
														</div>
													</c:if>
													<c:if test="${classInfo.a_status ==3}">
														${classInfo.m_score }점
													</c:if>
												</td>
												<td style="text-align: center;">
													<c:if test="${classInfo.a_status ==2}">
														<div id="fScoreUpdateForm${classInfo.c_i_num }">
															${classInfo.f_score }점
															<span>
																<button class="btn btn-success btn-xs">
																	<i class="fa fa-pencil-square-o" onclick="fScoreUpdateForm(${classInfo.c_i_num})"></i>
																</button>
															</span>
														</div>
													</c:if>
													<c:if test="${classInfo.a_status ==3}">
														${classInfo.f_score }점
													</c:if>
												</td>
												<td style="text-align: center;">${classInfo.a_score }점</td>
												<td style="text-align: center;">${classInfo.attendPercent }% (${classInfo.attendClassDay}일 / ${classInfo.totalClassDay}일)</td>
												<td style="text-align: center;">${classInfo.grade }</td>
												<td style="text-align: center;">
													<c:if test="${classInfo.a_status == 2 }">
														<c:if test="${preClassInfo.c_status == 2}">
															참여중
														</c:if>
														<c:if test="${preClassInfo.c_status == 3 && classInfo.grade != 'F'}">
															이수
														</c:if>
														<c:if test="${preClassInfo.c_status == 3 && classInfo.grade == 'F'}">
															미이수
														</c:if>
													</c:if>
													<c:if test="${classInfo.a_status ==3 }">
														수강포기
													</c:if>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
							<nav aria-label="Page navigation example" style="margin-left: 610px ;" id="pageNav">
		                    	<ul class="pagination justify-content-center mt-5">
		                    	<!-- 이전 페이지 -->
		                    		<c:if test="${cNums.high_c_num > 0}">
		                              <li class="page-item">
			                              <a class="pagenav_a page-link" href="profCInfo?pro_id=${sessionScope.sessionId}&c_status=${preClassInfo.c_status }&c_num=${cNums.high_c_num}" aria-label="Previous">
			                                    &lt;
			                              </a>
		                              </li>
		                     		</c:if>
		                     <!-- 다음 페이지 -->
		                           <c:if test="${cNums.low_c_num > 0 }">
		                              <li class="page-item">
			                              <a class="pagenav_a page-link" href="profCInfo?pro_id=${sessionScope.sessionId}&c_status=${preClassInfo.c_status }&c_num=${cNums.low_c_num}" aria-label="Previous">
			                                    &gt;
			                              </a>
		                              </li>
		                           </c:if>
							</ul>
						</nav>
						
						</div>
					</div>
					<!-- page end-->
					</div>
				</c:if>
				<c:if test="${cNums.c_num == 0}">
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