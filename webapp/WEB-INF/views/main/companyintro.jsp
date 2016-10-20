<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/smartcan/assets/css/companyintro.css" rel="stylesheet" type="text/css">
<link href="/smartcan/assets/css/menubar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/menubar.js"></script>
<style>
 #STATICMENU { margin: 0 150px; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
</style>
</head>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div id="content"> 
	
	<div id="intro_main">
	<div id="intro_sub">
		<div id="brand_main">
			<h1>제품소개</h1>
		</div>
		
		<div id="about_bottom">
			<p id=highlight>ABOUT</p>
				<p>
					스마트 쓰레기통은 웹 기반과 모바일 어플리케이션으로 사용이 가능한 통합 관리 소프트웨어 서비스입니다.  <br>
					적재량 정보를 받아와 사용자가 효율적으로 쓰레기를 수거 할 수 있도록 수거 경로와 일정을 짜주며, 이를 통해 <br> 
					시간과 돈을 모두 절약 할 수 있습니다.
				</p>
		</div>
		
		<div id="first_wrap">
			<div id="about_wrap">
				<img src="/smartcan/assets/images/companyintro/location.jpg" width="840px">
			</div>	
		</div>
		
		<div id="menubar">
			<div id="STATICMENU">
			<div class="myarea_wrap">
			<div class="mymenu">
				<div class="couwrap_off">
					<p>
					서비스 이용을<br>
					위해 로그인<br>
					해주세요 <br>
					</p>
					<input type="button" class="btn_log" value="로그인" onclick="location.href='/smartcan/user/loginform';">
				</div>
				<ul class="my_lst">
					<li>
						<a href="/smartcan/map/list" class="my_m0">검색</a>
					</li>
					<li>
						<a href="/smartcan/custom/list" class="my_m1">고객센터</a>
					</li>
					<li>
						<a href="/smartcan/adver/list" class="my_m2">광고문의</a>
					</li>
					<li>
						<a href="/smartcan/location" class="my_m3">오시는 길</a>
					</li>
				</ul>
				<div class="menuwrap">
				<c:choose>
					<c:when test='${authUser.no ==1 }'>
					<p class="menu_tit">관리자 메뉴</p>
					<ul class="my_lst">
						<li>
							<a href="/smartcan/userManage" class="my_m4">회원관리</a>
						</li>
					</ul>
					</c:when>
					<c:otherwise>
					<p class="menu_tit">반가워요</p>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<a href="#" class="top">TOP</a>
			</div>
			</div>
			</div>
			
		<div id="second_wrap">
		
			<div id="set_one">
			<div id="img_one">
			<img src="/smartcan/assets/images/companyintro/fill_sensor.png" width="300px" height="200px">
			</div>
			<div id="content_one">
				<p> 1. 적재량 센서 <br> 실시간으로 모든 종류의  물질이나 폐기물을 <br> 센서를 통해 모니터링합니다.
				</p>
			</div>
			</div>
			
			<div id="set_two">
			<div id="img_two">
				<img src="/smartcan/assets/images/companyintro/tele.png" width="300px" height="200px">
			</div>
			<div id="content_two">
			<p>2. 경로 최적화 <br> 최적화된 경로를 생성하여 분석합니다.</p>
			</div>
			</div>
			
			<div id="set_three">
			<div id="img_three">
			<img src="/smartcan/assets/images/companyintro/trash_vehicle.png" width="300px" height="200px">
			</div>
			<div id="content_three">
			<p>3. 폐기물 수거 <br> 가득찬 쓰레기통을 대상으로 
			<br>가장 효율적으로 수거할 수 있습니다.</p>
			</div>
			</div>	
		</div>
		
		<div id="three_wrap">
			<div id="end_wrap">
			
			<h2 id="text_wrap"> Smart Trash Can에 광고를 신청해보세요. </h2>
			<a class="btn btn-primary" href="/smartcan/adver/list">
			<b>바로가기</b>
			</a>
			
			</div>
		</div>

	</div>
	</div>
	
	
	
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
<script type= "text/javascript">

 $(function() {
	 $( window ).scroll( function() {
         if ( $( this ).scrollTop() > 200 ) {
           $( '.top' ).fadeIn();
         } else {
           $( '.top' ).fadeOut();
         }
       } );
       $( '.top' ).click( function() {
         $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
         return false;
       } );
       
       
}); 

 </script>
</html>