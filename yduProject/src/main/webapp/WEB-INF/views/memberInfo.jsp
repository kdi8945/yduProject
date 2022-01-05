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
	function changeMem_status(obj, id, preMem_status, autority) {
		var mem_status = $(obj).val();
		var mem_statusStr = null;
		if(mem_status == 1){
			mem_statusStr = "승인완료";
		} else if(mem_status == 2){
			mem_statusStr = "승인대기";
		} else if(mem_status == 3){
			mem_statusStr = "회원탈퇴";
		}
		if(preMem_status == 2 && mem_status == 3){
			alert("회원대기 상태에선 탈퇴시킬 수 없습니다.");
			location.reload();
		} else if(preMem_status == 3 && mem_status == 2){
			alert("회원탈퇴 상태에선 승인대기로 변경할 수 없습니다.");
			location.reload();
		} else if(preMem_status == 1 && mem_status == 2){
			alert("승인완료 상태에선 승인대기로 변경할 수 없습니다.");
			location.reload();
		} else {
			var sendData = "id="+id+"&mem_status="+mem_status+"&preMem_status="+preMem_status+"&autority="+autority;
			if(preMem_status == 1 && autority == 1 && confirm("수강신청 이력이 취소되고, 수강중인 과정이 포기처리됩니다. 변경하시겠습니까?")==true){
				cmsRun(sendData);
			} else if(preMem_status == 1 && autority == 2 && confirm("수업개설한 과정이 취소되며, 학생정보가 삭제됩니다. 변경하시겠습니까?")==true){
				cmsRun(sendData);
			} else if(confirm("["+id+"] 님의 상태를 ["+mem_statusStr+"] 상태로 변경하시겠습니까?")){
				cmsRun(sendData);
			} else {
				location.reload();
			}
		}
	}
	function cmsRun(sendData) {
		$.ajax({
			url : "changeMemstatus",
			data : sendData,
			dataType : 'json',
			success : function(data) {
				alert(data.resultMsg);
				location.reload();
			}
		})
	}
	function changeAutority(obj, id, preAutority) {
		var autority = $(obj).val();
		var autorityStr = null;
		if(autority == 1){
			autorityStr = "학생";
		} else if(autority == 2){
			autorityStr = "교수";
		} else if(autority == 3){
			autorityStr = "관리자";
		}
		if(confirm("["+id+"] 님의 권한을 ["+autorityStr+"] 권한으로 변경하시겠습니까?")==true){
			var sendData = "id="+id+"&autority="+autority+"&preAutority="+preAutority;
			$.ajax({
				url : "changeAutority",
				data : sendData,
				dataType : 'json',
				success : function(data) {
					alert(data.resultMsg);
					location.reload();
				}
			})
		}
	}
	function searchMember(obj) {
		if(window.event.keyCode == 13){
			if(!$(obj).val()){
				location.reload();
			} else{
				var sendData = "keyword="+$(obj).val();
				$.ajax({
					url : "searchMember",
					data : sendData,
					dataType : 'json',
					success : function(data) {
						var htmls = '';
						if($.isEmptyObject(data)){
							htmls += '<h2 style="text-align : center; color: #4B89DC;" >';
							htmls += '<strong>'+$(obj).val()+'에 대한 검색결과가 없습니다.</strong>';
							htmls += '</h2>';
						} else {
							htmls += '<table class="table table-hover">';
							htmls += '<thead>';
							htmls += '<tr>';
							htmls += '<th style="text-align: center; width: 100px">아이디</th>';
							htmls += '<th style="text-align: center; width: 80px">이름</th>';
							htmls += '<th style="text-align: center; width: 100px">YDU 번호</th>';
							htmls += '<th style="text-align: center; width: 60px">회원권한</th>';
							htmls += '<th style="text-align: center; width: 60px">회원상태</th>';
							htmls += '</tr>';
							htmls += '</thead>';
							htmls += '<tbody id = "afterSelect">';
							$.each(data, function(idx, items) {
								htmls += '<tr>';
								htmls += '<td style="text-align: center;">';
								if(items.autority != 3){
									htmls += '<a href="#" onclick="preViewChk('+items.mem_status+',&quot;'+items.id+'&quot;,'+items.autority+')">'+items.id+'</a>';
								}
								if(items.autority == 3){
									htmls += items.id;
								}
								htmls += '</td>';
								htmls += '<td style="text-align: center;">'+items.name+'</td>';
								htmls += '<td style="text-align: center;">'+items.yducode+'</td>';
								htmls += '<td style="text-align: center;">';
								htmls += '<select onchange="changeAutority(this, &quot;'+items.id+'&quot;, '+items.autority+')">';
								htmls += '<option style="text-align: center;" value="1"';
								if(items.autority == 1){
									htmls += 'selected';
								}
								htmls += '>학생</option>';
								htmls += '<option style="text-align: center;" value="2"';
								if(items.autority == 2){
									htmls += 'selected';
								}
								htmls += '>교수</option>';
								htmls += '<option style="text-align: center;" value="3"';
								if(items.autority == 3){
									htmls += 'selected';
								}
								htmls += '>관리자</option>';
								htmls += '</select>';
								htmls += '</td>';
								htmls += '<td style="text-align: center;">';
								htmls += '<select onchange="changeMem_status(this, &quot;'+items.id+'&quot;, '+items.mem_status+', '+items.autority+')">';
								htmls += '<option style="text-align: center;" value="1"';
								if(items.mem_status == 1){
									htmls += 'selected';
								}
								htmls += '>승인완료</option>';
								htmls += '<option style="text-align: center;" value="2"';
								if(items.mem_status == 2){
									htmls += 'selected';
								}
								htmls += '>승인대기</option>';
								htmls += '<option style="text-align: center;" value="3"';
								if(items.mem_status == 3){
									htmls += 'selected';
								}
								htmls += '>회원탈퇴</option>';
								htmls += '</select>';
								htmls += '</td>';
								htmls += '</tr>';
							})
							htmls += '</tbody>';
							htmls += '</table>';
						}
						$('#afterSearch').html(htmls);
						$('#pageNav').html('');
					}
				})
			}
		}
	}
	function selectView(obj) {
		var option = $(obj).val();
		var select = option.split(",");
		if(select[0] == 'none'){
			location.href="memberInfo";
		} else {
			if(select[0] == 'autority'){
				var sendData = "autority="+select[1];
			} else if(select[0] == 'memStatus'){
				var sendData = "mem_status="+select[1];
			}
			$.ajax({
				url : "selectView",
				data : sendData,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					var htmls = '';
					if($.isEmptyObject(data)){
						htmls += '<h2 style="text-align : center; color: #4B89DC;" >';
						htmls += '<strong>해당하는 회원이 없습니다.</strong>';
						htmls += '</h2>';
						$('#afterSearch').html(htmls);
						$('#pageNav').html('');
					} else{
						
						$.each(data, function(idx, items) {
							htmls += '<tr>';
							htmls += '<td style="text-align: center;">';
							if(items.autority !=3){
								htmls += '<a href="#" onclick="preViewChk('+items.mem_status+',&quot;'+items.id+'&quot;, '+items.autority+')">'+items.id+'</a>';
							} else if(items.autority == 3){
								htmls += items.id;
							}
							htmls += '</td>';
							htmls += '<td style="text-align: center;">'+items.name+'</td>';
							htmls += '<td style="text-align: center;">'+items.yducode+'</td>';
							htmls += '<td style="text-align: center;">';
							htmls += '<select onchange="changeAutority(this, &quot;'+items.id+'&quot;, '+items.autority+')">';
							htmls += '<option style="text-align: center;" value="1"';
							if(items.autority == 1){
								htmls += 'selected';
							}
							htmls += '>학생</option>';
							htmls += '<option style="text-align: center;" value="2"';
							if(items.autority == 2){
								htmls += 'selected';
							}
							htmls += '>교수</option>';
							htmls += '<option style="text-align: center;" value="3"';
							if(items.autority == 3){
								htmls += 'selected';
							}
							htmls += '>관리자</option>';
							htmls += '</select>';
							htmls += '</td>';
							htmls += '<td style="text-align: center;">';
							htmls += '<select onchange="changeMem_status(this, &quot;'+items.id+'&quot;, '+items.mem_status+', '+items.autority+')">';
							htmls += '<option style="text-align: center;" value="1"';
							if(items.mem_status == 1){
								htmls += 'selected';
							}
							htmls += '>승인완료</option>';
							htmls += '<option style="text-align: center;" value="2"';
							if(items.mem_status == 2){
								htmls += 'selected';
							}
							htmls += '>승인대기</option>';
							htmls += '<option style="text-align: center;" value="3"';
							if(items.mem_status == 3){
								htmls += 'selected';
							}
							htmls += '>회원탈퇴</option>';
							htmls += '</select>';
							htmls += '</td>';
							htmls += '</tr>';
						})
						$('#afterSelect').html(htmls);
						$('#pageNav').html('');
					}
				}
			})
		}
	}
	function preViewChk(mem_status, id, autority) {
		if(mem_status == 2){
			alert("승인대기 회원입니다.");
		} else{
			if(autority == 1){
				if(mem_status == 1){ // 승인된 학생
					location.href="studentInfo?id="+id;
				} else if(mem_status == 3){ // 탈퇴한 학생
					location.href="widrawStudent?id="+id;
				}
			} else if(autority == 2){
				if(mem_status == 1){ // 승인된 교수
					location.href="professorInfo?id="+id;
				} else if(mem_status == 3){ // 탈퇴한 교수
					location.href="widrawProfessor?id="+id;
				}
			}
		}
	}
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
								<select onchange="selectView(this)">
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
								<input type="text" class="form-control " placeholder="Search Member" id="searchMember" onkeyup="searchMember(this)">
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
								<tbody id = "afterSelect">
									<c:forEach var="memberInfoList" items="${memberInfoList}">
										<tr>
											<td style="text-align: center;">
												<c:if test="${memberInfoList.autority != 3}">
													<a href="#" onclick="preViewChk(${memberInfoList.mem_status},'${memberInfoList.id }', ${memberInfoList.autority})">${memberInfoList.id}</a>
												</c:if>
												<c:if test="${memberInfoList.autority == 3}">
													${memberInfoList.id}
												</c:if>
											</td>
											<td style="text-align: center;">${memberInfoList.name}</td>
											<td style="text-align: center;">${memberInfoList.yducode}</td>
											<td style="text-align: center;">
											<%-- 권한변경할때 학생은 수강신청정보, 교수는 수업개설정보 파악하고 있으면 막아야됨(메세지출력) --%>
											<%-- ydu번호에 따라 권한변경 if confirm으로 ~인데 변경하겠냐는 메세지 출력 --%>
												<select onchange="changeAutority(this, '${memberInfoList.id}', ${memberInfoList.autority})">
													<option style="text-align: center;" value="1"
														<c:if test="${memberInfoList.autority == 1}">selected</c:if>>학생</option>
													<option style="text-align: center;" value="2"
														<c:if test="${memberInfoList.autority == 2}">selected</c:if>>교수</option>
													<option style="text-align: center;" value="3"
														<c:if test="${memberInfoList.autority == 3}">selected</c:if>>관리자</option>
												</select>
											</td>
											<td style="text-align: center;">
												<select onchange="changeMem_status(this, '${memberInfoList.id}', ${memberInfoList.mem_status}, ${memberInfoList.autority})">
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
					<div style="text-align: center; margin: 100px;" >
						<h3>가입한 회원이 없습니다.</h3>
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