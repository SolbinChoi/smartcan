<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SmartCan 광고문의</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CustomBoardList</title>
<link href="/smartcan/assets/css/adver.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		<div id="content">

			<div id="adverBoard_main">
				<div id="adverBoard_sub">
					<div id="adver_wrap">
						<div id="main_center">
							<h1>광고문의</h1>
							<img src="/smartcan/assets/images/adver/ground.jpeg"
								width="950px" height="450px">
						</div>
					</div>
					
					<!-- 우측 메뉴바 -->
					<jsp:include page="/WEB-INF/views/include/menubar.jsp" />
					
					<!-- 광고 게시판 리스트 -->
					<div id="adver_board">
						<form id="search_form" action="/smartcan/adver/list" method="get">
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
							
							<!-- 리스트 뿌리기 -->
							<c:set var="firstIndex"
								value="${map.totalCount - (map.currentPage - 1)*map.sizeList }" />
							<c:forEach var='vo' items='${map.list}' varStatus='status'>
								<tr>
									<c:choose>
										<c:when test='${vo.depth == 1 }'>
											<td><img src="/smartcan/assets/images/adver/que.PNG"></td>
										</c:when>
										<c:otherwise>
											<td><img src="/smartcan/assets/images/adver/an.PNG"></td>
										</c:otherwise>
									</c:choose>


									<td style="text-align:left; padding-left:${vo.depth*10}px">

										<c:if test='${vo.depth > 1 }'>
											<img src="/smartcan/assets/images/adver/re2.png">
										</c:if> <a
										href="/smartcan/adver/viewform?no=${vo.no}&&groupNo=${vo.group_no}">${vo.title }</a>
									</td>

									<td>${vo.name }</td>
									<td>${vo.view_count }</td>
									<td>${vo.reg_date }</td>
									<td><c:choose>
											<c:when
												test='${(not empty authUser && authUser.no == vo.user_no) || (authUser.no==1)  }'>
												<a
													href="/smartcan/adver/delete?group_no=${vo.group_no}&&order_no=${vo.order_no }"
													class="del">삭제</a>
											</c:when>
											<c:otherwise>
            						&nbsp;
              					</c:otherwise>
										</c:choose></td>

								</tr>
							</c:forEach>

						</table>

						<!-- 리스트가 비어있을 때 조건문 -->
						<c:if test="${empty map.list}">
							<div id="search">
								<div id="search_risk">
									<img src="/smartcan/assets/images/adver/risk.png">
								</div>
								<p class="search_list-right">
									검색된 결과를 찾을 수 없습니다. <br>
								</p>
							</div>
						</c:if>

						<!-- 보여줄 리스트가 있을 시에 페이징 -->
						<c:if test='${not empty map.list }'>
							<!-- begin:paging -->
							<div class="pager">
								<ul>

									<c:if test="${map.prevtoPage >= 0 }">
										<li><a href="/smartcan/adver/list?p=${map.prevtoPage }">◀◀</a></li>
									</c:if>

									<c:if test="${map.prevPage >= 0 }">
										<li><a href="/smartcan/adver/list?p=${map.prevPage }">◀</a></li>
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
												<li><a href="/smartcan/adver/list?p=${i }">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<c:if test='${map.nextPage > 0 }'>
										<li><a href="/smartcan/adver/list?p=${map.nextPage }">▶</a></li>
									</c:if>
									<c:if test='${map.nexttoPage > 0 }'>
										<li><a href="/smartcan/adver/list?p=${map.nexttoPage }">▶▶</a></li>
									</c:if>

								</ul>
							</div>
						</c:if>
						
						<!-- 비로그인일 때 나타나지 않음-->
						<c:choose>
							<c:when test='${empty authUser }'>

   						&nbsp;      
   						</c:when>
   						
							<c:otherwise>
								<div class="bottom">
									<a href="/smartcan/adver/write" id="new-book">글쓰기</a>
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

</html>