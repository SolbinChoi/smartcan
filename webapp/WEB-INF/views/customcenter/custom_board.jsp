<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomBoardList</title>
<link href="/smartcan/assets/css/customboard.css" rel="stylesheet" type="text/css">
<link href="/smartcan/assets/css/menubar.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/menubar.js"></script>
<style>
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

			<div id="customBoard_main">
				<div id="customBoard_sub">
					<div id="custom_wrap">
						<div id="main_center">
							<h1>Smart Can 고객센터 입니다.</h1>
							<h3>불편하셨던 점을 작성해주세요.</h3>
						</div>

						<div class="con2_1">
							<p class="tit_1">
							<img src="/smartcan/assets/images/customcenter/tit1.gif">
							</p>
							<img src="/smartcan/assets/images/customcenter/tit2.gif">
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



					<div id="custom_board">
						<form id="search_form" action="/smartcan/custom/list" method="get">
							<input type="text" id="kwd" name="kwd" value="${map.keyword }">
							<input type="submit" value="찾기">
						</form>
						<h4>
							전체 글수 : <span>${map.totalCount }</span>
						</h4>
						<table class="tbl-ex">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>조회수</th>
								<th>작성일</th>
								<th>&nbsp;</th>


							</tr>

							<c:set var="firstIndex"
								value="${map.totalCount - (map.currentPage - 1)*map.sizeList }" />
							<c:forEach var='vo' items='${map.list}' varStatus='status'>
								<tr>
									<c:choose>
										<c:when test='${vo.depth == 1 }'>
											<td><img src="/smartcan/assets/images/customcenter/que.PNG"></td>
										</c:when>
										<c:otherwise>
											<td><img src="/smartcan/assets/images/customcenter/an.PNG"></td>
										</c:otherwise>
									</c:choose>


									<td style="text-align:left; padding-left:${vo.depth*10}px">

										<c:if test='${vo.depth > 1 }'>
											<img src="/smartcan/assets/images/customcenter/re2.png">
										</c:if> <a
										href="/smartcan/custom/viewform?no=${vo.no}&&groupNo=${vo.groupNo}">${vo.title }</a>
									</td>

									<td>${vo.name }</td>
									<td>${vo.count }</td>
									<td>${vo.regdate }</td>
									<td><c:choose>
											<c:when
												test='${(not empty authUser && authUser.no == vo.userNo) || (authUser.no==1)  }'>
												<a
													href="/smartcan/custom/delete?groupNo=${vo.groupNo}&&groupOrderNo=${vo.groupOrderNo }"
													class="del">삭제</a>
											</c:when>
											<c:otherwise>
            						&nbsp;
              					</c:otherwise>
										</c:choose></td>

								</tr>
							</c:forEach>

						</table>

						<c:if test="${empty map.list}">
							<div id="search">
								<div id="search_risk">
									<img src="/smartcan/assets/images/customcenter/risk.png">
								</div>
								<p class="search_list-right">
									검색된 결과를 찾을 수 없습니다. <br>
								</p>
							</div>
						</c:if>

						<c:if test='${not empty map.list }'>
							<!-- begin:paging -->
							<div class="pager">
								<ul>

									<c:if test="${map.prevtoPage >= 0 }">
										<li><a href="/smartcan/custom/list?p=${map.prevtoPage }">◀◀</a></li>
									</c:if>

									<c:if test="${map.prevPage >= 0 }">
										<li><a href="/smartcan/custom/list?p=${map.prevPage }">◀</a></li>
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
												<li><a href="/smartcan/custom/list?p=${i }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:if test='${map.nextPage > 0 }'>
										<li><a href="/smartcan/custom/list?p=${map.nextPage }">▶</a></li>
									</c:if>
									<c:if test='${map.nexttoPage > 0 }'>
										<li><a href="/smartcan/custom/list?p=${map.nexttoPage }">▶▶</a></li>
									</c:if>

								</ul>
							</div>
						</c:if>
						<!-- end:paging -->
						<c:choose>
							<c:when test='${empty authUser }'>

   						&nbsp;      
   						</c:when>
							<c:otherwise>
								<div class="bottom">

									<a href="/smartcan/custom/write?userno=${authUser.no}"
										id="new-book">글쓰기</a>
								</div>

							</c:otherwise>
						</c:choose>
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