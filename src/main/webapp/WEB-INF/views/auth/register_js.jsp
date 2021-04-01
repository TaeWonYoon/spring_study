<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>

$(document).ready(function() {
	setDateBox();
});

//중복확인 ajax 기능
function fn_idChk() {
		var userid = $.trim($('#userid').val());

		if(userid.length <= 4) {
			alert("아이디는 최소 5글자 입니다.");
			$('#userid').focus();
			return false;
		}

		$.ajax({
			url : "<c:url value='/' />auth/idChk",
			type : "post",
			dataType : "json",
			data : {
				"userid" : $("#userid").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
					$("#idChk").attr("value", "N");
					$('#userid').focus();
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
					console.log(userid.length);
				}
			}
		})
	}

	function setDateBox() {
		var dt = new Date();
		var year = "";
		var com_year = dt.getFullYear();
		var yM = "";
		// 발행 뿌려주기
		$("#year").append("<option value=''>년</option>");

		for (var y = (com_year - 5); y >= 1940; y--) {
			$("#year").append(
					"<option value='" + y + "'>" + y + " 년" + "</option>");
		}
		// 월 뿌려주기(1월부터 12월)
		var month;
		$("#month").append("<option value=''>월</option>");
		for (var i = 1; i <= 12; i++) {
			$("#month").append(
					"<option value='" + i + "'>" + i + " 월" + "</option>");
		}
		// 일 뿌려주기(1일부터 31일)
		var day;
		$("#day").append("<option value=''>일</option>");
		for (var i = 1; i <= 31; i++) {
			$("#day").append(
					"<option value='" + i + "'>" + i + " 일" + "</option>");
		}
	}

	// 마우스 갖다 놓고 클릭시
	$("#e2").on('mouseup', function() {
		//console.log($("#e2").val());

		if ($("#e2").val() == "") {
			$("#e3").attr('disabled', false);
		} else {
			$("#e3").attr('disabled', true);
			$("#e3").val('');
		}
	});

	//패스워드 확인
	$("#userpass2").blur(function(){
		var userpass2 = $.trim($('#userpass2').val());
		if(userpass2.length > 5) {
			if($("#userpass2").val() != $("#userpass").val()) {
				$("#passChk").html("비밀번호가 <b>다릅니다.</b>");
			} else {
				$("#passChk").html("비밀번호가 <b>같습니다.</b>");
			}
		}
	});
	
	//서브밋 전송
	$('#btn_submit').on('click', function() {
				//내용이 없을시 경고창  trim은 공백도 체크해주는기능
				var username = $.trim($('#username').val());
				var userid = $.trim($('#userid').val());
				var userpass = $.trim($('#userpass').val());
				var userpass2 = $.trim($('#userpass2').val());
				var e1 = $.trim($('#e1').val());
				var e2 = $.trim($('#e2').val());
				var e3 = $.trim($('#e3').val());
				var year = $.trim($('#year').val());
				var month = $.trim($('#month').val());
				var day = $.trim($('#day').val());
				var tel = $.trim($('#tel').val());
				var tel2 = $.trim($('#tel2').val());
				var tel3 = $.trim($('#tel3').val());
				
				
				if ($('#idChk').val() == "N") {
					alert('중복 확인을 해주세요');
					$('#usereid').focus();
					return false;
				}

				if (!username) {
					alert('이름를 입력해주세요');
					$("#username").focus();
					return false;
				}

				if (userid.length < 5) {
					alert('아이디는 5글자 이상을 입력해주세요');
					$('input[name="userid"]').focus();
					return false;
				}

				if (!userid) {
					alert('아이디를 입력해주세요');
					$("#userid").focus();
					return false;
				}

				if (userpass.length < 5) {
					alert('비밀번호 6글자 이상을 입력해주세요');
					$('input[name="userpass"]').focus();
					return false;
				}
				if (userpass != userpass2) {
					alert('비밀번호랑 비밀번호 확인값이 다릅니다.');
					return false;
				}
				
				if (!userpass) {
					alert('비밀번호를 입력해주세요');
					$("#userpass").focus();
					return false;
				}

				if((!tel) || (!tel2) || (!tel3)) {
					alert('전화번호를 등록해주세요');
					return false;
				}
				
				if (!e1) {
					alert('첫번째 이메일을 입력해주세요');
					$('#e1').focus();
					return false;
				}
				
				if((!year) || (!month) || (!day)) {
					alert('생년월일을 등록해주세요');
					return false;
				}

				//생년 월일
				var birthday = document.getElementById('birthday');
				birthday.value = $("#year").val() + '-' + $("#month").val()
						+ '-' + $("#day").val();
				//이메일
				var email = document.getElementById('e4');
				if ($("#e2").val() == "") {
					email.value = $("#e1").val() + '@' + $("#e3").val();
				} else {
					email.value = $("#e1").val() + '@' + $("#e2").val();
				}
				console.log(email);
				
				//전화번호
				var tel = document.getElementById('tel');
	 			tel.value += $("#tel2").val() + $("#tel3").val();
				console.log(tel);
				
				$('form').submit();
			});
</script>

