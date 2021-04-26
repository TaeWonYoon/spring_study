<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<div class="card">
		<div class="m-4">
			<div>
				<h4>내가 작성한 게시글</h4>
				<c:if test="${member == null }">
				<h1>로그인후 이용해주세요</h1>
				</c:if>
				<c:if test="${member != null}">
				<table class="table table-hover table-bordered" style="width:600px;">
					<tr class="table-primary">
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
				<c:forEach items="${list}" var="MyList" varStatus="status">
					<c:if test="${member.userid eq MyList.user_id}">
						<tr>
							<td>${MyList.title}</td>
							<td><a href='${pageContext.request.contextPath}/board/read?bno=${MyList.bno}&num=1'>${MyList.title}</a></td>
							<td>${MyList.user_id}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${MyList.regdate}" /></td>
							<td>${MyList.viewcnt}</td>
						</tr>
					</c:if>
				</c:forEach>
				</table>
				</c:if>
			</div>
			<div class="">
				<h4>최근 게시글</h4>
					<div style="float:left">
					<table class="table table-hover table-bordered" style="width:600px;">
						<thead class="table-primary">
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
								<td><a href='${pageContext.request.contextPath}/board/read?bno=${boardVO.bno}&num=1'>${boardVO.title}</a></td>
								<td>${boardVO.user_id}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td>${boardVO.viewcnt}</td>
							</tr>
						</c:forEach>
					</table>
					</div>
					<div style="float:right;"><b>안녕 하세여</b></div>
			</div>
		</div>
						
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
</body>
</html>
