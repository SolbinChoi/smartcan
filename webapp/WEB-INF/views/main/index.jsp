<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/smartcan/assets/css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/jquery/jquery-1.9.0.js"></script>

</head>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div id="content">


	<div id="index_main">
		<div id="main_top"> <!-- 상단 메인 이미지 -->
			<img src="/smartcan/assets/images/index/main_top.jpg" width=1000px>
		</div>
		
		<div id="ban_wrap"> <!-- 가운데, 왼쪽이미지 하나 오른쪽 이미지(배너)두개 -->
			<div id="ban_left">
			</div>
			<div id="ban_right">
				<div id="ban1">
					<a href="/board/">
					<span><h3>Smart trash can</h3></span>
					<span>"일상 속에서 편리하게 사용할 수 있는 쓰레기통으로" <br>
					"편리함을 느껴보세요."
					</span>
					</a>
				</div>
				<div id="ban2">
				<a href="/board/">
					<span><h3>Fresh</h3></span>
					<span>"일상 속에서 편리하게 사용할 수 있는 쓰레기통으로" <br>
					"편리함을 느껴보세요."
					</span>
					</a>
				</div>
			</div>
		</div>
		
		<div class="mid_green"> <!-- 하단 전체 초록색 배경과 흰색 글&흰색 버튼 -->
			<div id="mid_one">
				<h2>스마트 쓰레기통에 대해 더 알아보세요.</h2>
			</div>
			<div id="mid_two">
				<p><a class="btn btn-default" href="/smartcan/main/index" role="button"><b>제품보기</b></a>
				</p>
			</div>
		</div>
	</div>
	
	
	
	
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</div>
</body>
</html>