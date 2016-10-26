<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SmartCan 회원관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/smartcan/assets/css/manage.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="/smartcan/assets/js/jquery/jquery-1.9.0.js"></script>
<link href="/smartcan/assets/css/menubar.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/menubar.js"></script>
<style>
/* 메뉴바 css */
#STATICMENU {
	margin: 0 150px;
	padding: 0pt;
	position: absolute;
	right: 0px;
	top: 0px;
}
</style>
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div id="content">
	
			<!-- 메뉴바 div -->
			<div id="menubar">
				<div id="STATICMENU">
					<div class="myarea_wrap">
						<div class="mymenu">
							<div class="couwrap_off">
								<c:choose>
									<c:when test='${empty authUser}'>
										<p>
											서비스 이용을<br> 위해 로그인<br> 해주세요 <br>
										</p>
										<input type="button" class="btn_log" value="로그인"
											onclick="location.href='/smartcan/user/loginform';">
									</c:when>
									<c:otherwise>
										<p>
											환영합니다<br>${authUser.name }님 <br> ^^
										</p>
										<input type="button" class="btn_log" value="로그아웃"
											onclick="location.href='/smartcan/user/logout';">
									</c:otherwise>
								</c:choose>
							</div>
							<ul class="my_lst">
								<li><a href="/smartcan/map/list" class="my_m0">검색</a></li>

								<li><a href="/smartcan/adver/list" class="my_m2">광고문의</a></li>

							</ul>

						</div>
						<a href="#" class="top">TOP</a>
					</div>
				</div>
			</div>
			
			<!-- 회원 관리 탭 -->
			<div id="manage_wrap">

				<div id="tap_content">
					<ul class="tabs">
						<li class="active" rel="tab1"><a href="/smartcan/userManage">회원관리</a></li>
						<li rel="tab2">관리</li>
					</ul>
					<div class="tab_container">
						<div id="tab1" class="tab_content">
							<form id="search_form" action="/smartcan/userManage" method="get">
								<input type="text" id="kwd" name="kwd" value="${map.keyword }">
								<input type="submit" id="search-btn" value="찾기">
							</form>

							<h4>
								전체 회원수 : <span>${map.totalCount }</span>
							</h4>

							<table class="tbl-ex">
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>PHONE</th>
									<th>직책</th>
									<th>&nbsp;</th>


								</tr>

								<c:set var="countList"
									value="${map.totalCount - (map.currentPage - 1)*map.sizeList }" />
								<c:forEach var='vo' items='${map.list}' varStatus='status'>
									<tr>
										<td>${countList - status.index }</td>
										<td>${vo.email }</td>
										<td>${vo.name }</td>
										<td>${vo.phone }</td>
										<td>${vo.position }</td>
										<td>
											<!-- <c:choose>
								<c:when test='${authUser.no==1 }'>
								<a href="/smartcan/userdelete?no=${vo.no}" class="del">삭제</a>
								</c:when>
								
								<c:otherwise>
									&nbsp;
								</c:otherwise>
							</c:choose> --> &nbsp;
										</td>
									</tr>
								</c:forEach>
							</table>

							<ul>
								<li><a href="/smartcan/main" id="back">메인으로 돌아가기</a></li>
							</ul>

							<!-- 페이징 시작 -->
							<div class="pager">
								<ul>

									<c:if test="${map.prevtoPage >= 0 }">
										<li><a href="/smartcan/userManage?p=${map.prevtoPage }">◀◀</a></li>
									</c:if>

									<c:if test="${map.prevPage >= 0 }">
										<li><a href="/smartcan/userManage?p=${map.prevPage }">◀</a></li>
									</c:if>

									<c:forEach begin='${map.firstPage }' end='${map.lastPage }'
										step='1' var='i'>
										<c:choose>
											<c:when test='${map.currentPage == i }'>
												<li class="selected">${i }</li>
											</c:when>
											<c:when test='${i > map.pageCount }'>
												<li>${i }</li>
											</c:when>
											<c:otherwise>
												<li><a href="/smartcan/userManage?p=${i }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:if test='${map.nextPage > 0 }'>
										<li><a href="/smartcan/userManage?p=${map.nextPage }">▶</a></li>
									</c:if>
									<c:if test='${map.nexttoPage > 0 }'>
										<li><a href="/smartcan/userManage?p=${map.nexttoPage }">▶▶</a></li>
									</c:if>

								</ul>
							</div>

						</div>

						<div id="tab2" class="tab_content">추가해주세요.</div>
					</div>
				</div>

			</div>

		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>
<script>
$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
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