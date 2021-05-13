<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="m-4"><br><br>
		<div style='width: 900px; margin: 0 auto; padding: 50px;border:2px solid black; border-radius: 20px;margin-right:22%;margin-top:60px;'>
			<form name='homeForm' method="post" action="${pageContext.request.contextPath}/auth/login.do">
				<c:if test="${member == null}">
					<h2 class="form-signin-heading">Please sign in</h2>
					<label for="userid" class="sr-only">Id</label>
						<div class="mb-3">
							<input type="text" name="userid" id="userid" class="form-control form-control-lg"
								placeholder="Email address">
						</div>
					<label for="userpass" class="sr-only">Password</label>
					<div class="mb-3">
							<input type="password" name="userpass" id="userpass" class="form-control form-control-lg"
								placeholder="Password">
					</div>

					<div class="input-group" style="margin-top: 5px;">

						<div class="checkbox ">
							<label> <input type="checkbox" value="remember-me">
								Remember me
							</label>
						</div>
					</div>
					<div>
						<a href="./register" class="btn btn-lg btn-primary btn-block" >회원가입</a>
						<div class="float-end">
						<input type="submit" value="로그인" class="btn btn-lg btn-danger btn-block">
						</div>
					</div>
				</c:if>
				<c:if test="${member != null}">
					<h1 class="text-center" style="color:red;">로그아웃후 입력해주세요</h1>
					<br><br><br><br><br><br><br><br><br>
					<button id="btnBack" class="btn btn-danger">뒤로가기</button>
					<div class="float-end">
						<button id="btnOut" class="btn btn-primary">로그아웃</button>
					</div>
				</c:if>
			</form>
		</div>
	</div>
</body>
</html>