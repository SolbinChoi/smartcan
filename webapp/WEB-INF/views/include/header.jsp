<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/smartcan/assets/css/header.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/jquery/jquery-1.9.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="header">
	<div class="topwrap">
		<div class="brdwrap">
			<!-- utility -->
			<div class="uty">
				<ul>
				<c:choose>
				<c:when test='${empty sessionScope.authUser }'>
				<li><a href="/smartcan/user/loginform">로그인</a></li>
				<li><a href="/smartcan/user/joinform">회원가입</a></li>
				</c:when>
				<c:otherwise>
				<li>${authUser.name}님안녕하세요^^;</li>
				<li><a href="/smartcan/user/modifyform">회원정보수정</a></li>
				<li><a href="/smartcan/user/logout">로그아웃</a></li>
				</c:otherwise>
				</c:choose>
				</ul>
			</div>
			
			<div class="gnbwrap">
				<div class="gnbw">
					<h1 class="logo"><a href="/smartcan/main">GS25</a></h1>
					<div class="gnb" id="gnb_menu">
						<ul>
						<li><h2><a href="/smartcan/board/customlist" class="on">고객센터</a></h2>
						</li>
						<li><h2><a href="/smartcan/board/advertise">광고문의</a></h2>
						</li>
						<li><h2><a href="/smartcan/statistic/statistic">통계량</a></h2>
						</li>
						<li><h2><a href="/smartcan/map/list">검색</a></h2>
						</li>
						<li><h2><a href="/smartcan/companyintro">제품소개</a></h2>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>