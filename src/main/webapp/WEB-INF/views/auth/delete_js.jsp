<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

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
	
	$("#btnForm").on('click',function() {
		var userpass2 = $.trim($('#userpass2').val());
		var userpass = $.trim($('#userpass').val());
		
		if(userpass == '' || userpass2 == ''){
			alert('비밀번호를 확인해주세요');
			$("#passChk").html("비밀번호가 <b>확인해주세요.</b>");
		} else if(userpass == userpass2){
			if(userpass == $('#userpassChk').val()) {
				if(confirm('정말 삭제하시겠습니까? 복구가 불가능합니다.')) {
					alert('삭제되었습니다.')
					$('#deleteForm').submit();
				}
		   }else {
				alert('현재 비밀번호와 계정 비밀번호가 다릅니다.');
		  }
		}
		
	})
	
	
</script>