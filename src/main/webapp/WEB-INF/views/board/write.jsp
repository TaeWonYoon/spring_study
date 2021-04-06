<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="container">
		<div class="add-box m-5">
			<div class="card">
				<div class="card-body">
					<h1>Write Page</h1>
					<form method="post" action="${pageContext.request.contextPath}/board/write.do">
						<div class="form-group m-3">
							<h5>Id</h5> <input name="user_id" value="${member.userid}" class="form-control"readonly />
						</div>
						<div class="form-group m-3">
							<h5>Title</h5> <input name="title" class="form-control">
						</div>
						<div class="form-group m-3">
							<h5>Cotent</h5> (<span style="color:red;font-size:12px;">200글자 이상x</span>) 
							<textarea id="lgth" maxlength="201" name="content" class="form-control" rows="10" cols="60" onkeyup="textCount()"></textarea>
							<span id="TextCount" class="sd-ant-style-warn">(0자/200자)</span>
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
