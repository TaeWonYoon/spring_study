<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/left.css">
<div class="card cardbg">
	<div class="card-header" id="profile_n">
		<a href="${pageContext.request.contextPath}/" id="profile_name">CMP</a>
	</div>


	<c:if test="${member == null }">
		<div class="card-header">
			<a href="${pageContext.request.contextPath}/auth/login" class="btn btn-success" >로그인</a>
			<a href="${pageContext.request.contextPath}/auth/register" class="btn btn-warning" style="float:right;">회원가입</a>
		</div>
		<div class="card-body">
			<div>
				<ul class="list-group">
					<li class="list-group-item ms-2" id="profile_img">
						<img src="${pageContext.request.contextPath}/img/dog.png" alt="이미지no">
					</li>
				</ul>
			</div>
			<br>
			<div>
				<span class="loginNo">저희 홈페이지는 <br> 로그인후 사용 가능합니다.</span> <br />
				<span class="loginNo">로그인후 이용해주시기 <br>바랍니다.</span>	
			</div>
			<br><br><br><br>
			<img src="${pageContext.request.contextPath}/img/airport.png" alt="이미지no" width="80" height="80">
		</div>
	</c:if>


	<c:if test="${member != null }">
		<div class="card-header">
			<span style="font-weight: bold;"> ${member.username}</span>님 환영합니다. <a
				href="${pageContext.request.contextPath}/auth/logout"
				class="btn btn-warning">로그아웃</a>
		</div>
		<div class="card-body">
			<div>
				<ul class="list-group">
					<li class="list-group-item ms-2" id="profile_img"><img
						src="${pageContext.request.contextPath}/img/dog.png" width="80%" alt="이미지no">
					</li>
					<li class="list-group-item ms-2"><span>등급 :</span> <span
						class="ifm">${member.level}</span></li>
					<li class="list-group-item ms-2"><span>이름 :</span> <span
						class="ifm">${member.username}</span></li>
					<li class="list-group-item ms-2"><span>아이디 :</span> <span
						class="ifm">${member.userid}</span></li>
					<li class="list-group-item ms-2"><span>생일 :</span> <span
						class="ifm">${member.birthday}</span></li>
				</ul>
			</div>
		</div>
		<div class="card-body">
			<h4 class="card-title m-1">회원 정보</h4>
			<span style="margin-left: 3%; color: #b3ffb3; font-weight: 600;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-arrow-right-square-fill"
					viewBox="0 0 16 16">
  					<path
						d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z" />
				</svg> 정보 수정 및 로그아웃
			</span>
			<div class="col-12 m-1">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-home-list"
						href="${pageContext.request.contextPath}/auth/modify?userid=${member.userid}"
						role="tab" aria-controls="home">내정보 변경</a> <a
						class="list-group-item list-group-item-action active"
						id="list-profile-list"
						href="${pageContext.request.contextPath}/auth/delete" role="tab"
						aria-controls="profile">회원탈퇴</a> <a
						class="list-group-item list-group-item-action active"
						id="list-profile-list"
						href="${pageContext.request.contextPath}/board/listAll?num=1"
						class="btn btn-warning" role="tab" aria-controls="profile">게시글페이지</a>
				</div>
			</div>
		</div>
	</c:if>
</div>
<div class="card-footer">
	<h1 class="text-center"
		style="border: 2px solid black; background: red;">&#60</h1>
</div>
