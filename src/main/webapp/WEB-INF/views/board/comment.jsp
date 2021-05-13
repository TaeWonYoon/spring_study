<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<div class="container" style="margin-top:-100px;">
			<div class="card m-5" >
				<div class="card-body">
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="47%">
							<col width="10%">
							<col width="25%">
							<col width="8%">
						</colgroup>
						<thead class="table-warning">
							<tr>
								<td>번호</td>
								<td>댓글</td>
								<td>아이디</td>
								<td>날짜</td>
								<td>삭제</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${commentList}" var="commentVO" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td>${commentVO.comment}</td>
								<td>${commentVO.user_id }</td>
								<td>
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${commentVO.regdate}"/>
								</td>
								<td>
									<c:if test="${member.userid == commentVO.user_id}">
										<form id="deleteForm" method="get" action="./commentDelte.do" >
											<input type="hidden" name="num" value="${num}">
											<input type="hidden" name ="bno" class="form-control" value ="${board_vo.bno}"  />
											<input type="hidden"  name="commentBno" class="test" value="${commentVO.commentBno}"/>
											<button type="button" class="btn" onclick="commentDelete('${commentVO.commentBno}')" style="color:red;">X</button>
										</form>
									</c:if>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<form method="post" action="./comment.do" >
						<div class="input-group mb-3">
						  <input type="text" class="form-control" placeholder="매너글을 작성해주세요。" name="comment">
						  <input type="hidden" name ="writer" value="${board_vo.user_id}">
						  <input type="hidden" name="num" value="${num}">
						  <input type="hidden" name ="readBno" value="${board_vo.bno}">
						  <input type="hidden" name ="user_id" value="${member.userid}">
						  <div class="input-group-append">
					    	<button class="btn btn-outline-primary" type="submit" value="${member.userid}">등록</button>
					  	  </div>
						</div>
					</form>
				</div>
			</div>
		</div>
	<script>
		function commentDelete(commentBno){
			var msg = confirm("댓글을 삭제합니다");
			if(msg == true) {
				$("input[name=commentBno]").val(commentBno);
				$("#deleteForm").submit();
			} else {
				return false;
			}
		}
	</script>