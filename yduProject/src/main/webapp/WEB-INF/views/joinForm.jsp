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
  <title>YDU 회원가입</title>
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
  	var idChk = 0;
  	function idConfirmAfterChk(object) {
		if(idChk > 0){
			alert("아이디가 변경되었습니다. 다시 중복체크해주세요");
			idChk = 0;
			$('#idConfirm').show();
			$('#id_check_sucess').hide();
		}
	}
	function maxLengthCheck(object) {
		if(object.value.length > object.maxLength){
			object.value = object.value.slice(0,object.maxLength);
		}
	}
	function idConfirmChk() {
		console.log(idChk);
		var id = $('#id').val();
		if(id==null || id==""){
			alert("ID를 입력해주세요");
		} else {
			var sandData = 'id='+id;
			$.ajax({
				url : "idConfirm",
				data : sandData,
				type : 'post',
				dataType : 'text',
				success : function(confirmResult) {
					console.log(confirmResult);
					/* var result = JSON.stringify(confirmResult); */
					if(confirmResult==null || confirmResult==""){
						alert("사용가능한 아이디입니다");
						$('#idConfirm').hide();
						$('#id_check_sucess').show();
						idChk=1;
						console.log(idChk);
					} else{
						alert(confirmResult+"는 이미 있는 아이디입니다");
					}
				}
			})
		}
	}
	function cancel() {
		if(confirm("회원가입을 취소하고 로그인화면으로 돌아가시겠습니까?")==true){
			location.href="login";
		}
	}
	// ajax 2중사용? 아이디 중복체크 버튼?
	function submitChk(e) {
		/* 체크여부 먼저 점검, 체크완료 후 체크된 갯수만큼 배열 만들고 담아줌 */
		if(frm.pw.value != frm.repw.value){
			alert("비밀번호가 다릅니다.");
			e.preventDefault();
			frm.pw.focus();
		} else{
			if(idChk==0){
				alert("아이디 중복체크를 실행해주세요.");
				e.preventDefault();
				frm.id.focus();
			} else{
				var termsChkBox = $("input[name='termsChkBox']"); // 인풋 네임이 termsChkBox인 태그가 배열형태로 순서대로 담김(체크박스아니어도 무관)
				console.log(termsChkBox);
				
				var t_numArr = [];
				var t_necessaryArr = [];
				
				var result = true;
				$.each(termsChkBox, function(idx, chkbox){ // 첫번째 파라미터(배열이 90%)termsChkBox를 넣고 콜백function(idx, chkbox)
				//	첫번째인자(idx) -> 배열의 값(0,1,2,3,4 등)이 나오고 chkbox는 넣은 인풋태그가 나옴
					var t_necessary = $(chkbox).attr("data-value"); // attr은 속성값(type, id, name, value 등등) 가져오는 것(일반적으론 id)
					
					// class에 required 넣은거는 아래 if문으로 사용가능, 현재 사용안하고있음
					//if($(chkbox).hasClass("required")){
						 
					//}
					
					if(t_necessary == "Y" && !$(chkbox).is(":checked")){
						result = false;
						return false; // each문에서 break 하려면 return false 쓰면 됨
						//continue 쓰려면 return true;
					}
					
					t_numArr.push($(chkbox).val());
					t_necessaryArr.push($(chkbox).is(":checked") ? "Y" : "N");
				});
				
				if(!result){
					alert("필수약관을 체크해주세요");
					return; // 이렇게 return 걸면 아래로직 안탐
				}
				
				console.log(t_numArr);
				console.log(t_necessaryArr);
				var params = $("#signupForm").serializeArray();
				params.push({name:"t_numArr", value:t_numArr.join(",")});
				params.push({name:"t_necessaryArr", value:t_necessaryArr.join(",")});
				console.log("params >>>> ");
				console.log(params);
				$.ajax({
					url : "join",
					type : 'post',
					data : params,
					dataType : 'json',
					success : function(data) {
						var result = $.trim(data.resultMsg);
						var subResult = $.trim(data.subResultMsg);
						alert(result);
						if(subResult == 'y'){
							location.href="login";
						}
					}
				});
			} 
		}
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
            <h3 style="text-align: center;">YDU 회원가입</h3>
            <div class="form-panel">
              <div class="form">
                <!-- <form class="cmxform form-horizontal style-form" id="signupForm" method="post" action="" name="frm" onsubmit="submitChk()"> -->
                <form class="cmxform form-horizontal style-form" id="signupForm" method="post" action="" name="frm">
                  <div style="margin: 5px">&nbsp;</div>
                  <div class="form-group ">
                    <label for="id" class="control-label col-lg-2">아이디</label>
                    <div class="col-lg-10">
                      <input class=" form-control" style="width: 80%" onchange="idConfirmAfterChk(this)" id="id" name="id" type="text" required="required"/>
                      	<span><button type="button" class="btn btn-info btn-xs" id="idConfirm" onclick="idConfirmChk()" >중복체크</button>
                      		<button class="btn btn-primary btn-xs" id="id_check_sucess" style="display: none;"><i class="fa fa-check"></i></button>
                      	</span>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="name" class="control-label col-lg-2">이름</label>
                    <div class="col-lg-10">
                      <input class=" form-control" style="width: 80%" id="name" name="name" type="text" required="required"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="pw" class="control-label col-lg-2">패스워드</label>
                    <div class="col-lg-10">
                      <input class="form-control " style="width: 80%" id="pw" name="pw" type="password" required="required"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="repw" class="control-label col-lg-2">패스워드 확인</label>
                    <div class="col-lg-10">
                      <input class="form-control " style="width: 80%" id="repw" name="repw" type="password" required="required"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="yducode" class="control-label col-lg-2">YDU 번호</label>
                    <div class="col-lg-10">
                      <input class="form-control" style="width: 80%" type="number"  min="100000" max="999999" maxlength="6" oninput="maxLengthCheck(this)" name="yducode" id="yducode"/>
                    </div>
                  </div>
                  <div class="form-group ">
                    <label for="email" class="control-label col-lg-2">이메일</label>
                    <div class="col-lg-10">
                      <input class="form-control " style="width: 80%" id="email" name="email" type="email" required="required"/>
                    </div>
                  </div>
                  <div style="margin-left: 10px">
                  	<c:forEach var="TermsList" items="${TermsList}">
	                	<table>
	                    	<tr>
	                        	<td>
									<div class="form-check">
										<%-- <input class="form-check-input" type="checkbox" value="${necessaryTermsList.t_content}" id="necessaryChkBox${necessaryTermsList.t_num}" name="necessaryChkBox"> --%>
										<input class="form-check-input" type="checkbox" value="${TermsList.t_num}" id="termsChkBox${TermsList.t_num}" data-value="${TermsList.t_necessary}" name="termsChkBox">
										<label class="form-check-label" for="termsChkBox${TermsList.t_num}">${TermsList.t_content}
											<c:if test="${TermsList.t_necessary =='Y'}">
												<span>(필수)</span>
											</c:if>
											<c:if test="${TermsList.t_necessary =='N'}">
												<span>(선택)</span>
											</c:if>
										</label>
									</div>
	                  			</td>
							</tr>
						</table>
                  	</c:forEach>
                  </div>
                  <div style="margin: 20px"><span>&nbsp;</span></div>
                  <div class="form-group">
                    <div style="text-align: center;">
                      <button type="button" class="btn btn-theme" onclick="submitChk()">회원가입</button>
                      <button class="btn btn-theme04" type="button" onclick="cancel()">취소</button>
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