<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YDU 로그아웃</title>
<script type="text/javascript">
	var sessionId = "${sessionScope.sessionId}";
	console.log(sessionId);
	alert("로그아웃되었습니다.");
	location.href="login";
</script>
</head>
<body>

</body>
</html>