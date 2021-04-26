<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="m-5">
	<form method="post" action="./delete.do" class="row g-4"
		id="deleteForm">
		<h1>회원수정 페이지</h1>
		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="username" class="form-label">이름</label>
			</div>
			<div class="col-lg-4 ">
				<input type="text" class="form-control" id="username" value="${member.username}" disabled>
			</div>
		</div>
		
		<div class="input-group">
			<div class="col-lg-1">
				<label for="userid" class="form-label">아이디</label>
			</div>
			<div class="col-lg-4">
				<input type="text" name="userid" maxlength="15" class="form-control" id="userid" value="${member.userid}" readonly>
			</div>
		</div>
		
		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="userpass" class="form-label">비밀번호</label>
			</div>
			<div class="col-lg-4 ">
				<input type="password" name="userpass" class="form-control"
					maxlength="12" id="userpass">
					<span style="color:red;">패스워드는 최소 6글자 이상입니다.</span>
				<input type="hidden" class="form-control"
					maxlength="12" id="userpassChk" value="${member.userpass}">
			</div>
		</div>
		
		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="userpass2" class="form-label">비밀번호 확인</label>
			</div>
			<div class="col-lg-4 ">
				<input type="password" class="form-control"
					maxlength="12" id="userpass2">
					<span style="color:red;" id="passChk"></span>
			</div>
		</div>
		
		<div style="margin-left: 240px;margin-top:40px;">
			<button type="button" id="btnForm" class="btn btn-success btn-lg">회원탈퇴 변경</button>
		</div>
	</form>
</div>

</body>
</html>