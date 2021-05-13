<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container m-5">
	<h4>현재 이미지</h4>
	<br>
	<c:if test="${member.img != null}">
		<img src="${pageContext.request.contextPath}/${member.img}" width="300" height="210">
	</c:if>
	<c:if test="${member.img == null}">
		<h1>이미지가 없습니다.</h1>
	</c:if> <br><br>
	<hr>
	<form method="post" id="mform" action="${pageContext.request.contextPath}/auth/modify.do" class="row g-4"
			id="registerform" enctype="multipart/form-data">
		<div class="input-group">
			<div class="col-lg-1 ">
			  <label for="formFileLg" class="form-label">프로필 사진</label>
			</div>
			<div class="col-lg-4 ">
			  <input class="form-control" type="file" id="formFileLg" name="imgUpload" 
			  	onchange="readURL(this);" placeholder="파일 선택" accept="image/gif,image/jpeg,image/png">
			</div>
		</div>
		<hr>
		<h4>적용할 이미지</h4>
		<div class="input-group">
			<img id="blah" src="#" alt="이미지를 선택해주세요" width="300" height="250"/>
		</div>
		<div class="input-group">
			<div class="col-lg-2 ">
				<button class="btn btn-danger btn-lg" type="submit" id="uploadBtn">프로필 변경하기</button>
			</div>
			<div class="col-lg-2 ">
				<a class="btn btn-warning btn-lg" href="${pageContext.request.contextPath}/">목록가기</a>
			</div>
		</div>
		<input type="hidden" name="userid" value="${member.userid}">
	</form>
</div>
<script type="text/javascript">
    function readURL(input) {
	       if (input.files && input.files[0]) {
	           console.log(input.files);
	           
	       var reader = new FileReader();
	       reader.onload = function (e) {
	       	$('#blah').attr('src', e.target.result);
       	   }
       reader.readAsDataURL(input.files[0]);
       	}
     }
    
    $('#uploadBtn').click(function() {
    	alert('업로드 되었습니다. 다시 로그인해주세요');
    })
</script>

