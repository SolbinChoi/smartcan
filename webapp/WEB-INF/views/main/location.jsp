<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/smartcan/assets/css/location.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=58419160bc8ff11be1b0bd521678c6ac"></script>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div id="content">
			<div class="container_map">
				<div class="container_mapsub">

					<div id="store_header">
						<div id="store">
							<h1 id="sub_h1">오시는 길</h1>
						</div>
						<div id="txt_header">
							<p>저희 Smart Can에 오시는 길을 알려드립니다.</p>
						</div>
					</div>
					
					<div id="mid_wrap">
						<div id="map_btn">
							<p>
								<button id="pan" onclick="panTo()">위치 이동</button>
							</p>
						</div>
						
						<div class="map_wrap">
						    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
						    <!-- 지도타입 컨트롤 div 입니다 -->
						    <div class="custom_typecontrol radius_border">
						        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
						        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
						    </div>
						    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
						    <div class="custom_zoomcontrol radius_border"> 
						        <span onclick="zoomIn()"><img src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" alt="확대"></span>  
						        <span onclick="zoomOut()"><img src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" alt="축소"></span>
						    </div>
						</div>
					
						<div class="subway">
						  <img src="/smartcan/assets/images/map/subway.gif" />
						</div>
					
					</div>
					
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new daum.maps.LatLng(37.3800184,126.9264758), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(37.3800184,126.9264758); 

	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	function panTo() {
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng(37.3800184,126.9264758);
	    
	    // 지도 중심을 부드럽게 이동시킵니다
	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	    map.panTo(moveLatLon);            
	}        

	//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) { 
	var roadmapControl = document.getElementById('btnRoadmap');
	var skyviewControl = document.getElementById('btnSkyview'); 
	if (maptype === 'roadmap') {
	    map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
	    roadmapControl.className = 'selected_btn';
	    skyviewControl.className = 'btn';
	} else {
	    map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
	    skyviewControl.className = 'selected_btn';
	    roadmapControl.className = 'btn';
	}
	}
	
	//지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
	map.setLevel(map.getLevel() - 1);
	}
	
	//지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
	map.setLevel(map.getLevel() + 1);
	}
	
</script>
</html>