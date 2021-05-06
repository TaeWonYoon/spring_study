<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="width:1200px;margin:0 auto;margin-top:5%;">
<h3 align="center">회사 위치</h3>
<div id="map" style="width:800px; margin:0 auto; height:650px;"></div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4881c60812cc591ba46b5eb84acd31f"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.5846507, 126.9229987), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var marker = new kakao.maps.Marker();

// 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

function displayMarker() {
    
    // 마커의 위치를 지도중심으로 설정합니다 
    marker.setPosition(map.getCenter()); 
    marker.setMap(map); 

    // 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
    // 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
    // kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
}
</script>
