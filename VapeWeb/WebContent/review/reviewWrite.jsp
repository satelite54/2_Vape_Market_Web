<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="DAO.dao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>JASET VAPE</title>
<script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<%! 
	dao DAO = new dao(); 
	int RNum = 0;
	%>
	
	<%
		RNum = DAO.getRNum();
	%>

	<div class="container mt-3">
	  <div class="card">
	  	<div class="card-header" style="background-color: black; color: white;">
	  		글쓰기 양식
	  	</div>
	  	<div class="card-body" style="height:500px;">
	  		<form action="reviewAction.jsp" method="post">
	  			<input type="text" class="form-control mb-3" name="RTitle" placeholder="글제목" maxlength="50" required>
	  			<input type="hidden" name="RNum" value="<%=RNum%>">
	  			<textarea class="form-control mb-3" name="RContent" id="editor" style="height: 350px" placeholder="글내용" maxlength="2048" required></textarea>
	  			<div class="row">
					<input type="submit" value="등록" class="btn btn-dark ml-auto mr-3">
				</div>
	  		</form>
	  	</div>
	  </div>
	</div>

	  <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .catch( error => {
                console.error( error );
            } );
    </script>
	<script src="css/bootstrap.min.css"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>