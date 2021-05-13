<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>파일 업로드</h1>
<form action="./upload.do" method="post" enctype="multipart/form-data">
    <input type="file" name="files" placeholder="파일 선택" accept="image/gif,image/jpeg,image/png"/><br/>
    <input type="submit" value="업로드">
</form>
<br>
