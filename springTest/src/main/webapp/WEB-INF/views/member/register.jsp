<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Register</title>
</head>
<body>
<jsp:include page="../layout/nav.jsp"></jsp:include>

<form action="/member/register" method="post">
  	<div class="position-absolute top-50 start-50 translate-middle">
  	<h1 style="text-align: center" class="mainText">SIGN UP PAGE</h1>
		<div class="mb-3">
		   <label for="e" class="form-label mainText">E-Mail</label>
		   <input type="text" class="form-control" id="e" name="email" placeholder="E-Mail">
		</div>
		
		<div class="mb-3">
		   <label for="p" class="form-label mainText">Password</label>
		   <input type="text" class="form-control" id="p" name="pwd" placeholder="PassWord">
		</div>
		
		<div class="mb-3">
		   <label for="n" class="form-label mainText">Nick-Name</label>
		   <input class="form-control" id="n" name="nickName" placeholder="Nick-Name" />
		</div>

		<button type="submit" class="btn btn-secondary btn-lg" id="regBtn">Sign Up</button>
	</div>	
</form>

</body>
</html>