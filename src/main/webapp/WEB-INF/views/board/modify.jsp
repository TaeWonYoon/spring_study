<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
		<div class="add-box m-5">
			<div class="card">
				<div class="card-body">
					<h1>Modify Page</h1>
					<form>
						<div class="form-group m-3">
							<h5>Id</h5> <input name ="title" class="form-control" value ="${board_vo.user_id}" readonly/>
						</div>
						<div class="form-group m-3">
							<h5>Title</h5> <input name="title" class="form-control" value="${board_vo.title}">
						</div>
						<div class="form-group m-3">
							<h5>Cotent</h5> 
							<textarea id="lgth" maxlength="201" name="content" class="form-control" rows="10" cols="60" onkeyup="textCount()" >${board_vo.content}</textarea>
						</div>
						<input type="hidden" name="viewcnt" value="0" />
					
						<div class="form-group m-2">
						<c:if  test="${member.userid == board_vo.user_id}">
							<button type="submit" formaction="modify.do" formmethod="post" class="btn btn-primary btn-lg">수정하기</button>
							<button type="button" id="btnBack" class="btn btn-secondary btn-lg">수정취소</button>
						</c:if>
							<button type="submit" formaction="listAll" formmethod="get" class="btn btn-warning btn-lg">목록</button>
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
	</script>