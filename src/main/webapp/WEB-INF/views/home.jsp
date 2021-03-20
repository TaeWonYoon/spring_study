<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<form method="post" action="./write.do">
	title : <input name="title" > <br />
	cotent : <input name="content"> <br />
	id : <input name="user_id"> <br />
<!-- 	<input type="hidden" name="viewcnt" value="0" /> -->
	<input type="submit" value="전송" />
</form>
</body>
</html>
