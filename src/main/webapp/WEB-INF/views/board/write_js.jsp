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
</script>