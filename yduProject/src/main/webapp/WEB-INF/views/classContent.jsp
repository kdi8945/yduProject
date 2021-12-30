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
<title>YDU 수업 상세정보조회</title>
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
	function profRateUpdate() {
		var c_num = ${classContent.c_num};
		var stu_id = "${sessionScope.sessionId}";
		location.href="professorRateUpdateForm?c_num="+c_num+"&stu_id="+stu_id;
	}
	function profRate() {
		var c_num = ${classContent.c_num};
		location.href="professorRateForm?c_num="+c_num;
	}	
	$(function() {
		$('#studentRate').on("click", function() {
			var c_status = ${classContent.c_status};
			var c_num = ${classContent.c_num};
			var pro_id = "${sessionScope.sessionId}";
			location.href="profCInfo?pro_id="+pro_id+"&c_status="+c_status+"&c_num="+c_num;
		})
	})
	$(function() {
		$('#coTimeClick').on("click", function() {
			var today = new Date();
			var hour = today.getHours();
			var min = today.getMinutes();
			if(min < 10){
				min = "0"+min;
			}
			var stu_id = "${sessionScope.sessionId}";
			var c_num = ${classContent.c_num};
			if(confirm("현재시간은 "+hour+"시 "+min+"분 입니다. 퇴실체크를 하시겠습니까?")==true){
				var sendData = "hour="+hour+"&min="+min+"&stu_id="+stu_id+"&c_num="+c_num;
				$.ajax({
					url : "checkOutTime",
					data : sendData,
					type : 'get',
					dataType : 'json',
					success : function(data) {
						var resultMsg = $.trim(data.resultMsg);
						if(confirm(resultMsg+" 수업 목록 조회페이지로 돌아가시겠습니까?")==true){
							location.href="classList";
						} else{
							location.reload();
						}
					}
				})
			}
		})
	})
	$(function() {
		$('#eTimeClick').on("click", function() {
			var today = new Date();
			var hour = today.getHours();
			var min = today.getMinutes();
			if(min < 10){
				min = "0"+min;
			}
			var stu_id = "${sessionScope.sessionId}";
			var c_num = ${classContent.c_num};
			console.log(hour+"시 "+min+"분");
			if(confirm("현재시간은 "+hour+"시 "+min+"분 입니다. 입실체크를 하시겠습니까?")==true){
				var sendData = "hour="+hour+"&min="+min+"&stu_id="+stu_id+"&c_num="+c_num;
				$.ajax({
					url : "enterTime",
					data : sendData,
					type : 'get',
					dataType : 'json',
					success : function(data) {
						var resultMsg = $.trim(data.resultMsg);
						if(confirm(resultMsg+" 수업 목록 조회페이지로 돌아가시겠습니까?")==true){
							location.href="classList";
						} else{
							location.reload();
						}
					}
				})
			}
		})
	})
	$(function() {
		$('#classFinish').on("click", function() {
		  	var c_e_date = "${classContent.c_e_date}";
		  	var today = new Date();
		  	var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month  + '-' + day;
			var endDate = new Date(c_e_date);
			var Compdate = new Date(dateString);
			console.log(c_e_date);
			console.log(dateString);
			console.log(Compdate);
			console.log(endDate);
		  	if(Compdate.getTime() <= endDate.getTime()){
		  		alert("수업 종료일의 다음날부터 종강할 수 있습니다.");
		  	} else {
				var c_name = "${classContent.c_name}"
			  	var c_num = ${classContent.c_num};
			  	if(confirm(c_name+" 수업을 종강하시겠습니까?")==true){
			  		var sendData = "c_num="+c_num;
			  		$.ajax({
			  			url : "classFinish",
			  			data : sendData,
			  			type : 'get',
			  			dataType : 'text',
			  			success : function(data) {
							var result = $.trim(data);
							if(result == 'classFinishOk'){
								if(confirm("수업이 종강처리되었습니다. 수업목록으로 돌아가시겠습니까?")==true){
									location.href="classList";
								} else{
									location.reload();
								}
							}
						}
			  		})
			  	}
		  	}
		})
	})
	$(function() {
		$('#classWaiver').on("click", function() {
			var c_name = "${classContent.c_name}"
			var c_num = ${classContent.c_num};
			var stu_id = "${sessionScope.sessionId}"
			if(confirm("수강포기하시면 재 수강이 불가능합니다. "+c_name+" 수업의 수강을 포기하시겠습니까?")==true){
				var sendData = "c_num="+c_num+"&stu_id="+stu_id;
				$.ajax({
					url : "classWaiver",
					data : sendData,
					type : 'get',
					dataType : 'text',
					success : function(data) {
						var result = $.trim(data);
						if(result == 'classWaiverOk'){
							if(confirm("수강포기처리 되었습니다. 수업목록으로 돌아가시겠습니까?")==true){
								location.href="classList";
							} else{
								location.reload();
							}
						} else {
							alert("수강포기에 실패하였습니다.");
						}
					},
					error : function(){
  	  					alert("처리 중 오류가 발생하였습니다.");
  	  				}
				})
			}
	  		
		})
	})
	$(function(){
		$('#classList').on("click", function(){
			location.href="classList";
		})
	})
	$(function(){
		$('#classUpdate').on("click",function(){
			var c_name = "${classContent.c_name}"
			var c_num = ${classContent.c_num};
			if(confirm(c_name + " 과목의 수업정보를 수정하시겠습니까?") == true){
				location.href="classUpdateForm?c_num="+c_num;
			}
		})
	})
	$(function(){
		$('#classCancel').on("click", function(){
			var c_name = "${classContent.c_name}"; 
			var c_num = ${classContent.c_num};
			var set = 4;
			if(confirm("수업을 취소하실 경우 기존 학생 정보가 삭제되며, 복구가 불가능합니다. "+c_name + " 과목의 수업을 취소하시겠습니까?") == true){
				var sendData = "c_num="+c_num+"&set="+set;
				$.ajax({
					url : "classSet",
					data : sendData,
					dataType : 'text',
					success : function(data){
						var result = $.trim(data.resultMsg);
						if(confirm(result+" 수업 목록 화면으로 돌아가시겠습니까?")==true){
							location.href="classList";
						} else{
							location.reload();
						}
					},
					error : function(){
						alert("처리 중 오류가 발생하였습니다.");
					}
				});
			}
		})
	})
	$(function(){
		$('#classFixed').on("click", function(){
			var applyStudentCnt = ${applyStudentCnt};
			console.log(applyStudentCnt);
			if(applyStudentCnt == 0){
				alert("신청한 학생이 없어 수업일정을 확정할 수 없습니다.");
			} else{
				var c_s_date = "${classContent.c_s_date}";
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var dateString = year + '-' + month  + '-' + day;
				var startDate = new Date(c_s_date);
				var Compdate = new Date(dateString);
				console.log(c_s_date);
				console.log(dateString);
				console.log(Compdate);
				console.log(startDate);
				if(Compdate.getTime() < startDate.getTime()){
					alert("수업 시작 다음날부터 확정할 수 있습니다.");
				} else {
					var c_name = "${classContent.c_name}"; 
					var c_num = ${classContent.c_num};
					var set = 2;
					if(confirm(c_name + " 과목의 수업을 확정하시겠습니까?") == true){
						var sendData = "c_num="+c_num+"&set="+set;
						$.ajax({
							url : "classSet",
							data : sendData,
							dataType : 'json', // json으로 바꿔야함
							success : function(data){
								var result = $.trim(data.resultMsg);
								var subResult = $.trim(data.subResultMsg);
								if(result=='classFixedOk'){
									alert("수업일정이 확정되었습니다.");
									if(confirm(subResult+" 수업 목록 화면으로 돌아가시겠습니까?")==true){
										location.href="classList";
									} else{
		  	  							location.reload();
		  	  						}
		  	  					}
		  	  				},
		  	  				error : function(){
		  	  					alert("처리 중 오류가 발생하였습니다.");
		  	  				}
		  	  			});
		  			}
  			  	}
  			}
  		})
  	})
  	$(function(){
  		$("#applyCancel").on("click", function(){
  			// this = $("#btnCancel") 제이쿼리 표기법으로 btnCancel의 클릭 후 함수실행 내용, 제이쿼리 표기법으로 사용했을 경우 this는 이벤트가 발생한 태그를 가리킴
  			 // boolean 값일 경우 el표기법에 더블쿼테이션("")쓰면 스트링값으로 넘어가니 주의해야함 ("true", "false") 필요한 내용은 true, false기 때문에
  			 // 자바스크립트에서 if는 0, false 제외하곤 모두 참으로 인식함
  			 <%-- <c:foreach var="" items="${}"> > </c:foreach> 이런식으로 사용도 가능함 , 서버사이드 스크립트는 주석 이렇게 처리해야함--%>
  			var c_name = "${classContent.c_name}"; 
  			var c_num = ${classContent.c_num};
  			var stu_id = "${sessionScope.sessionId}";
  			if(confirm("수강취소하실 경우 기존의 출결정보가 사라지며, 복구가 불가능합니다. "+c_name + "과목 수강신청을 취소하시겠습니까?") == true){
  				var sendData = "c_num="+c_num+"&stu_id="+stu_id;
  	  			$.ajax({
  	  				url : "applyCancel",
  	  				data : sendData,
  	  				dataType : 'text',
  	  				success : function(data){
  	  					var result = $.trim(data);
  	  					if(result=='cancelOk'){
  	  						if(confirm("수강신청이 취소되었습니다. 수업 목록 화면으로 돌아가시겠습니까?")==true){
  	  							location.href="classList";
  	  						} else{
  	  							location.reload();
  	  						}
  	  					}
  	  				},
  	  				error : function(){
  	  					alert("처리 중 오류가 발생하였습니다.");
  	  				}
  	  			});
  			}
  		})
  	});
  	function applyClass(c_name, c_num, stu_id){
  		if(confirm(c_name + "과목수강을 신청 하시겠습니까?") == true){
  			var c_e_date = "${classContent.c_e_date}";
  			var c_re_date = "${classContent.c_re_date}";
  			var today = new Date();
		  	var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month  + '-' + day;
			var endDate = new Date(c_e_date);
			var recruDate = new Date(c_re_date);
			var compDate = new Date(dateString);
			
			if(compDate.getTime() < recruDate.getTime()){
				alert("수업 모집일부터 수강신청을 할 수 있습니다.");
			} else if(compDate.getTime() > endDate.getTime()){
		  		alert("수업이 종료되어 수강신청을 할 수 없습니다.");
		  	} else{
		  		var c_s_date = "${classContent.c_s_date}";
		  		var c_e_time = "${classContent.c_e_time}";
		  		var c_co_time = "${classContent.c_co_time}";
				var sendData = "c_num="+c_num+"&stu_id="+stu_id+"&c_s_date="+c_s_date+
								"&c_e_date="+c_e_date+"&c_e_time="+c_e_time+"&c_co_time="+c_co_time;
	  			$.ajax({
	  				url : "applyClass",
	  				data : sendData,
	  				dataType : 'text',
	  				success : function(data){
	  					var result = $.trim(data);
	  					if(result=='applyOk'){
	  						if(confirm("수강신청에 성공하였습니다. 수업 목록 화면으로 돌아가시겠습니까?")==true){
	  							location.href="classList";
	  						} else{
	  							location.reload();
	  						}
	  					} else if(result=='applyError'){
	  						alert("수강신청에 실패하였습니다.");
	  					} else if(result=='applyAndCreateOk'){
	  						if(confirm("수강신청에 성공하였습니다. 오늘 출결정보가 등록되었으니 입실체크해주세요. 수업 목록 화면으로 돌아가시겠습니까?")==true){
	  							location.href="classList";
	  						} else{
	  							location.reload();
	  						}
	  					} else if(result=='Duplicate'){
	  						alert("기존 수강일정과 중복됩니다.");
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
		<section class="wrapper site-min-height">
        <h3><i class="fa fa-angle-right"></i>수업 정보 조회</h3>
        <div class="row content-panel mt mb">
          <div class="col-md-6">
            <h2 contenteditable="true">${classContent.c_name}</h2>
            <h3 contenteditable="true">교수명 : ${classContent.name}</h3>
            <h4 contenteditable="true">모집일정 : ${classContent.c_re_date}</h4>
            <h4 contenteditable="true">수업일정 : ${classContent.c_s_date } ~ ${classContent.c_e_date }</h4>
            <h4 contenteditable="true">수업시간 : ${classContent.c_e_time }시 ~ ${classContent.c_co_time }시</h4>
            <h4 contenteditable="true">수강신청인원 : ${applyStudentCnt}명 / ${classContent.s_closed }명</h4>
           	<div>
           		<c:if test="${not empty attendstatus }">
           			<h4 contenteditable="true">입실시간 : ${eHour}:${eMin} / 퇴실시간 : ${coHour}:${coMin}</h4>
           			<h4 contenteditable="true">출결상태 : ${attendstatus}</h4>
           		</c:if>
	           	<c:if test="${empty attendstatus && not empty eHour}">
		           	<h4 contenteditable="true">입실시간 : ${eHour}:${eMin}</h4>
	           	</c:if>
           	</div>
       		<div class="form-group" style="margin-top: 50px">
              	<div style="text-align: center;">
              		<c:choose>
              			<c:when test="${sessionScope.sessionAutority == 1}">
            				<c:if test="${classContent.c_status == 1 || classContent.c_status == 2}">
              					<c:if test="${classContent.c_status == 1}">
	              					<c:if test="${(applyStudent.a_status == 1 || empty applyStudent.a_status) && applyStudentCnt < classContent.s_closed }">
	              						<button type="button" class="btn btn-theme" onclick="applyClass('${classContent.c_name}', ${classContent.c_num}, '${sessionScope.sessionId}')">
	              						수강신청
	              						</button>
	              					</c:if>
	              					<c:if test="${applyStudent.a_status == 2}">
	              						<button class="btn btn-theme04" type="button" id="applyCancel">
	              						수강취소
	              						</button>
	              					</c:if>
              					</c:if>
              					<c:if test="${classContent.c_status == 2 && applyStudent.a_status == 2}">
              						<button class="btn btn-theme04" id="classWaiver" type="button">
              						수강포기
              						</button>
              					</c:if>
              					<c:if test="${applyStudent.a_status == 2 && not empty cStuInfo.attendance}">
              						<c:if test="${empty cStuInfo.e_time}">
										<button type="button" class="btn btn-theme02" id="eTimeClick">
										입실체크
										</button>
              						</c:if>
              						<c:if test="${not empty cStuInfo.e_time}">
				                		<button type="button" class="btn btn-theme04" id="coTimeClick">
				                		퇴실체크
				                		</button>
              						</c:if>
              					</c:if>
              				</c:if>
              				<c:if test="${classContent.c_status == 3 && applyStudent.a_status ==2 }">
              					<c:if test="${myRateChk == 0 }">
	              					<button type="button" class="btn btn-theme" onclick="profRate()">
		              				교수평가하기
		              				</button>
              					</c:if>
              					<c:if test="${myRateChk > 0 }">
              						<button type="button" class="btn btn-theme" onclick="profRateUpdate()">
		              				교수평가수정
		              				</button>
              					</c:if>
              				</c:if>
              			</c:when>
              			<c:when test="${sessionScope.sessionAutority == 2 && classContent.pro_id == sessionScope.sessionId}">
              				<c:if test="${classContent.c_status == 1 }">
			                    <button type="button" class="btn btn-theme02" id="classUpdate">
								수업정보수정
			                    </button>
			                	<button type="button" class="btn btn-theme" id="classFixed">
			                	수업확정
			                	</button>
			                    <button type="button" class="btn btn-theme04" id="classCancel">
								수업취소
			                    </button>
              				</c:if>
              				<c:if test="${classContent.c_status == 2 || classContent.c_status == 3 }">
              					<button type="button" class="btn btn-theme" id="studentRate">
              					학생평가
              					</button>
              				</c:if>
              				<c:if test="${classContent.c_status == 2 }">
              					<button type="button" class="btn btn-theme" id="classFinish">
              					수업종강
              					</button>
              				</c:if>
              			</c:when>
              		</c:choose>	
            		<button type="button" class="btn btn-theme03" id="classList">목록으로</button>
         		</div>
          </div>
      </div>
      <div class="col-md-6">
      	<h3 contenteditable="true">수업개요</h3>
        <p contenteditable="true" class="mt">${classContent.c_overview}</p>
      </div>
    </div>
  	</section>
	</section>
    <!--main content end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
</body>
	<%@include file="footer.jsp" %> 
</html>