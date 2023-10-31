<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../layout/nav.jsp"></jsp:include>
<form class="d-flex" role="search" action="/board/list" method="get">
        <c:set value="${ph.pgvo.type }" var="typed"></c:set>
		<select class="form-select" aria-label="Default select example" name="type">
		  	<option ${typed eq null ? 'selected':'' }>Choose..</option>
		  	<option value="t" ${typed eq 't' ? 'selected':''}>Title</option>
			<option value="w" ${typed eq 'w' ? 'selected':'' }>Writer</option>
			<option value="c" ${typed eq 'c' ? 'selected':'' }>Content</option>
			<option value="tw" ${typed eq 'tw' ? 'selected':'' }>Title or Writer</option>
			<option value="tc" ${typed eq 'tc' ? 'selected':'' }>Title or Content</option>
			<option value="wc" ${typed eq 'wc' ? 'selected':'' }>Writer or Content</option>
			<option value="twc" ${typed eq 'twc' ? 'selected':'' }>All</option>	
		</select>
		<input type="hidden" name="pageNo" value="1">
		<input type="hidden" name="qty" value="${ph.pgvo.qty }">
	
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
        <button class="btn btn-outline-success" type="submit">Search</button>
</form>



	<table class="table table-hover">
		<thead>
			<tr>
				<th>#</th>
				<th>Title</th>
				<th>Writer</th>
				<th>Content</th>
				<th>Reg-Date</th>
				<th>Read-Count</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="bvo">
				<tr>
					<td><a href="/board/detail?bno=${bvo.bno }">${bvo.bno }</a></td>
					<td>${bvo.title} </td>
					<td>${bvo.writer} </td>
					<td>${bvo.content} </td>
					<td>${bvo.regAt} </td>
					<td>${bvo.readCount} </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
<nav aria-label="Page navigation example">
  <ul class="pagination">
  <c:if test="${ph.prev eq true}">
	   <li class="page-item"><a class="page-link" 
	    href="/board/list?pageNo=${ph.startPage-1}&qty=${ph.pgvo.qty}">◀</a></li>
  </c:if>
  
  <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    <li class="page-item"><a class="page-link" 
    href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}">${i }</a></li>
  </c:forEach>
  
  	<c:if test="${ph.next eq true}">
	  	<li class="page-item"><a class="page-link" 
	    href="/board/list?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}">▶</a></li>
    </c:if>
  </ul>
</nav>
	
	
	
	
</body>
</html>