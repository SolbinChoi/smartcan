<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	pageContext.setAttribute("newLine", "\n");
%>
<title>smartcan_view</title>
<link href="/smartcan/assets/css/customboard.css" rel="stylesheet" type="text/css">

</head>
<body>

	<div id="container">
		<jsp:include page="/WEB-INF/views/include/header.jsp" />

		<div id="content">
			<div id="customBoard_main">
				<div id="customBoard_sub">
					<div id="wrap">
						<h1>광고문의</h1>
					</div>

					<div id="board" class="board-form">
						<table class="tbl-ex">
							<tr>
								<th colspan="2">글보기</th>
							</tr>
							<tr>
								<td class="label">제목</td>
								<td>${vo.title }</td>
							</tr>
							<tr>
								<td class="label">내용</td>
								<td>
									<div class="view-content">${fn:replace(vo.content, newLine, "<br>") }
									</div>
								</td>
							</tr>
							<tr>
								<td class="label">첨부파일</td>
							<td id="attachFile" data-fno="${AttachFileAdVO.fNO }">${AttachFileAdVO.orgName }</td>
							</tr>
						</table>
						<img id="adver_img" src="${AttachFileAdVO.imageurl }" width=250px; height="250px">
				<div id="cma_image" style="width:95%; max-width:100%; border:1px solid #c0c0c0;">
				</div>
						<div class="bottom">
							<a href="/smartcan/adver/list">글목록</a>
							<c:if test='${not empty authUser }'>
								<a href="/smartcan/adver/replyform?no=${vo.no }">답글달기</a>
								<c:if test='${authUser.no == vo.user_no }'>
									<a href="/smartcan/adver/modifyform?no=${vo.no}">글수정</a>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>


		<jsp:include page="/WEB-INF/views/include/footer.jsp" />

	</div>

 <script>
/*--------첨부파일 다운로드--- -----------*/
$("#attachFile").on("click", function(event){
	var fNO = $(this).data("fno");
	var url = "download?fNO=" + fNO; 
	window.open(url);
});
</script>
</body>
</html>