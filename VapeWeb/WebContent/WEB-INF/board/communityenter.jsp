<%@page import="DTO.Users"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DTO.Board"%>
<%@page import="DAO.Dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<jsp:include page="../sub/menu.jsp" flush="true" />
<jsp:include page="../sub/submenu.jsp" flush="true" />
<title>JASET VAPE</title>
</head>
<body>


	<div class="container  border border-gray rounded">
		<div class="row p-2 font-weight-bold" style="background-color: black; color: white;">
			<div class="col-sm-2">번호</div>
			<div class="col-sm-4">글 제목</div>
			<div class="col-sm-2">작성자</div>
			<div class="col-sm-2">작성일</div>
			<div class="col-sm-2">조회수</div>
		</div>
		<div class="row border boder-dark rounded mt-1">
			<div class="col-sm-2">${board.BNum}</div>
			<div class="col-sm-4">${board.BTitle}</div>
			<div class="col-sm-2">${board.id}</div>
			<div class="col-sm-2">${board.BDate}</div>
			<div class="col-sm-2">${board.views}</div>
		</div>
			<div class="card-body text-dark border boder-dark rounded mt-3 mb-5">
				<p class="card-text text-left" style="height:350px">${board.BContent}</p>
 			</div>
 			<div>
		 				<a href="communityListAction.do?page=${param.pageNum}" class="btn btn-primary float-right mt-3" style="margin-right:5px;">글목록</a>
						<c:choose>
							<c:when test="${board.id eq sessionScope.id || admin == 1}">
		 						<a href="communityDeleteAction.do?BNum=${board.BNum}" class="btn btn-danger float-right mt-3" style=margin-right:5px; onclick="return confirm('글을 삭제하시겠습니까?')">삭제</a>
		 						<a href="communityUpdate.do?BNum=${board.BNum}&BTitle=${board.BTitle}&BContent=${board.BContent}" class="btn btn-warning float-right mt-3" style="margin-right:5px;">수정</a>
	 						</c:when>
	 					</c:choose>
		 	</div>
		</div>
		 	<jsp:include page="../sub/footer.jsp" flush="true" />

<script type="text/javascript">
function DeleteForm(){
	if(${id == null}){
		alert("권한이 없습니다.")
		return false;
	}else{
		confirm("정말 삭제하시겠습니까??");
		return true;
	}
}
</script>

<script src="css/bootstrap.min.css"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>