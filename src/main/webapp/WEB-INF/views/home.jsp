<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<div class="m-4">
		<div>
			<h4>내가 작성한 게시글</h4>
			<table>
			
			<c:forEach items="${list}" var="MyList" varStatus="status">
			
				<c:if test="${member.userid eq MyList.user_id}">
					<tr><th>제목</th><th>작성자</th></tr>
					<tr><td>${MyList.title}</td><td>${MyList.user_id}</td></tr>
				</c:if>
				
			</c:forEach>
			</table>
		</div>
		<div>
			<h4>인기 게시글</h4>
		</div>
		<div>
			<h4>최근 게시글</h4>
			<div>
					<table class="table table-bordered" height="200">
						<colgroup>
					        <col width="30px"/>
					        <col width="130px"/>
					        <col width="30px"/>
					        <col width="30px"/>
					        <col width="30px"/>
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
					<div style="float:right;"><b>안녕 하세여</b></div>
					<%--  

					<table class="table table-hover" height="200" style="float:left;">
						<colgroup>
						    <col width="120px"/>
						    <col width="230px"/>
						    <col width="70px" />
						    <col width="230px" />
						</colgroup>
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
					--%>
				</div>
		</div>
	</div>

</body>
</html>
