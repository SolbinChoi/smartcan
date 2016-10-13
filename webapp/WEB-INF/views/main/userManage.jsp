<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/smartcan/assets/css/manage.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/smartcan/assets/js/jquery/jquery-1.9.0.js"></script>
</head>
<body>
<div id="container">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<div id="content">

		<div id="manage_wrap">
		
			<div id="tap_content">
			    <ul class="tabs">
			        <li class="active" rel="tab1">회원관리</li>
			        <li rel="tab2">테스트</li>
			    </ul>
			    <div class="tab_container">
			        <div id="tab1" class="tab_content">
			        	<h4>
							전체 회원수 : <span></span>
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
						</table>
						
						<c:set var="firstIndex"
								value="${map.totalCount - (map.currentPage - 1)*map.sizeList }" />
						<c:forEach var='vo' items='${map.list}' varStatus='status'>
							<tr>
							<td>${countList - s.index }</td>
							<td>${vo.email }</td>
							<td>${vo.name }</td>
							<td>${vo.phone }</td>
							<td>${vo.position }</td>
							<td><c:if test='${vo.position == "관리자" }'>
							<a href="/smartcan/userdelete?no=${vo.no}" class="del">삭제</a>
							</c:if></td>
							</tr>
						</c:forEach>
						
						
			            <ul>
			                <li><a href="#">이것은 두 번째 탭의</a>
			                </li>
			                <li><a href="#">이것은 두 번째 탭의</a>
			                </li>
			            </ul>
			        </div>
			
			        <div id="tab2" class="tab_content">테스트</div>
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
});
</script>
</html>