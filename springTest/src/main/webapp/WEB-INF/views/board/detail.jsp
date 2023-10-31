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

<table class="table table-hover">
	<tr>
		<th>#</th>
		<td>${bvo.bno }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${bvo.title }</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${bvo.writer }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${bvo.content }</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${bvo.regAt }</td>
	</tr>
	<tr>
		<th>수정일</th>
		<td>${bvo.modAt }</td>
	</tr>
	<tr>
		<th>파일수</th>
		<td>${bvo.hasFile }</td>
	</tr>
	<tr>
		<th>댓글수</th>
		<td>${bvo.cmtQty }</td>
	</tr>
</table>
<div>
	<ul>
		<c:forEach items="${flist }" var="fvo">
			<c:choose>
				<c:when test="${fvo.fileType > 0}">
					<li>
						<img alt="그림없음" src="/upload/${fn: replace(fvo.saveDir,'\\','/')}/${fvo.uuid }_th_${fvo.fileName}">
					</li>
				</c:when>
			</c:choose>
		</c:forEach>
	</ul>
</div>


<a href="/board/modify?bno=${bvo.bno }"><button>수정</button></a>
<a href="/board/remove?bno=${bvo.bno }"><button>삭제</button></a>
<!-- Comment Line -->

<!-- 댓글라인 -->
<div>
	<!-- 댓글 등록 라인 -->
	<div class="input-group mb-3">
	  <span class="input-group-text" id="cmtWriter">Writer</span>
	  <input type="text" class="form-control" placeholder="Comment Content" id="cmtText">
	  <button class="btn btn-primary" type="button" id="cmtPostBtn">POST</button>
	</div>
	<!-- 댓글 표시 라인 -->
<table class="table">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Writer</th>
      <th scope="col">Content</th>
      <th scope="col">Mod-Date</th>
    </tr>
   <tbody id="cmtArea">    
    </tbody>
</table>
</div>


<div>
	<div class="d-grid gap-2">
		<button type="button" id="moreBtn" data-page="1" 
		class="btn btn-outline-dark" style="visibility:hidden">MORE+</button>		
	</div>
</div>


	<!-- 모달 -->
<div class="modal" id="myModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Writer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body">
	      <div class="input-group mb-3">
	        <input type="text" class="form-control" placeholder="Comment Content" id="cmtTextMod">
	        <button class="btn btn-danger" id="cmtModBtn">POST</button>
	      </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>





<script type="text/javascript">
	let bnoVal = `<c:out value="${bvo.bno}"/>`;
	console.log(bnoVal);
</script>

<script type="text/javascript" src="/resources/js/comment.js"></script>
<script type="text/javascript">
	getCommentList(bnoVal);
</script>

</body>
</html>