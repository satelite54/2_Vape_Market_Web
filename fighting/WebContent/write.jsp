<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board!</title>
</head>
<body>


	<h1>게시글 작성!</h1>
	<form action="index.jsp" method="post" onsubmit="return formcheck();">
		<div class="container">
			제목<input type="text" name="title" /><br> 
			작성자<input type="text" name="writer" /><br> 
			날짜<input type="text" name="regdate" /><br>
			<textarea rows="10" cols="20" name="content"></textarea><br> 
			<input type="submit" value="전송" onclick="returm formcheck();" />
		</div>
	</form>
	<script>
	
	
	/*	
	
	function formCheck(){
			var title = documnet.forms[0].title.value;
			var writer = documnet.forms[0].writer.value;
			var regdate = documnet.forms[0].regdate.value;
			var content = documnet.forms[0].content.value; //글내용
			
			if(title == null || title == ""){
				alert("제목을 입력하세요");
				document.forms.title.focus();
				return false;
			}
			if(writer == null || writer == ""){
					alert("작성자를 입력하세요");
					document.forms.writer.focus();
					return false;
			}
		
			if (content == null || content==""{
				alert("내용을 입력하세요");
				documnet.forms[0].content.focus();
				return false;
			if(regdate == null || regdate==""){
				alert("날짜를 입력하세요");
				document.forms[0].regdate.focus();
				return false;
			}
		})
		}
	*/
	
	function formcheck(){
		var length = document.forms[0].length-1;
		
		for(var i = 0 ; i< length; i++){
			if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
				alert(document.forms[0][i].name + "을/를 입력하세요.");
				document.forms[0][i].focus();
				return false;
			}
		}
	}	
	
	
	</script>

</body>
</html>