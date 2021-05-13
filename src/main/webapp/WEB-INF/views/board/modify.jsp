<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:if test="${member.userid != board_vo.user_id}">
	<script>location.href = '${pageContext.request.contextPath}/'</script>
</c:if>
<div class="container">
		<div class="add-box m-5">
			<div class="card">
				<div class="card-body">
					<h1>게시판 수정하기</h1>
					<form enctype="multipart/form-data">
						<div class="form-group m-3">
							<h5>Id</h5> <input name ="id" class="form-control" value ="${board_vo.user_id}" readonly/>
						</div>
						<div class="form-group m-3">
							<h5>Title</h5> <input name="title" class="form-control" value="${board_vo.title}">
						</div>
						<div class="form-group m-3">
							<h5>Cotent</h5> 
							<textarea id="lgth" maxlength="201" name="content" class="form-control" rows="10" cols="60" onkeyup="textCount()" >${board_vo.content}</textarea>
						</div>
						<div class="form-group m-3">
							<h4>현재 이미지</h4>
							<img src="${pageContext.request.contextPath}/${board_vo.img}" id="blah" width="200" height="130" alt="등록된 사진이 없습니다."/>
							<input class="form-control" type="file" id="formFileLg" name="imgUpload" 
				  					onchange="readURL(this);" placeholder="파일 선택" accept="image/gif,image/jpeg,image/png"> <br>
						</div>
							<input type="hidden" name="viewcnt" value="0" />
					
						<div class="form-group m-2">
						<c:if  test="${member.userid == board_vo.user_id}">
							<button type="submit" formaction="modify.do" formmethod="post" class="btn btn-primary btn-lg">수정하기</button>
							<button type="button" id="btnBack" class="btn btn-secondary btn-lg">수정취소</button>
						</c:if>
						</div>
					<input type="hidden" name ="bno" class="form-control" value ="${board_vo.bno}"  />
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#btnBack').on('click',function() {
			history.back();
		});
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
	</script>