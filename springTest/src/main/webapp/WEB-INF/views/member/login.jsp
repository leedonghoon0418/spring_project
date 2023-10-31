<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<form action="/member/login" method="post">
  	<div class="position-absolute top-50 start-50 translate-middle">
  	<h1 style="text-align: center" class="mainText">LOGIN PAGE</h1>
		
		<div class="mb-3">
		   <label for="e" class="form-label mainText">E-Mail</label>
		   <input type="text" class="form-control" id="e" name="email" placeholder="E-Mail">
		</div>
		
		<div class="mb-3">
		   <label for="p" class="form-label mainText">Password</label>
		   <input type="text" class="form-control" id="p" name="pwd" placeholder="PassWord">
		</div>

		<button type="submit" class="btn btn-secondary btn-lg" id="regBtn">LOGIN</button>
	</div>	
</form>

</body>
</html>