<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	
	$(document).ready(function() {
		$("#tel1").val($("#tel5").val().substring(0,3));
		$("#tel2").val($("#tel5").val().substring(3,7));
		$("#tel3").val($("#tel5").val().substring(7,11));
	});
	
	$("#userpass2").blur(function(){
		var userpass2 = $.trim($('#userpass2').val());
		var userpass = $.trim($('#userpass').val());
			if(userpass2.length > 5) {
				if($("#userpass2").val() != $("#userpass").val()) {
					$("#passChk").html("비밀번호가 <b>다릅니다.</b>");
				} else {
					$("#passChk").html("비밀번호가 <b>같습니다.</b>");
				}
			}
	});
	
	$("#btnForm").on("click", function() {
		var userpass = $.trim($('#userpass').val());
		var userpass2 = $.trim($('#userpass2').val());
		$("#tel4").val($("#tel1").val() + $("#tel2").val() + $("#tel3").val());
		
		if(!userpass || userpass.length < 5 || userpass != userpass2) {
			alert('비밀번호를 확인해주세요');
			return false;
		}
		alert('변경되었습니다. 다시 로그인해주세요');
		$("#mform").submit();
	});
	$("#btnCancle").on("click", function() {
		location.href = "../";
	});
</script>
