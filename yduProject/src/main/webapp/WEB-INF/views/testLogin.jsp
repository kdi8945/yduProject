<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
세션 아이디 : ${sessionScope.sessionId }<p>
세션 권한 : ${sessionScope.sessionAutority }<p>
세션 상태 : ${sessionScope.sessionMem_status }<p>
<a href="testLogout">로그아웃 후 로그인화면으로</a>
<a href="classList">과정조회</a>
<a href="stuCInfo?stu_id=${sessionScope.sessionId }&a_status=2">학생 수업상세정보(참여중)</a>
<a href="stuCInfo?stu_id=${sessionScope.sessionId }&a_status=3">학생 수업상세정보(수강포기)</a>
<a href="profCInfo?pro_id=${sessionScope.sessionId}&c_status=2">교수 수업상세정보(수업중)</a>
<a href="profCInfo?pro_id=${sessionScope.sessionId}&c_status=3">교수 수업상세정보(수업종료)</a>
</body>
</html>