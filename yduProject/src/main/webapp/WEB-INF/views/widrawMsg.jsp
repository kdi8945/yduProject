<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>YDU 회원탈퇴 안내사항</title>
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
	function widrawProResult() {
		var widrawChk = document.getElementById('widrawChk');
		if($(widrawChk).prop("checked")){
			var id = "${sessionScope.sessionId}";
			var sendData = "id="+id;
			$.ajax({
				url : "widrawProResult",
				data : sendData,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					var result = $.trim(data.resultMsg);
					if(!data.resultCode){
						alert(result);
						location.href="login";
					} else{
						alert(result);
					}
				}
			})
		} else{
			alert("회원탈퇴 동의여부에 체크해주세요");
		}
	}
</script>
<script type="text/javascript">
	function widrawStuResult() {
		var widrawChk = document.getElementById('widrawChk');
		if($(widrawChk).prop("checked")){
			var id = "${sessionScope.sessionId}";
			var sendData = "id="+id;
			$.ajax({
				url : "widrawStuResult",
				data : sendData,
				type : 'get',
				dataType : 'json',
				success : function(data) {
					var result = $.trim(data.resultMsg);
					if(!data.resultCode){
						alert(result);
						location.href="login";
					} else{
						alert(result);
					}
				}
			})
		} else{
			alert("회원탈퇴 동의여부에 체크해주세요");
		}
	}
	function cancel() {
		if(confirm("회원탈퇴를 취소하시겠습니까?")==true){
			location.href="notiList?b_type=1";
		}
	}
</script>


<style type="text/css">
	.center{
		margin : 40px;
	}
	.ddStyle{
		margin-left: 40px;
		margin-top: 40px;
	}
	.ddSub{
		margin-left: 40px;
		margin-top: 30px;
	}
	
</style>
</head>
	<%@include file="header.jsp" %>
<c:choose>
	<c:when test="${sessionScope.sessionAutority == 2 }">
		<%@include file="profSide.jsp"%>
	</c:when>
	<c:when test="${sessionScope.sessionAutority == 1 }">
		<%@include file="stuSide.jsp"%>
	</c:when>
</c:choose>
<body>
	<section id="container">
		<section id="main-content">
			<section class="wrapper site-min-height">
				<h3><i class="fa fa-angle-right"></i>회원 탈퇴</h3>
				<div class="row mt">
					<div class="col-lg-12" style="width: 800px">
						<div class="content-panel">
							<div style="margin-left: 50px;">
								<dl>
									<dt>
										<h4>탈퇴안내</h4>
									</dt>
									<dt>&nbsp;&nbsp;&nbsp;&nbsp;회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</dt>
									<dd class="ddStyle"><img src="img/widrawChk.png" width="20px" height="20px"><strong>&emsp;사용하고 계신 아이디는 탈퇴할 경우 재사용이 불가능합니다.</strong><br>
										<span style="margin-left: 33px">탈퇴 후 아이디 복구를 희망하시는 경우 관리자에게 문의해주시길 바랍니다.</span></dd>
									<dd class="ddSub"><img src="img/widrawChk.png" width="20px" height="20px"><strong>&emsp;탈퇴 후 일부 데이터는 아래와 같이 처리되며, 처리된 데이터는 복구되지 않습니다.<br>
										<br>
										<c:if test="${sessionScope.sessionAutority == 1}">
											<span style="margin-left : 65px">수업 개설 과정에 신청 중인 내용 : 수강취소 처리 및 출결데이터 삭제</span><br>
											<span style="margin-left : 65px">수업 중인 과정에 참여 중인 내용 : 수강포기 처리</span>
										</c:if>
										<c:if test="${sessionScope.sessionAutority == 2}">
											<span style="margin-left : 65px">수업 개설 중인 내용 : 신청 학생 수강취소 처리 및 출결데이터 삭제, 수업취소 처리</span><br>
										</c:if>
									</dd>
									<dd class="ddSub"><img src="img/widrawChk.png" width="20px" height="20px"><strong>&emsp;탈퇴 후에도 기존 수강정보 및 작성한 게시글 그대로 남아있습니다.</strong><br>
										<span style="margin-left: 33px;">게시글 중 삭제를 원하는 게시글이 있다면</span><span style="color: red">&nbsp;반드시 탈퇴 전 삭제하시기 바랍니다.</span><br>
										<br>
										<c:if test="${sessionScope.sessionAutority == 1}">
											<span style="margin-left : 65px">전체 및 수업 공지사항 게시판 댓글</span><br>
											<span style="margin-left : 65px">대나무숲 게시글</span><br>
											<span style="margin-left : 65px">교수자평가 작성내용 및 평점</span>
										</c:if>
										<c:if test="${sessionScope.sessionAutority == 2}">
											<span style="margin-left : 65px">수업 공지사항 게시글</span><br>
											<span style="margin-left : 65px">전체 및 수업 공지사항 게시판 댓글</span>
										</c:if>
									</dd>
									<dd class="ddSub"><input type="checkbox" name="widrawChk" id="widrawChk"><span style="margin-left: 20px"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></span></dd>
								</dl>
							</div>
							<div style="margin-top: 40px; margin-bottom: 40px; text-align: center;">
								<button type="button" class="btn btn-primary btn-lg" 
									<c:if test="${sessionScope.sessionAutority == 1}">onclick="widrawStuResult()"</c:if>
									<c:if test="${sessionScope.sessionAutority == 2}">onclick="widrawProResult()"</c:if>
								>확인</button>
								<button type="button" class="btn btn-secondary btn-lg" onclick="cancel()">취소</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
	</section>
</body>
</html>