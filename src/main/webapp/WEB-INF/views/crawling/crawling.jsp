<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="card"style="width:50%;height:600px;float:left;">
		<div class="card-header">
			<h2>날씨 보기</h2>
		</div>
		<div class="card-body">
			<img src="${pageContext.request.contextPath}/img/sun.jpg" width="120" height="120">
			<h2>${weather}</h2><br>
			<h4>${summary}</h4>
			<div>${chart_list}</div><br><br>
			<div>${summaryList}</div>
		</div>
		<div class="card-footer">
				<h4 align="center"><a href="https://weather.naver.com/today/09140104">+날씨 사이트가기</a></h4>
				
		</div>
	</div>
	
	<div class="card" style="width:50%;height:600px;float:left;	">
			<div class="card-header">
				<h2>뉴스 보기</h2>
			</div>
			<div class="card-body">
				<h3 style="margin-top:10px;">헤더라인 뉴스</h3>
				<br>
					<div class="black n_fsize" style="color:#4d4d4d;">
						<span>1. </span><span>${comHeader0}</span>
					</div> <br>
					<div class="black n_fsize">
						<span>2. </span><span>${comHeader1}</span>
					</div> <br>
					<div class="black n_fsize">
						<span>3. </span><span>${comHeader2}</span>
					</div> <br>
					<div class="black n_fsize">
						<span>4. </span><span>${comHeader3}</span>
					</div> <br>
					<div class="black n_fsize">
						<span>5. </span><span>${comHeader4}</span>
					</div> <br>
			</div>
			<div class="card-footer">
				<h4 align="center"><a href="https://weather.naver.com/today/09140104">+뉴스 사이트가기</a></h4>
			</div>
	</div>
			
<script>
$('.item_inner').attr("href", "https://weather.naver.com/air/09140104");
</script>
</body>

</html>