<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<c:if test="${member == null }">
 	<script>
 		alert('로그인 후 이용해주세요');
 		location.href = "${pageContext.request.contextPath}/auth/login";
 	</script>
</c:if>
	<div class="container">
		<div class="add-box" style="height:700px;">
			<div class="card">
				<div class="card-body">
					<h1>Write Page</h1>
					<form method="post" action="${pageContext.request.contextPath}/board/write.do">
						<div class="form-group m-3">
							id <input name="user_id" value="${member.userid}" class="form-control"readonly />
						</div>
						<div class="form-group m-3">
							title <input name="title" class="form-control">
						</div>
						<div class="form-group m-3">
							cotent <textarea id="w3review" name="content" class="form-control" rows="10" cols="60" ></textarea>
						</div>
						<input type="hidden" name="viewcnt" value="0" />
						<div class="form-group m-2">
							<input type="submit" value="전송" class="btn btn-danger btn-lg float-end"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>