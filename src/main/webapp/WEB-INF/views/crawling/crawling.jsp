<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="card"style="width:50%;height:600px;float:left;">
		<div class="card-header">
			<h2>날씨 보기</h2>
		</div>
		<br>
		<div class="card-body">
			<img src="${pageContext.request.contextPath}/img/sun.jpg" width="120" height="120">
			<h2>${weather}</h2><br>
			<h4>${summary}</h4><br>
			<span>${chart_list}</span> <br><br><br>
			<h4 align="center"><a href="https://weather.naver.com/today/09140104">뉴스 사이트가기 +</a></h4>
			
		</div>
	</div>
	
	<div class="card" style="width:50%;float:left;	">
				<h2>뉴스 보기</h2>
	</div>
			
<script>
$('.item_inner').attr("href", "https://weather.naver.com/air/09140104");
</script>
</body>

</html>