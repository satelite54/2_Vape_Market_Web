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
<title>JASET VAPE Q&A</title>
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<br/><br/>
<div class="container">
<h2 style="color:#223a6b; font-style: italic;">JASET VAPE</h2>
  <p style="color:#223a6b;">Q&A</p>
  <table class="table" style="text-align: center;">
    <thead class="text-light" style="background-color:#223a6b;">
      <tr>
      	<th>이름</th>
      	<th>등록날짜</th>
      	<th>제목</th>
      	<th>첨부파일</th>
      </tr>
    </thead>
    <tbody>
      <tr style="color:#223a6b;">
        <td><%=name%></td>
        <td><%=regdate%></td>
        <td><%=subject%></td>
        <td>
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
    </tbody>
  </table>
	<div class="card-body text-dark border boder-dark rounded mt-3 mb-5">
		<p class="card-text text-left" style="height:350px"><%=content%></p>
	</div>
	<p><%=ip%>로 부터 글을 남기셨습니다./  조회수  <%=count%>
	<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>&numPerPage=<%=numPerPage%>" class="btn float-right mt-3" style="margin-right:5px; background-color:#223a6b; color:white;">수정</a>
	<a href="reply.jsp?nowPage=<%=nowPage%>&numPerPage=<%=numPerPage%>" class="btn float-right mt-3" style="margin-right:5px; background-color:#223a6b; color:white;">답변</a>
	<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>" class="btn float-right mt-3" style="margin-right:5px; background-color:#223a6b; color:white;" onclick="return confirm('글을 삭제하시겠습니까?');">삭제</a>
</div>

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