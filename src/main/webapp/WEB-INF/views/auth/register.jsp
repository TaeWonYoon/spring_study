<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="container m-5">
    <form method="post" id="rform" action="./register.do" class="row g-4" id="registerform">
      <h1>회원가입 페이지</h1>
      <div class="input-group">
        <div class="col-lg-1 ">
        <label for="exampleInputEmail1" class="form-label">이름</label>
        </div>
        <div class="col-lg-4 ">
          <input type="text" name="username" class="form-control">
        </div>
      </div>

      <div class="input-group">
        <div class="col-lg-1">
        <label for="exampleInputEmail1" class="form-label">아이디</label>
        </div>
        <div class="col-lg-4 ">
          <input type="text" name="userid" class="form-control" id="userid">
        </div>
        &nbsp;&nbsp;&nbsp;
        <div class="col-sm-5">
          <button class="btn btn-primary mb-3" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
        </div>
      </div>

      <div class="input-group">
      <div class="col-lg-1 ">
        <label for="exampleInputEmail1" class="form-label">비밀번호</label>
        </div>
        <div class="col-lg-4 ">
          <input type="password" name="userpass" class="form-control" id="" >
        </div>
      </div>

      
        <div class="input-group">
          <div class="col-lg-1 ">
            <label for="exampleInputEmail1" class="form-label">email</label>
          </div>
          <div class="col-lg-10 ">
            <input type="text" id="e1"> @ 
            <select id="e2">
              <option value="naver.com">naver.com</option>
              <option value="daum.net">daum.net</option>
              <option value="nate.com">nate.com</option>
              <option value="google.com">google.com</option>
              <option value="">직접입력</option>
            </select>
            <input type="text" name="" id="e3" value="" disabled>
            <input type="hidden" name="email" id="e4" value="">
          </div>
        </div>

        <div class="input-group">
          <div class="col-lg-1 ">
            <label for="exampleInputEmail1" class="form-label">생일</label>
            </div>
            <div class="col-lg-4 ">
    							<div class="form-inline">     					
                    <select name="year" id="year" title="년" class=""></select>
                    <select name="month" id="month" title="월" class=""></select>
                    <select name="day" id="day" title="일" class=""></select>
                    <input type="hidden" name="birthday" id="birthday" >
    							</div>
            </div>
        </div>
  </form>
  <br>
  <div style="margin-left:250px;">
  	<button id="btn_submit" class="btn btn-danger">회원가입</button>
  </div>
</div>
