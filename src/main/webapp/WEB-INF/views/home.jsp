<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	study  
</h1>
<p>이름은 ${member.username}환영합니다</p>
<a href="${pageContext.request.contextPath}/auth/register">회원가입</a>
<a href="${pageContext.request.contextPath}/auth/login">로그인</a>
<a href="${pageContext.request.contextPath}/auth/logout.do">로그아웃</a>
<a href="${pageContext.request.contextPath}/board/listAll">listpage</a>
</body>
</html>
