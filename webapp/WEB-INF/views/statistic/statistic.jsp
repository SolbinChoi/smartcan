<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/mysite5/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
	//스트립트 로딩과 차트 초기화
	google.charts.load('current', {packages:['corechart']});
	
	// 로딩 완료시 함수 실행하여 차트 생성 
	google.charts.setOnLoadCallback(drawChart);
	function drawChart(){
		// 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
		    ['항목','통계량'], //항목정의
		    ['6월',70],
		    ['7월',100],
		    ['8월',150],
		    ['9월',80]
		  ]);
		// 그래프 옵션
		var options = {
			title : '월별 통계량', // 제목
			width: 600, // 가로 px
			height: 400, // 세로px
			bar : {
				groupWidth: '80%' // 그래프 너비 설정 %
			},
			legend: {
				position : 'none' // 항목 표시 여부 (현재 설정 안함)
			}
		};
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}

</script>
</head>
<body>
<div id="chart_div"></div><!-- 여기에 차트가 생성됩니다. -->
</body>
</html>