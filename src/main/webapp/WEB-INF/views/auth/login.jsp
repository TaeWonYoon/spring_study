<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name='homeForm' method="post" action="./login.do">
		<c:if test="${member == null}">
			<div>
				<label for="userid"></label>
				<input type="text" id="userid" name="userid">
			</div>
			<div>
				<label for="userpass"></label>
				<input type="password" id="userpass" name="userpass">
			</div>
			<div>
				<input type="submit" value="로그인">
				<button type="button">회원가입</button>
			</div>
		</c:if>
	</form>
</body>
</html>