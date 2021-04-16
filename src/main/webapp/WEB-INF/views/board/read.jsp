<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
		<div class="m-5">
			<div class="card">
				<div class="card-body">
					<h1>Read Page</h1>
					<form>
						<div class="form-group m-3">
							<h5>Id</h5> <input name ="title" class="form-control" value ="${board_vo.user_id}" readonly="readonly"/>
						</div>
						<div class="form-group m-3">
							<h5>Title</h5> <input name="title" class="form-control" value="${board_vo.title}">
						</div>
						<div class="form-group m-3">
							<h5>Cotent</h5> 
							<textarea id="lgth" maxlength="201" name="content" class="form-control" rows="10" cols="60" onkeyup="textCount()" readonly>${board_vo.content}</textarea>
						</div>
						<input type="hidden" name="viewcnt" value="0" />
						<div class="form-group m-2">
							<c:if  test="${member.userid == board_vo.user_id}">
								<button type="submit" formaction="modify" formmethod="get" class="btn btn-primary btn-lg">수정</button>
								<button type="button" id="dlt" class="btn btn-danger btn-lg">삭제</button>
							</c:if>
							<button type="submit" formaction="listAll" formmethod="get" class="btn btn-warning btn-lg">목록</button>
							<input type="hidden" name="num" value="${num}">
						</div>
					<input type="hidden" name ="bno" class="form-control" value ="${board_vo.bno}"  />
					</form>
				</div>
			</div>
		</div>
		
		<div class="m-5">
			<div class="card">
					<table>
					<tr><th>댓글</th></tr>	
					<tr><th>댓글</th></tr>		
					<tr><th>댓글</th></tr>						
					</table>
			</div>
		</div>
	</div>
	
	
	<script>
		$('#dlt').on('click', function(){
			if(confirm('정말 삭제하시겠습니까')) {
				$('form').attr("method", "post");
				$('form').attr("action", "./delete.do");
				$('form').submit();
				alert('삭제했습니다.');
			}
		});
	</script>