<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/nav.jsp"></jsp:include>

	<form action="/board/modify" method="post" enctype="multipart/form-data">
		
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">Title</label>
		  <input type="text" class="form-control" id="exampleFormControlInput1" name="title" value="${bvo.title }">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">Writer</label>
		  <input type="text" class="form-control" id="exampleFormControlInput1" name="writer" 
		  value="${bvo.writer }" readonly="readonly">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">Content</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3">${bvo.content }</textarea>
		</div>
		<input type="hidden" name="bno" value="${bvo.bno }">
		
		<div class="mb-3">
			
		   <input type="file" class="form-control" name="files" id="files" style="display:none;" multiple="multiple">
		   <!-- input button 트리거용도의 버튼  -->
		   <button type="button" id="trigger" class="btn btn-outline-success">File Upload</button>
		</div>
		
		<div class="mb-3" id="fileZone">
			<!-- 첨부파일 표시  -->
		</div>
		
		<div>
			<ul>
				<c:forEach items="${flist }" var="fvo">
					<c:choose>
						<c:when test="${fvo.fileType > 0}">
							<li data-uuid = "${fvo.uuid }">
								<img alt="그림없음" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid }_th_${fvo.fileName}">
								<button type="button" id="removeFile">X</button>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
		
		<button type="submit" id="regBtn">수정하기</button>
	</form>
	
	
	<script type="text/javascript" src="/resources/js/boardRegister.js"></script>
	<script type="text/javascript" src="/resources/js/boardModify.js"></script>
</body>
</html>