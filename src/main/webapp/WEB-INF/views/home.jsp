<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/crawling.css">
	<div class="card" style="width:1618px;">
		<div class="m-5">
			<h1 style="text-align:center;margin-left:-70px;margin-bottom:3%;">
				<a href="${pageContext.request.contextPath}/" class="text_d blue">CMP</a>
			</h1>
			<div class="float-start">
				<h3>내가 작성한 게시글</h3>
				<c:if test="${member == null }">
				<h1>로그인후 이용해주세요</h1>
				</c:if>
				<c:if test="${member != null}">
				<table class="table table-hover table-bordered" style="width:700px;">
					<colgroup>
							<col width="10%">
							<col width="47%">
							<col width="10%">
							<col width="23%">
							<col width="10%">
					</colgroup>
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
				<c:forEach items="${list}" var="MyList" varStatus="status">
					<c:if test="${member.userid eq MyList.user_id}">
						<tr>
							<td class="count">${status.count}</td>
							<td><a href='${pageContext.request.contextPath}/board/read?bno=${MyList.bno}&num=1' class="writeSub">${MyList.title}</a></td>
							<td>${MyList.user_id}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${MyList.regdate}" /></td>
							<td>${MyList.viewcnt}</td>
						</tr>
					</c:if>
				</c:forEach>
				</table>
				<div id="myBoard" style="display:none;">
					<h3 style="color:red;">작성된 글이 없습니다. 글을 작성해주세요</h3>
				</div>
				</c:if>
			</div>
			<div class="" style="float:right;">
				<h3>최근 게시글</h3>
					<div style="float:left">
					<table class="table table-hover table-bordered" style="width:700px;">
						<colgroup>
								<col width="10%">
								<col width="47%">
								<col width="10%">
								<col width="23%">
								<col width="10%">
						</colgroup>
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
								<td><a href='${pageContext.request.contextPath}/board/read?bno=${boardVO.bno}&num=1' class="title writeSub">${boardVO.title}</a></td>
								<td>${boardVO.user_id}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td>${boardVO.viewcnt}</td>
							</tr>
						</c:forEach>
					</table>
					<span style="float:right;font-size:18px;">
						<a href="${pageContext.request.contextPath}/board/listAll?num=1" class="text_d">+더보기</a>
					</span>
					</div>
			</div>
		</div>
	</div>
	
	<div style="width:1618px;background:#e6f7ff;">
		<%@ include file="./crawling/crawling.jsp" %>
	</div>
	
<script>
	$(document).ready(function() {
		//자기글이 없을 경우 메세지
		if($(".count").text() == '') {
			$("#myBoard").css("display", "block");
		}
		
		//타이틀 글자수 ... subString
		var writeSub = document.getElementsByClassName("writeSub");
	    //for(var i = 0; i < $('.writeSub').length; i++) {
	      for(var i = 0; i < writeSub.length; i++) {  
	        var writeSubs = writeSub[i];
	        var writeSubsText = writeSubs.innerText;
	        if(writeSubs.innerText.length > 19) {
	            writeSubs.innerText = writeSubsText.substr(0,18) + ".....";
	        	}
	        }
	    });
</script>
