<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
		<div class="m-5">
			<div class="card">
				<div class="card-body">
					<h1>글 내용</h1>
					<form id="readDelete">
						<div class="form-group m-3">
							<h5>Id</h5> <input name ="title" class="form-control" value ="${board_vo.user_id}" readonly="readonly"/>
						</div>
						<div class="form-group m-3">
							<h5>Title</h5> <input name="title" class="form-control" value="${board_vo.title}" readonly>
						</div>
						<div class="form-group m-3">
							<h5>Cotent</h5> 
							<div style="border: 1px solid #ced4da;border-radius: 4px;width:1134px;height:400px;background:#e9ecef;">
								<c:if test="${board_vo.img != null }">
									<div style="text-align:center; margin-top:15px;">
									<img src="${pageContext.request.contextPath}/${board_vo.img}" width="300" height="200"/>
									</div>
								</c:if>
								<p style="font-size: 21px;">${board_vo.content}</p>
							</div>
							
							<input type="hidden" id="lgth" maxlength="201" name="content" value="${board_vo.content}" readonly/>
						</div>
						<input type="hidden" name="viewcnt" value="0" />
						<div class="form-group m-2">
							<c:if  test="${member.userid == board_vo.user_id}">
								<button type="submit" formaction="modify" formmethod="get" class="btn btn-primary btn-lg">수정</button>
								<button type="button" class="btn btn-danger btn-lg" data-bs-toggle="modal" data-bs-target="#staticBackdrop">삭제</button>
							</c:if>
							<input type="hidden" name="num" value="${num}">
							<button type="button" id="list" class="btn btn-warning btn-lg">목록</button>
						</div>
						<input type="hidden" name ="bno" class="form-control" value ="${board_vo.bno}"  />
					</form>
				</div>
			</div>
			
			<!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel" style="color:red;">댓글 삭제</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                    <div class="modal-body">
                        <br>
                        <h4>삭제하시겠습니까?</h4>
                        <br>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="dlt">삭제함</button>
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
   </div>    
			<br>
		<%@ include file="./comment.jsp" %>
		</div>
	<script>
		$('#dlt').on('click', function(){
				$('#readDelete').attr("method", "post");
				$('#readDelete').attr("action", "./delete.do");
				$('#readDelete').submit();
		});
		$("#list").click(function() {
			var numValue = $("input[name=num]").val();
			location.href = "./listAll?num="+numValue;
		});
	</script>