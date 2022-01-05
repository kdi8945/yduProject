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
	function widraw() {
		var pw = $('#pw').val();
		var id = "${sessionScope.sessionId}";
		var sendData = "id="+id+"&pw="+pw;
		$.ajax({
			url : "widrawPwChk",
			data : sendData,
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var result = $.trim(data.resultMsg);
				if(!result){
					location.href="widrawMsg";
				} else {
					$('#resultMsg').html(result);
				}
			}
		})
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
				<div class="row mt">
					<div class="col-lg-6">
					<h3 style="text-align: center;">YDU 회원탈퇴</h3>
						<div class="form-panel">
							<div class="form">
								<form class="cmxform form-horizontal style-form" id="signupForm" method="post" action="" name="frm" style="height: 150px">
									<div style="margin: 5px">&nbsp;</div>
									<div class="form-group ">
										<label for="pw" class="control-label col-lg-2">패스워드</label>
										<div class="col-lg-10">
											<input class="form-control " style="width: 80%" id="pw" name="pw" type="password" required="required"/>
										</div>
									</div>
									<div class="form-group">
										<div style="text-align: center;">
											<button class="btn btn-theme" type="button" onclick="widraw()">확인</button>
											<button class="btn btn-theme02" type="button" onclick="cancel()">취소</a></button>
										</div>
									</div>
								</form>
								<h5 style="text-align: center;"><span id="resultMsg">탈퇴 전 비밀번호를 입력해주세요.</span></h5>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
	</section>
</body>
</html>