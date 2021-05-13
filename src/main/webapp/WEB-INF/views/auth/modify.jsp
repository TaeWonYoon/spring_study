<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div class="m-5">
	<form method="post" id="mform" action="./modify.do" class="row g-4"
		id="registerform" enctype="multipart/form-data">
		<h1>회원수정 페이지</h1>
		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="username" class="form-label">이름</label>
			</div>
			<div class="col-lg-4 ">
				<input type="text" name="username" maxlength="9"
					class="form-control" id="username" value="${infor.username}" disabled>
			</div>
		</div>

		<div class="input-group">
			<div class="col-lg-1">
				<label for="userid" class="form-label">아이디</label>
			</div>
			<div class="col-lg-4">
				<input type="text" name="userid" maxlength="15" class="form-control" id="userid" value="${infor.userid}" readonly>
			</div>
		</div>
		<div class="input-group">
			<div class="col-lg-1">
				<label class="form-label">email</label>
			</div>
			<div class="col-lg-4">
				<input type="text" maxlength="15" class="form-control" value="${infor.email}" readonly>
			</div>
		</div>
		<div class="input-group">
			<div class="col-lg-1">
				<label class="form-label">생일</label>
			</div>
			<div class="col-lg-4">
				<input type="text" maxlength="15" class="form-control" value="${infor.birthday}" readonly>
			</div>
		</div>
		<!--  
		
		<div class="input-group">
			<div class="col-lg-1 ">
			  <label for="formFileLg" class="form-label">프로필 사진</label>
			</div>
			<div class="col-lg-4 ">
			  <input class="form-control" type="file" id="formFileLg" name="imgUpload" placeholder="파일 선택" accept="image/gif,image/jpeg,image/png">
			</div>
		</div>
		-->
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
				<input type="password" class="form-control"
					maxlength="12" id="userpass2">
					<span style="color:red;" id="passChk"></span>
			</div>
		</div>

		<div class="input-group">
			<div class="col-lg-1 ">
				<label for="tel" class="form-label">전화번호</label>
			</div>
			<div class="col-lg-1 ">
				<input type="text" class="form-control" id="tel1"> 
			</div> &nbsp;&nbsp; - &nbsp;&nbsp;
			<div class="col-lg-1 ">
				<input type="text" maxlength="4" class="form-control" id="tel2" > 
			</div> &nbsp;&nbsp; - &nbsp;&nbsp;
			<div class="col-lg-1 ">
				<input type="text" maxlength="4" class="form-control" id="tel3">
			</div>
			<input type="hidden" maxlength="4" class="form-control" id="tel4" name="tel">
			<input type="hidden" maxlength="4" class="form-control" id="tel5" value="${infor.tel}">
		</div>
	</form>
	<div style="margin-left: 240px;margin-top:40px;">
		<button type="button" id="btnForm" class="btn btn-dark btn-lg">전송</button>
		<button type="button" id="btnCancle" class="btn btn-info btn-lg">취소</button>
	</div>
	</div>
