<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
function fn_idChk() {
 	$.ajax({
   		url : "<c:url value='/' />auth/idChk",
   		type : "post",
   		dataType : "json",
   		data : {"userid" : $("#userid").val()},
   		success : function(data){
   			if(data == 1){
   				alert("중복된 아이디입니다.");
   				$('#userid').focus();
   				console.log(data);
   			}else if(data == 0){
   				$("#idChk").attr("value", "Y");
   				alert("사용가능한 아이디입니다.");
   				console.log(data);
   				}
   			}
   		})
}
$(document).ready(function () {
      	setDateBox();
    	});

function setDateBox() {
      var dt = new Date();
      var year = "";
      var com_year = dt.getFullYear();
      var yM = "";
      // 발행 뿌려주기
      $("#year").append("<option value=''>년</option>");
  
      
      for (var y = (com_year-5); y >= 1940; y--) {
        $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
      }
  
      // 월 뿌려주기(1월부터 12월)
      var month;
      $("#month").append("<option value=''>월</option>");
      for (var i = 1; i <= 12; i++) {
        $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
      }
  
      // 일 뿌려주기(1일부터 31일)
      var day;
      $("#day").append("<option value=''>일</option>");
      for (var i = 1; i <= 31; i++) {
        $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
      }
  }

  // 마우스 갖다 놓고 클릭시
   $("#e2").on('mouseup', function(){
    var email = document.getElementById('e4');
    //console.log($("#e2").val());
    
    if($("#e2").val() == "") {
      $("#e3").attr('disabled', false);
      } else {
        $("#e3").attr('disabled', true);
        $("#e3").val('');
      };
   });
    

    $('#btn_submit').on('click', function() {
      var birthday = document.getElementById('birthday');
      birthday.value = $("#year").val() + '-' + $("#month").val() + '-' + $("#day").val();
      if($("#e2").val() == "") {
        email = $("#e1").val() + '@' + $("#e3").val();
      } else {
          email = $("#e1").val() + '@' + $("#e2").val();
    }
      $('form').submit();
    });

    
    
    
</script>

