<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html> 
<html>
<head>
<title>게시판 목록</title>
</head>
<body>
	<div class="container">
		<div class="list-box" style="height:800px;">
			<h1 class="text-center">List page</h1>
			<div class="card">
				<div class="card-header" >
					<a href="${pageContext.request.contextPath}/board/write" class="btn btn-primary" >글쓰기</a>
				</div>
				<div class="card-body">
				<table class="table table-hover">
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
			        <td>${status.count}</td>
			        <td><a href='./read?bno=${boardVO.bno}'>${boardVO.title}</a></td>
			        <td>${boardVO.user_id}</td>
			        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
							value="${boardVO.regdate}" /></td>
			        <td>${boardVO.viewcnt}</td>
				</tr>
					</c:forEach>
			    </table>
				</div>
			</div>
     	</div>
     </div>
   </body>
</html>