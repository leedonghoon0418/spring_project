<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
</head>
<style>
.translate-middle{
	width: 500px;
	height: 500px;
}
.btn-lg{
	width: 100%;
}
</style>
<body>
<jsp:include page="../layout/header.jsp" />
<jsp:include page="../layout/nav.jsp" />


  <form action="/board/register" method="post" enctype="multipart/form-data">
  	<div class="position-absolute top-50 start-50 translate-middle">
		<div class="mb-3">
		   <label for="exampleFormControlInput1" class="form-label">Title</label>
		   <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="title">
		</div>
		
		<div class="mb-3">
		   <label for="exampleFormControlInput1" class="form-label">Writer</label>
		   <input type="text" class="form-control" id="exampleFormControlInput1" name="writer" placeholder="writer">
		</div>
		
		<div class="mb-3">
		   <label for="exampleFormControlTextarea1" class="form-label">Content</label>
		   <textarea class="form-control" id="exampleFormControlTextarea1" name="content" rows="3"></textarea>
		</div>
		
		<!-- file upload -->
		<div class="mb-3">
			
		   <input type="file" class="form-control" name="files" id="files" style="display:none;" multiple="multiple">
		   <!-- input button 트리거용도의 버튼  -->
		   <button type="button" id="trigger" class="btn btn-outline-success">File Upload</button>
		</div>
		
		<div class="mb-3" id="fileZone">
			<!-- 첨부파일 표시  -->
		</div>
		
		<button type="submit" class="btn btn-secondary btn-lg" id="regBtn">Register</button>
	</div>	

  </form>
  <script type="text/javascript" src="/resources/js/boardRegister.js"></script>
  
   
</body>