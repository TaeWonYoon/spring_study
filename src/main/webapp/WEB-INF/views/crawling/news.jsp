<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.hdline_article_tit a{
		color:black;
	}

</style>
</head>
<body>
	<div class="card" style="width:50%;float:left;	">
			<div class="card-header">
				<h2>뉴스 보기</h2>
			</div>
			<div class="card-body" style="list-style:none;">
				<h4>헤더라인 뉴스</h4>
					<span class="blue">
						${comHeader0}
					</span> <br>
					<span class="blue">
						${comHeader1}
					</span> <br>
					<span class="blue">
						${comHeader2}
					</span> <br>
					<span class="blue">
						${comHeader3}
					</span> <br>
					<span class="blue">
						${comHeader4}
					</span> <br>
			</div>
	</div>
</body>
</html>