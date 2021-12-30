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
<title>YDU 전체 공지사항 상세조회</title>
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
<script class="include" type="text/javascript"
   src="lib/jquery.dcjqaccordion.2.7.js"></script>
<script src="lib/jquery.scrollTo.min.js"></script>
<script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
<script src="lib/jquery.sparkline.js"></script>
<!--common script for all pages-->
<script src="lib/common-scripts.js"></script>
<!--script for this page-->
<script type="text/javascript">
//목록으로 돌아가기 버튼
function backList() {
   location.href="notiList?b_type=1";
}
//수정폼으로 들어가기 버튼
function backUpd() {
   if(confirm("게시글을 수정 하시겠습니까?")==true){
      var b_num = $('#b_num').val();
      var b_type = $('#b_type').val();
      location.href="notiUpdateForm?b_type="+b_type+"&b_num="+b_num;
   }
}
//게시물 삭제하기 버튼
function backDelete(b_num,b_type) {
   if(confirm("게시물을 정말 삭제하시겠습니까?") == true){
      var sendData = 'b_num='+b_num+'&b_type='+b_type;
      $.ajax({
         url: 'notiDelete',
         type : 'get',
         data : sendData,
         success : function(data){
            var data = $.trim(data);
            if(data == 'deleteok'){
               alert("게시물이 삭제되었습니다!");
               location.href="notiList?b_type=1";
            } else if(data =='deleteError'){
               alert("게시물 삭제에 실패하였습니다.");
            }
         }
      })
   }   
   
}


//전체 공지게시판 댓글 수정 Ajax
function commUpdate(c_num) {
   if(confirm("댓글을 수정하시겠습니까?") == true){
      var id = "${sessionScope.sessionId}";
      var b_num = $('#b_num').val();
      var b_type = $('#b_type').val();
      var c_content = $('#c_contentUpdate').val();
      var sendData = 'id='+id+'&b_num='+b_num+'&b_type='+b_type+'&c_content='+c_content+'&c_num='+c_num;
      $.ajax({
         url : 'commUpdate',
         data : sendData,
         dataType : 'text',
         success : function(data){
            var result = $.trim(data);
            if(result == 'updateok'){
               alert("댓글 수정이 완료되었습니다!");
               location.reload();
            }else if(result == 'updateerror'){
               alert("댓글 수정에 실패하였습니다.");
               location.reload();
            }
         
         }
      })
    }else{
       return ;
    }
} 
//전체 공지게시판 댓글 작성 AJax
function commWrite(){
     var id = "${sessionScope.sessionId}";
     var b_num = $('#b_num').val();
     var b_type = $('#b_type').val();
     var c_content = $('#c_contentWrite').val();
   var sendData = 'id='+id+'&b_num='+b_num+'&b_type='+b_type+"&c_content="+c_content;
   console.log(sendData);
   $.ajax({
      url : 'commWrite',
      type : 'get',
      data : sendData,
      dataType : 'text',
      success : function(data){
         var result = $.trim(data);
         if(result == 'writeok'){
            alert("댓글이 작성되었습니다!");
            location.reload(); 
         } else if(result =='writeerror'){
            alert("댓글 작성에 실패하였습니다.");
            location.reload(); 
         }
      }
   })
}
//전체 공지 게시판 댓글 삭제 AJax
function commDelete(c_num){
   if(confirm("댓글을 삭제 하시겠습니까?") == true){
      var sendData = "c_num="+c_num;
      $.ajax({
         url : 'commDelete',
         type : 'get',
         data : sendData,
         success : function(data){
            var data = $.trim(data);
            if(data == 'deleteok'){
               alert("댓글이 삭제 되었습니다!");
               location.reload();
            }else if(data == 'deleteerror'){
               alert("댓글 삭제에 실패하였습니다.");
               location.reload();
            }
         }
      })
   }else{
      return;
   }
}

