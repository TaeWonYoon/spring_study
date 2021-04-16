<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div class="container">
		<div class="list-box" style="height: 800px;">
			<h1 class="text-center" style="margin-right:15%">List page</h1>
			<div class="card">
				<div class="card-header">
					<a href="${pageContext.request.contextPath}/board/write"
						class="btn btn-primary">글쓰기</a>
					<div class="float-end">
					<form id="fm_search" method="get" class="form-select form-select-sm mb-2" aria-label=".form-select-lg example">
					<select name="condition">
					<option value="search_t">검색</option>
					<option value="title">제목</option>
					<option value="user_id">작성자</option>
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
								<td>
									<p>글번호</p>
								</td>
								<td>
									<p>제목</p>
								</td>
								<td>
									<p>작성자</p>
								</td>
								<td>
									<p>작성일</p>
								</td>
								<td>
									<p>조회수</p>
								</td>
							</tr>
						</thead>

						<c:forEach items="${list}" var="boardVO" varStatus="status">
							<tr>
								<!--  <td>${status.count}</td> -->
								<td>${boardVO.bno}</td>
								<td><a href='./read?bno=${boardVO.bno}&num=${select}'>${boardVO.title}</a></td>
								<td>${boardVO.user_id}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td>${boardVO.viewcnt}</td>
							</tr>
						</c:forEach>
					</table>
					<div class="pagination">
						<c:if test="${page.prev}">
						 	<li class="page-item"><a href="${pageContext.request.contextPath}/board/listAll?num=${page.startPageNum - 1}" class="page-link">이전</a> </li>
						</c:if>
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
						  	<li class="page-item active">
						   	<a href="${pageContext.request.contextPath}/board/listAll?num=${num}" id="num" class="page-link">${num}</a> 
						 </li>
						</c:forEach>
						<c:if test="${page.next}">
						 	<li class="page-item"><a href="${pageContext.request.contextPath}/board/listAll?num=${page.endPageNum + 1}" class="page-link">다음</a></li>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button class="btn btn-danger" id="back_btn">뒤로가기</button>
	
	<script>
		$('#search').on('click', function() {
			if ($('#content').val() == '') {
				$("#fm_search").attr("action", "./listAll").submit();
				return false;
			}
			else {
				$("#fm_search").attr("action", "./listTest.do").submit();
			}
		})
	</script>
