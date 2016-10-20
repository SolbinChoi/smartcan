<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/smartcan/assets/css/statistic.css" rel="stylesheet" type="text/css">
<link href="/smartcan/assets/css/menubar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="/smartcan/assets/js/menubar.js"></script>
<script>
	//스트립트 로딩과 차트 초기화
	google.charts.load('current', {packages:['corechart']});
	
	// 로딩 완료시 함수 실행하여 차트 생성 
	google.charts.setOnLoadCallback(drawChart);
	function drawChart(){
		
		// 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
		    ['항목','통계량'], //항목정의
		    ['안양',${map.anyang}],
		    ['서울',${map.seoul}],
		    ['인천',${map.incheon}]
		  ]);
		
		
		// 그래프 옵션
		var options = {
			title : '일일 쓰레기 통계량', // 제목
			width: 450, // 가로 px
			height: 500, // 세로px
			bar : {
				groupWidth: '60%' // 그래프 너비 설정 %
			},
			legend: {
				position : 'none' // 항목 표시 여부 (현재 설정 안함)
			}
		};
		
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}

</script>
<script>
//스트립트 로딩과 차트 초기화
  google.charts.load("current", {packages:["corechart"]});
  
	// 로딩 완료시 함수 실행하여 차트 생성 
  google.charts.setOnLoadCallback(drawChart);
	
  function drawChart() {
	  
	// 차트 데이터 설정
    var data = google.visualization.arrayToDataTable([
      ['항목', '통계량'],
      ['안양',${map.anyangCount}],
      ['인천',${map.incheonCount}],
      ['서울', ${map.seoulCount}]
    ]);

    var options = {
      title: '스마트 쓰레기통 설치 수',
      is3D: true,
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
    chart.draw(data, options);
  }
  
  </script>
  <style>
 #STATICMENU { margin: 0 150px; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
</style>
</head>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div id="content">
<div id="main_chart">
	<div id="brand_main">
		<h1>통계량</h1>
		<p></p>
	</div>
	<div id="chart_wrap">
		<div id="chart_left">
			<div id="chart_div"></div> <!-- 여기에 차트가 생성됩니다. div id="chart_div" 건들이지 말 것 -->
		</div>
		<div id="chart_right">
			<div id="piechart_3d" style="width: 650px; height: 700px;"></div> <!-- piechart_3d 건들이지 말 것 -->
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