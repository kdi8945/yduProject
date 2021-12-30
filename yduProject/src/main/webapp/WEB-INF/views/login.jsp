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
  <title>YDU 로그인</title>
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
	function loginChk() {
		var id=$('#id').val();
		var pw=$('#pw').val();
		var sendData = "id="+id+"&pw="+pw;
		$.ajax({
			url : "loginChk",
			type : 'post',
			data : sendData,
			dataType : 'json',
			success : function(loginChkResult) {
				/* json 활용방법(dto, list)
				console.log(loginChkResult);
				return;
				
				//console.log(loginChkResult.result); dto 타입 리턴했을때
				console.log(loginChkResult[0]); // 0번째 list를 직접꺼냄
				console.log(loginChkResult[1].result); // 1번째 list의 result
				$.each(loginChkResult, function(idx, loginChk){ // list를 반복문으로 꺼냄
					console.log(loginChk);
				});
				$.each(loginChkResult, function(key, value){ // dto each문으로(잘안씀)
					console.log(loginChk);
				});
				if(loginChkResult.errorCode != 0){
					alert(loginChkResult.errorMsg);
					return;
				} 
				var arr = [];
				$.each(loginChkResult, function(idx, loginChk){ // list에 담긴 result값들만 꺼내서 배열에 넣음
					arr.push(loginChk.result);
				})
				console.log(arr);
				return;
				*/
				
				var chkResult = $.trim(loginChkResult.result);
				if(chkResult == 'loginok'){
					if(!loginChkResult.createCStuInfoMsg){
						alert("로그인에 성공하였습니다.");
						location.href="notiList?b_type=1";
					} else {
						alert(loginChkResult.createCStuInfoMsg);
						location.href="notiList?b_type=1";
					}
				} else if(chkResult == 'pwError'){
					alert("비밀번호가 틀렸습니다.");
				} else if(chkResult == 'idError'){
					alert("아이디가 존재하지 않습니다.");
				} else if(chkResult == 'waiting'){
					alert("회원가입 승인대기 중입니다.");
				} else if(chkResult == 'withdraw'){
					alert("탈퇴한 회원입니다.");
				}
			}
		})
	}
  </script>
</head>
	<%@include file="header.jsp" %>
<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content2">
      <section class="wrapper">
        <div class="row mt">
          <div class="col-lg-6">
            <h3 style="text-align: center;">YDU 학사관리시스템</h3>
            <div class="form-panel">
              <div class="form">
                <form class="cmxform form-horizontal style-form" id="signupForm" method="post" action="" name="frm">
                  <div style="margin: 5px">&nbsp;</div>
                  <div class="form-group ">
                    <label for="id" class="control-label col-lg-2">아이디</label>
                    <div class="col-lg-10">
                      <input class=" form-control" style="width: 80%" id="id" name="id" type="text" required="required"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="pw" class="control-label col-lg-2">패스워드</label>
                    <div class="col-lg-10">
                      <input class="form-control " style="width: 80%" id="pw" name="pw" type="password" required="required"/>
                    </div>
                  </div>
                  <div style="margin: 20px"><span>&nbsp;</span></div>
                  <div class="form-group">
                    <div style="text-align: center;">
                      <button class="btn btn-theme" type="button" onclick="loginChk()">로그인</button>
                      <button class="btn btn-theme02" type="button"><a href="joinForm" style="color: white">회원가입</a></button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <!-- /form-panel -->
          </div>
          <!-- /col-lg-12 -->
        </div>
        <!-- /row -->
      </section>
      <!-- /wrapper -->
    </section>
    <!-- /MAIN CONTENT -->
    <!--main content end-->
</body>
</html>