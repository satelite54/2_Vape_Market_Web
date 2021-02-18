<!-- read.jsp -->
<%@page import="java.util.Vector"%>
<%@page import="question.QCommentBean"%>
<%@page import="question.QuestionBean"%>
<%@page import="question.UtilMgr"%>
<%@page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mgr" class="question.QuestionMgr"/>
<jsp:useBean id="cmgr" class="question.QCommentMgr"/>
<%
request.setCharacterEncoding("UTF-8");
		//read.jsp?nowPage=1&numPerPage=10&keyField=&keyWord=&num=3
		String nowPage = request.getParameter("nowPage");	
		String numPerPage = request.getParameter("numPerPage");	
		String keyField = request.getParameter("keyField");	
		String keyWord = request.getParameter("keyWord");	
		int num = UtilMgr.parseInt(request, "num");	
		
		String flag = request.getParameter("flag");
		if(flag!=null){
	if(flag.equals("insert")){
		QCommentBean cbean = new QCommentBean();
		cbean.setNum(num);
		cbean.setName(request.getParameter("cName"));
		cbean.setComment(request.getParameter("comment"));
		cmgr.insertQComment(cbean);
	}else if(flag.equals("del")){
		//요청한 댓글 삭제
		cmgr.deleteQComment(UtilMgr.parseInt(request, "cnum"));
	}
		}else{
	//조회수 증가 : list.jsp 게시물 읽어옴.
	mgr.upCount(num);
		}
		
		QuestionBean bean = mgr.getQuestion(num);
		String name = bean.getName();
		String subject = bean.getSubject();
		String regdate = bean.getRegdate();
		String content = bean.getContent();
		String filename = bean.getFilename();
		int filesize = bean.getFilesize();
		String ip = bean.getIp();
		int count = bean.getCount();
		//읽어온 게시물을 수정 및 삭제를 위해 세션저장
		session.setAttribute("bean", bean);
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function down(filename) {
		document.downFrm.filename.value=filename;
		document.downFrm.submit();
	}
	function list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function cInsert() {
		if(document.cFrm.comment.value==""){
			alert("댓글을 입력하세요.");
			document.cFrm.comment.focus();
			return;
		}
		document.cFrm.submit();
	}
	function cDel(cnum) {
		document.cFrm.cnum.value=cnum;
		document.cFrm.flag.value="del";
		document.cFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
<br/><br/>
<table align="center" width="600" cellspacing="3">
 <tr>
  <td bgcolor="#9CA2EE" height="25" align="center">글읽기</td>
 </tr>
 <tr>
  <td colspan="2">
   <table cellpadding="3" cellspacing="0" width="100%"> 
    <tr> 
  <td align="center" bgcolor="#DDDDDD" width="10%"> 이 름 </td>
  <td bgcolor="#FFFFE8"><%=name%></td>
  <td align="center" bgcolor="#DDDDDD" width="10%"> 등록날짜 </td>
  <td bgcolor="#FFFFE8"><%=regdate%></td>
 </tr>
 <tr> 
    <td align="center" bgcolor="#DDDDDD"> 제 목</td>
    <td bgcolor="#FFFFE8" colspan="3"><%=subject%></td>
   </tr>
   <tr> 
     <td align="center" bgcolor="#DDDDDD">첨부파일</td>
     <td bgcolor="#FFFFE8" colspan="3">
    	<%
    	if(filename!=null&&!filename.equals("")){
    	%>
    		<a href="javascript:down('<%=filename%>')"><%=filename%></a>
    		<font color="blue">(<%=UtilMgr.intFormat(filesize)%>bytes)</font>
    	<%
    	}else{out.println("첨부된 파일이 없습니다.");}
    	%>
     </td>
   </tr>
   <tr> 
    <td colspan="4"><br/><pre><%=content%></pre><br/></td>
   </tr>
   <tr>
    <td colspan="4" align="right">
     <%=ip%>로 부터 글을 남기셨습니다./  조회수  <%=count%>
    </td>
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align="center" colspan="2">
  <!-- 댓글 입력폼 Start -->
  <form method="post" name="cFrm">
		<table>
			<tr  align="center">
				<td width="50">이 름</td>
				<td align="left">
					<input name="cName" size="10" value="aaa">
				</td>
			</tr>
			<tr align="center">
				<td>내 용</td>
				<td>
				<input name="comment" size="50"> 
				<input type="button" value="등록" onclick="cInsert()"></td>
			</tr>
		</table>
	 <input type="hidden" name="flag" value="insert">	
	 <input type="hidden" name="num" value="<%=num%>">
	 <input type="hidden" name="cnum">
    <input type="hidden" name="nowPage" value="<%=nowPage%>">
    <input type="hidden" name="numPerPage" value="<%=numPerPage%>">
   <%
   if(!(keyWord==null||keyWord.equals(""))){
   %>
    <input type="hidden" name="keyField" value="<%=keyField%>">
    <input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%
	}
	%>
	</form>
  <!-- 댓글 입력폼 End -->
 <hr/>
 <!-- 댓글 List Start -->
  <%
  Vector<QCommentBean> cvlist = cmgr.getQComment(num);
    		if(!cvlist.isEmpty()){
  %>
  <table>	
	 <%
		 for(int i=0;i<cvlist.size();i++){
		 	 			QCommentBean cbean = cvlist.get(i);
		 	 			int cnum = cbean.getCnum();
		 	 			String cname = cbean.getName();
		 	 			String comment = cbean.getComment();
		 	 			String cregdate = cbean.getRegdate();
		 %>
	 	<tr>
			<td colspan="3" width="600"><b><%=cname%></b></td>
		</tr>
		<tr>
			<td>댓글:<%=comment%></td>
			<td align="right"><%=cregdate%></td>
			<td align="center" valign="middle">
			<input type="button" value="삭제" onclick="cDel('<%=cnum%>')">
			</td>
		</tr>
		<tr>
			<td colspan="3"><br/></td>
		</tr>
	 <%}//---for%>
	 </table>	
 <hr/>
 <%} %>
 <!-- 댓글 List End -->
 
 [ <a href="javascript:list()" >리스트</a> | 
 <a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>&numPerPage=<%=numPerPage%>" >수 정</a> |
 <a href="update2.jsp?nowPage=<%=nowPage%>&num=<%=num%>&numPerPage=<%=numPerPage%>" >수 정2</a> |
 <a href="reply.jsp?nowPage=<%=nowPage%>&numPerPage=<%=numPerPage%>" >답 변</a> |
 <a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭 제</a> ]<br/>
  </td>
 </tr>
</table>
<form method="post" name="downFrm" action="download.jsp">
	<input type="hidden" name="filename">
</form>

<form name="listFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<%if(!(keyWord==null||keyWord.equals(""))){%>
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
</form>

</body>
</html>