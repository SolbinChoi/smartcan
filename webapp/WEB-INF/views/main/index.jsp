<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/smartcan/assets/css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="/smartcan/assets/js/slideShow.js"></script>
<style>
    #slideShowImages { /* css  */
      border: 1px #f7f7f7 solid;
    }   
  
    #slideShowImages img { /* css */
      border: 0.8em white solid;
      padding: 3px;
    }   
    #STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
  </style>

<script type="text/javascript">
var stmnLEFT = 200; // 오른쪽 여백 
var stmnGAP1 = 20; // 위쪽 여백 
var stmnGAP2 = 200; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
var stmnBASE = 150; // 스크롤 시작위치 
var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 23; //스크롤 속도 (클수록 느림)
var stmnTimer; 

function RefreshStaticMenu() { 
 var stmnStartPoint, stmnEndPoint; 
 stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
 stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
 if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
 if (stmnStartPoint != stmnEndPoint) { 
  stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
  document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
  stmnRefreshTimer = stmnScrollSpeed; 
  }
 stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
 } 
function InitializeStaticMenu() {
 document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
 document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
 RefreshStaticMenu();
 }
 </script>
</head>
<body onload="InitializeStaticMenu();">
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div id="content">

<div id="intro_main">
	<div id="intro_sub">

			<div id="event_slide">
			<div id="slideShowImages"> <!--  slideShowImages는 원하는 슬라이드 쇼 이미지를 가리키는 <img> 요소를 포함 -->
		    <img src="/smartcan/assets/images/index/img1.jpg" alt="Slide 1" />
		    <img src="/smartcan/assets/images/index/img2.JPG" alt="Slide 2" />
		    <img src="/smartcan/assets/images/index/img3.JPG" alt="Slide 3" />    
		    <img src="/smartcan/assets/images/index/img4.JPG" alt="Slide 4" />
		    <img src="/smartcan/assets/images/index/img5.JPG" alt="Slide 5" />
			</div>  
			<img src="/smartcan/assets/images/index/stop.png" id="slideShowButton"></img> <!-- Optional button element. -->
			
			</div>
			
			
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
						<a href="/smartcan/location" class="my_m3">찾아오시는 길</a>
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
			
			
			
			<div id="first_wrap">
				<div id="fresh_photo">
					<img src="/smartcan/assets/images/index/path.png" width=450px />
				</div>
				
				
				<div id="about_top">
							<div id="ban1">
							<a href="/smartcan/companyintro">
							<span><h3>Smart trash can introduction </h3></span>
							<span>"일상 속에서 편리하게 사용할 수 있는 쓰레기통으로" <br>
							"편리함을 느껴보세요."
							</span>
							</a>
							</div>
				</div>
				<div id=about_bottom>
							<div id="ban2">
							<a href="/smartcan/board/customlist">
							<span><h3>Smart tash can board</h3></span>
							<span>"스마트 쓰레기통의 불편한점이 있었나요?" <br>
							"여기를 클릭하세요."
							</span>
							</a>
							</div>
				</div>	
			
			</div>


			<div id="end_wrap"> 
			
				<div id="daily_wrap">
					<p id="highlight">잦은 수거로 인한 이산화탄소가 줄어듭니다. </p>
					<p id="highlight2"> 하루가 시작되고 잠깐의 휴식이 되어 머무르고, <br> 하루의 마무리를 같이하는
					스마트 쓰레기통 <br>
					</p>
				</div>
				
				<div id="refresh_photo">
					<img src="/smartcan/assets/images/index/route.jpg"/>
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
	 
	 $('#slideShowButton').on("click", function(){
	      var src = ($(this).attr("src") === "/smartcan/assets/images/index/stop.png") 
	         ? "/smartcan/assets/images/index/play.png"
	         : "/smartcan/assets/images/index/stop.png";
	      $(this).attr("src", src);
	   });
	 
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