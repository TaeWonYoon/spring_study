<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${member.userid == null || member.level < 3}"  >
	<script>
		alert('권한없음');
		location.href = '${pageContext.request.contextPath}/';
	</script>
</c:if>
<div class="container m-5">
			<h1 class="text-center" style="margin-right:6%;margin-bottom:3%;">List page</h1>
			
			<div class="card" style="margin-left: 8%;">
				<div class="card-header">
					<div class="float-end">
					<form id="fm_search" method="get" class="form-select form-select-sm mb-2" aria-label=".form-select-lg example">
					<select name="condition">
					<option value="title">이름</option>
					<option value="user_id">등급</option>
					</select>
					<input name="content" id="content">
					<button type="button" id="search" class="btn btn-success">검색</button>
					<input type="hidden"  name="num" value="1">
					</form>
					</div>
				</div>
				<div class="card-body">
					<table class="table table-hover" height="450">
						<thead class="thead-dark">
							<tr>
								<td><p>번호</p></td>
								<td><p>등급</p></td>
								<td><p>아이디</p></td>
								<td><p>이름</p></td>
								<td><p>생일</p></td>
								<td><p>가입날짜</p></td>
								<td><p>수정</p></td>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${admin}" var="adminList" varStatus="status">
							<c:if test="${member.userid != adminList.userid}">
							<form id="adMinmodify" method="post" action="./admin.do" >
							<tr>			
								<td>${status.count}</td>
								<td>
									<select name="level" style="width:45px;">
										<c:choose>
											<c:when test="${adminList.level eq 3}">
												<option value="3" selected>3</option>
												<option value="2" >2</option>
												<option value="1">1</option>
											</c:when>
											<c:when test="${adminList.level eq 2}">
												<option value="3">3</option>
												<option value="2" selected>2</option>
												<option value="1">1</option>
											</c:when>
											<c:otherwise>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1" selected>1</option>
											</c:otherwise>
										</c:choose>
									</select>
								</td>
								<td>${adminList.userid}</td>
								<td>${adminList.username}</td>
								<td>${adminList.birthday}</td>
								<td>${adminList.regdate}</td>
								<td>
									<input type="hidden" name="userid" value="${adminList.userid}">
									<button type="submit" class="btn btn-warning" style="margin-left: -13px;">수정</button>
								</td>
							</tr>
						</form>
						</c:if>
					</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<script>
		$("button[type=submit]").click(function() {
			alert('수정되었습니다.');
		})
		function adminModify(userid,level){
			console.log(level);
			console.log($("input[name=level]").val());
			var msg = confirm("댓글을 수정합니다");
			if(msg == true) {
				$("input[name=userid]").val(userid);
				$("input[name=level]").val(level);
				$("#adMinmodify").submit();
			} else {
				return false;
			}
		}
		
		</script>