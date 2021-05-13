<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
  	-webkit-appearance: none;
}
</style>
<c:if test="${member != null}">
	<script> alert('로그아웃후 이용해주세요'); location.href = '${pageContext.request.contextPath}/'</script>
</c:if>
<div class="m-5">
	<form method="post" id="rform" action="./register.do" class="row g-4"
		id="registerform" enctype="multipart/form-data">
		<h1>회원가입 페이지</h1>
		<div class="input-group">
			<div class="col-lg-1 ">
			  <label for="formFileLg" class="form-label">프로필 사진</label>
			</div>
			<div class="col-lg-4 ">
			  <input class="form-control" type="file" id="formFileLg" name="imgUpload" placeholder="파일 선택" accept="image/gif,image/jpeg,image/png">
			</div>
		</div>
		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="username" class="form-label">이름</label>
			</div>
			<div class="col-lg-4 ">
				<input type="text" name="username" maxlength="9"
					class="form-control" id="username">
			</div>
		</div>

		<div class="input-group">
			<div class="col-lg-1">
				<label for="userid" class="form-label">아이디</label>
			</div>
			<div class="col-lg-4">
				<input type="text" name="userid" maxlength="15" class="form-control" id="userid"> <span style="color:red;">아이디는 최소 5글자 이상입니다.</span>
			</div>
			&nbsp;&nbsp;&nbsp;
			<div class="col-sm-5">
				<button class="btn btn-primary mb-3" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
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
			</div>
		</div>
		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="userpass2" class="form-label">비밀번호 확인</label>
			</div>
			<div class="col-lg-4 ">
				<input type="password" name="userpass2" class="form-control"
					maxlength="12" id="userpass2"> 
					<span id="passChk" style="color:red;"></span>
			</div>
			
		</div>

		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="tel" class="form-label">전화번호</label>
			</div>
			<div class="col-lg-1 ">
				<input type="text" class="form-control" id="tel" name="tel"> 
			</div> &nbsp;&nbsp; - &nbsp;&nbsp;
			<div class="col-lg-1 ">
				<input type="text" maxlength="4" class="form-control" id="tel2"> 
			</div> &nbsp;&nbsp; - &nbsp;&nbsp;
			<div class="col-lg-1 ">
				<input type="text" maxlength="4" class="form-control" id="tel3">
			</div>
		</div>

		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="e1" class="form-label">email</label>
			</div>
			<div class="col-lg-10 ">
				<input type="text" id="e1"> @ 
				<select id="e2">
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="nate.com">nate.com</option>
					<option value="google.com">google.com</option>
					<option value="">직접입력</option>
				</select> 
				<input type="text" id="e3" value="" disabled> 
				<input type="hidden" name="email" id="e4">
			</div>
		</div>

		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="exampleInputEmail1" class="form-label">생일</label>
			</div>
			<div class="col-lg-4 ">
				<div class="form-inline">
					<select name="year" id="year" title="년" class=""></select> <select
						name="month" id="month" title="월" class=""></select> <select
						name="day" id="day" title="일" class=""></select> <input
						type="hidden" name="birthday" id="birthday">
				</div>
			</div>
		</div>
	</form>

	<br>
	<div style="margin-left: 250px;">
		<button id="btn_submit" class="btn btn-danger">회원가입</button>
	</div>
<%--   <button id="test">test</button> --%>
</div>

