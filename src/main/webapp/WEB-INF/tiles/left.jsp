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
						<img src="${pageContext.request.contextPath}/userImg/dog.png" width="80%"alt="이미지nos">
					</li>
				</ul>
			</div>
			<br>
			<div>
				<span class="loginNo">저희 홈페이지는 <br> 로그인후 사용 가능합니다.</span> <br />
				<span class="loginNo">로그인후 이용해주시기 <br>바랍니다.</span>	
			</div>
			<br><br><br><br>
			<img src="${pageContext.request.contextPath}/img/airport.png" alt="이미지no" width="40%" >
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
				<c:if test="${member.img != null}">
					<li class="list-group-item ms-2" id="profile_img">
						<img src="${pageContext.request.contextPath}/${member.img}" width="210" height="150" alt="이미지nos">
					</li>
				</c:if>
				<c:if test="${member.img == null}">
					<li class="list-group-item ms-2" id="profile_img">
						<div style="width:210px; height:150px;">
							<h2>이미지를 업로드 해주세요.</h2>
							내정보 변경을 이용해주세요.
						</div>
					</li>
				</c:if>
					<li class="list-group-item ms-2">
						<span>등급 :</span> <span class="ifm">${member.level}</span>
					</li>
					<li class="list-group-item ms-2">
						<span>이름 :</span> <span class="ifm">${member.username}</span>
					</li>
					<li class="list-group-item ms-2">
						<span>아이디 :</span> <span class="ifm">${member.userid}</span>
					</li>
					<li class="list-group-item ms-2">
						<span>생일 :</span> <span class="ifm">${member.birthday}</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="card-body">
			<h4 class="card-title m-1">회원 정보</h4>
			<span style="margin-left: 3%; color: #b3ffb3; font-weight: 600;">
				<span style="color:red;font-weight:bold;font-size:21px;">▷</span> 정보 수정 및 페이지
			</span>
			<div class="col-12 m-1">
				<div class="list-group" id="list-tab" role="tablist">
						<a href="${pageContext.request.contextPath}/auth/imgUpload" class="list-group-item list-group-item-action active">
							프로필변경
						</a>
						<a href="${pageContext.request.contextPath}/auth/modify?userid=${member.userid}" class="list-group-item list-group-item-action active">
							내정보 변경
						</a>
						<a href="${pageContext.request.contextPath}/auth/delete" class="list-group-item list-group-item-action active">
							회원탈퇴
						</a> 
						<a href="${pageContext.request.contextPath}/board/listAll?num=1" class="list-group-item list-group-item-action active">
							게시글페이지
						</a>
					<c:if test="${member.level eq 3}">
						<a href="${pageContext.request.contextPath}/admin/admin" class="list-group-item list-group-item-action active">
							관리자페이지
						</a>
					</c:if>
				</div>
			</div>
		</div>
	</c:if>
</div>
<div class="card-footer">
		<h3>기타</h3>
		<div class="list-group" id="list-tab" role="tablist">
						<a href="${pageContext.request.contextPath}/map/map" class="list-group-item list-group-item-action">
							길찾기
						</a>
		</div>
		<h1 class="text-center" style="border:2px solid black; background: red;">&#60</h1>
</div>
