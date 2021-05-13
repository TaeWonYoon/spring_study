<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function textCount() {
    var maxCount = $('#lgth').prop('maxlength');
    if ($('#lgth').val().length > 200) {
       $('#lgth').val($('#lgth').val().substring(0,(maxCount-1)));
        alert('200자까지 작성할 수 있습니다.');
    }
    $('#TextCount').text('(' + $('#lgth').val().length + '/' + ((maxCount)-1) + '자)');
}
function readURL(input) {
    if (input.files && input.files[0]) {
        console.log(input.files);
        
    var reader = new FileReader();
    reader.onload = function (e) {
    	$('#blah').attr('src', e.target.result);
	   }
reader.readAsDataURL(input.files[0]);
	}
}
$("#btnSub").click(function() {
	
	var title = $.trim($('#title').val());
	var lgth =$.trim($('#lgth').val());
	if(!title) {
		alert("제목을 입력해주세요");
		return false;
	}
	if(!lgth) {
		alert("내용을 입력해주세요");
		return false;
	}
	
	$("#write").submit();
})
</script>