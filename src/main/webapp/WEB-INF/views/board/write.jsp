<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>Write Page</h1>

<form method="post" action="${pageContext.request.contextPath}/board/write.do">
	id : <input name="user_id"> <br />
	title : <input name="title" > <br />
	cotent : <textarea id="w3review" name="content" rows="5" cols="60" ></textarea> <br />
<!-- 	<input type="hidden" name="viewcnt" value="0" /> -->
	<input type="submit" value="전송" />
</form>
</body>