function commUpdateForm(c_num){
   event.preventDefault();
   var id = "${sessionScope.sessionId}";
   var name = "${sessionScope.sessionName}"
   var b_num = $('#b_num').val();
/*    var c_num = $('#c_num').val(); */
   var b_type = $('#b_type').val();
   var c_w_date = $('#c_w_date').val();
   var c_content = $('#c_content').val();

   var htmls = "";
/*    b_num = document.getElementById("b_num").value;
 */
   htmls += '<div id="id'+c_num+'">';
   htmls += '<table>';
   htmls += '<tr>';
   htmls += '<td width="1000px" style="text-align: left; vertical-align: top">';
   htmls += '&emsp;<strong>작성자</strong>&ensp;'+name+'</td>';
   htmls += '<td style="text-align: right; ">';
   htmls += '<strong>작성일</strong>'+c_w_date+'</td>';
   htmls += '</tr>';
   htmls += '<table>';
   htmls += '<tr>';
   htmls += '<td width="200px" style="text-align: left; vertical-align: top">';
   htmls += '<td width="1000px">';
   htmls += '<textarea class="form-control" id="c_contentUpdate" style="min-height: 100px; width: 100%" name="c_content"></textarea>';
   htmls += '<td width="165px" style="text-align: center">';
   htmls += '<a href="#" onclick="commUpdate('+c_num+');" class="text-red">[수정]&nbsp;&nbsp;&nbsp;</a>';
   htmls += '<a href="javascript:void(0)" onclick="location.reload   ();">[취소]</a>';
   htmls += '</td>';
   htmls += '</tr>';
   htmls += '</table>';
   htmls += '<div><hr></div>';
   htmls += '</div>';
   $('#id'+c_num).replaceWith(htmls);
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
      <section id="main-content">
         <main>
            <div style="height: 100px"></div>
            <div class="row mt">
               <div class="col-md-12">
               <h3 style="margin: 18px; color: #4B89DC;">
                  &emsp;<i class="fa fa-bullhorn"></i> <strong>전체 공지사항</strong>
               </h3>
                  <div class="content-panel" style="width: 1250px; margin: 30px;">
                     <hr>
                     <!-- 공지사항 목록 --> 
                     <!-- id 를 hidden 에다가 걸어버리면 보안상 문제가 생길 수 있다.
                         예를 들어서, kd1(학생) id로 로그인했는데 소스코드에서 id 값이 노출되므로 임의로 hailey(관리자)로 바꿀 수가 있다.
                         이를 막기위해 id는 input hidden 으로 걸지말고 Jquery단 Ajax 에 있는  var id = "${sessionScope.sessionId}"; 로 선언하여 jsp 단에서만 보이게끔 해야한다 -->
                     <%-- <input type="hidden" id="id" name="id" value="${sessionScope.sessionId }"> --%>
                     <input type="hidden" id="b_num" name="b_num" value="${boardContent.b_num }">
                     <input type="hidden" id="b_type" name="b_type" value="${boardContent.b_type }">
                     <table class="table table-striped table-advance table-hover">
                        <thead>
                           <tr>
                              <th width="300">${boardContent.b_title }</th>
                              <th width="120"><i class="fa fa-user"></i>&nbsp;
                                 작성자&ensp;${boardContent.name }</th>
                              <th width="100"><i class="fa fa-clock-o"></i>&nbsp;
                                 작성일&ensp;${boardContent.b_w_date }</th>
                              <th width="100"><i class="fa fa-eye"></i>&nbsp;
                                 &ensp;${boardContent.b_view }</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <td colspan="4" height="230px;" width="130px;">${boardContent.b_content }</td>
                           </tr>
                        </tbody>
                     </table>
                     <div style="text-align: right; margin-right: 50px">
                        <c:if test="${sessionScope.sessionId == boardContent.id}">
                           <button type="button" class="btn btn-success" onclick="backUpd()">수정</button>
                        </c:if>
                        <c:if test="${sessionScope.sessionId == boardContent.id || sessionScope.sessionAutority == 3}">
                           <button type="button" class="btn btn-danger" onclick="backDelete(${boardContent.b_num},${boardContent.b_type})">삭제</button>
                        </c:if>
                           <!-- 목록은 아무나 다 사용가능 -->
                           <button type="button" class="btn btn-theme02" onclick="backList()">목록</button>
                     </div>
                     <hr>
                     
                     <!-- 댓글 목록 폼  -->
                     <c:if test="${clSize > 0}">
                        <c:forEach var="commentList" items="${commentList }">
                        <input type="hidden" id="c_num${commentList.c_num }" name="c_num" value="${commentList.c_num }">
                         <div id="id${commentList.c_num}">
                         <input type="hidden" id="c_w_date" name="c_w_date" value="${commentList.c_w_date}">
                           <table>
                              <tr>
                                 <td width="1000px" style="text-align: left; vertical-align: top">
                                    &emsp;<strong>작성자</strong>&ensp;${commentList.name}
                                 </td>
                                 <td style="text-align: right; ">
                                 <strong>작성일</strong>&ensp;${commentList.c_w_date}
                                 </td>
                              </tr>
                              <tr>
                                 <td class="line" width="350px" style="text-align: left;">&emsp;${commentList.c_content }</td>
                                 <td width="165px" style="text-align: right;">
                                    <c:if test="${sessionScope.sessionId == commentList.id }">
                                       <!-- 수정하기  -->
                                       <button class="btn btn-success btn-xs" onclick="commUpdateForm(${commentList.c_num })">
                                          <i class="fa fa-pencil-square-o"></i>
                                       </button>
                                    </c:if>
                                    <c:if test="${sessionScope.sessionId == commentList.id || sessionScope.sessionAutority == 3}">
                                       <!-- 삭제하기  버튼-->
                                       <button class="btn btn-danger btn-xs" onclick="commDelete(${commentList.c_num})">
                                       <i class="fa fa-trash-o "></i>
                                       </button>
                                    </c:if>
                                 </td>
                              </tr>
                              <%-- <tr>
                                 <td colspan="2" width="515px">
                                    <div id="commUpdateFormId${commentList.c_num }"></div>
                                 </td>
                              </tr> --%>
                           </table>
                           <div><hr></div>
                           </div>
                        </c:forEach>
                     </c:if>
                     <!-- 댓글 작성폼 -->
                      <table>
                        <tr>
                        <td width="200px" style="text-align: left; vertical-align: top; ">　
                        <font color=""><strong>작성자 </strong>${sessionScope.sessionName}</font></td>
                        <td width="1000px">
                        <textarea class="form-control" id="c_contentWrite" style="min-height: 100px; width: 100%" name="c_content" placeholder="댓글 작성을 해주세요."></textarea>
                        <td width="165px" style="text-align: center">
                           <button type="button" class="btn btn-info" onclick="commWrite()" style="margin-left: 15px;">작성하기</button>
                        </td>
                        </tr>
                     </table>
                     <hr>
                  </div>
               </div>
            </div>
         </main>
      </section>
      <!--main content end-->
   </section>
</body>
<%@include file="footer.jsp"%>
</html>