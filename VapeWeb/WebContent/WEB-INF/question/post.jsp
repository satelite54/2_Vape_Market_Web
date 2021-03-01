<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>


<body>

<div align="center">
<br/><br/>

<form name="postFrm" method="post" action="questionPost" enctype="multipart/form-data">

<table width="600" cellpadding="3" align="center">
	<tr>
		<td align=center>
		<table align="center">
			<tr>
				<td width="10%">성 명</td>
				<td width="90%">
				<input name="name" size="10" maxlength="8"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td>
				<input name="subject" value="Q: " size="50" maxlength="30"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>비밀 번호</td>
				<td><input type="password" name="pass" size="15" maxlength="15" value="1234"></td>
			</tr>
			<tr>
			 <tr>
     			<td>파일찾기</td> 
     			<td><input type="file" name="filename" size="50" maxlength="50"></td>
    		</tr>

			<tr>
				<td colspan="2"><hr/></td>
			</tr>
			<tr>
				<td colspan="2">
					 <input type="submit" value="글등록">
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
</form>
</div>



</body>
</html>