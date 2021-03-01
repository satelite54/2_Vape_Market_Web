<%@page import="question.QuestionBean"%>
<%@page import="java.util.Vector"%>
<%@page import="question.UtilMgr"%>
<%@page contentType="text/html; charset=utf-8"%>
<jsp:useBean id="mgr" class="question.QuestionMgr"/>
<jsp:useBean id="cmgr" class="question.QCommentMgr"/>
<%
request.setCharacterEncoding("utf-8");
		int totalRecord = 0;//총게시물수
		int numPerPage = 10;//페이지당 레코드 개수(5,10,15,30)
		int pagePerBlock = 15;//블럭당 페이지 개수
		int totalPage = 0;//총 페이지 개수
		int totalBlock = 0;//총 블럭 개수
		int nowPage = 1;//현재 페이지
		int nowBlock = 1;//현재 블럭

		if(request.getParameter("numPerPage")!=null){
	numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		

		String keyField = "", keyWord = "";

		if(request.getParameter("keyWord")!=null){
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
		}

		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
	keyField = ""; keyWord = "";
		}
		
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		if(request.getParameter("nowPage")!=null){
	nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	function check() {
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(block) {
		document.readFrm.nowPage.value = 
			<%=pagePerBlock%>*(block-1)+1;
		document.readFrm.submit();
	}
	function  list() {
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
	}
	function numPerFn(numPerPage) {
		document.readFrm.numPerPage.value = numPerPage;
		document.readFrm.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "question/read.jsp";
		document.readFrm.submit();
	}
	function postDisplay() {
		var e = document.getElementById("writeDiv");
		if(e.style.display=='none')
			e.style.display='block';
		else
			e.style.display='none';
	}
	
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<div align="center"><br/>
	<table align="center">
		<tr>
			<td width="600">
			Total : <%=totalRecord%>Articles(<font color="red">
			<%=nowPage+"/"+totalPage%>Pages</font>)
			</td>
			<td align="right">
				<form name="npFrm" method="post">
					<select name="numPerPage" size="1" 
					onchange="numPerFn(this.form.numPerPage.value)">
	    				<option value="5">5개 보기</option>
	    				<option value="10" selected>10개 보기</option>
	    				<option value="15">15개 보기</option>
	    				<option value="30">30개 보기</option>
	   				</select>
	   			</form>
	   			<script>document.npFrm.numPerPage.value=<%=numPerPage%></script>
			</td>
		</tr>
	</table>
	<table align="center">
		<tr>
			<td align="center" colspan="2">
			<%
			Vector<QuestionBean> vlist = 
					mgr.getQuestionList(keyField, keyWord, start, cnt);
					int listSize = vlist.size();//브라우저 화면에 표시될 게시물 번호
					if(vlist.isEmpty()){
						out.println("등록된 게시물이 없습니다.");
					}else{
			%>
				<table cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0">
						<td width="100">번 호</td>
						<td width="250">제 목</td>
						<td width="100">이 름</td>
						<td width="150">날 짜</td>
						<td width="100">조회수</td>
					</tr>
			<%
			for(int i=0;i<numPerPage;i++){
						if(i==listSize) break;
						QuestionBean bean = vlist.get(i);
						int num = bean.getNum();//게시물 번호
						String subject = bean.getSubject();//제목
						String name = bean.getName();//이름
						String regdate = bean.getRegdate();//날짜
						int depth = bean.getDepth();//답변의 깊이
						int count = bean.getCount();//조회수
						String filename = bean.getFilename();//첨부파일
						//댓글 count
						int qcount = cmgr.getQCommentCount(num);
			%>
					<tr align="center">
						<td><%=totalRecord-start-i%></td>
						<td align="left">
							<%for(int j=0;j<depth;j++){out.println("&nbsp;&nbsp;");} %>
							<a href="javascript:read('<%=num%>')"><%=subject%></a>
							<%if(filename!=null&&!filename.equals("")){%>
								<img src="img/icon_file.gif" align="middle">
							<%}%>
							<%if(qcount>0){%>
								<font color="red">(<%=qcount%>)</font>
							<%}%>
						</td>
						<td><%=name%></td>
						<td><%=regdate%></td>
						<td><%=count%></td>
					</tr>
			<%}//---for%>				
				</table>
			<%}//---if-else%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><br><br></td>
		</tr>
		<tr>
			<td>
			<!-- 페이징 및 블럭 Start -->
					<%if(totalPage>0){%>
				<!-- 이전 블럭 -->
				<%if(nowBlock>1){ %>
					<a href="javascript:block('<%=nowBlock-1%>')">prev...</a>
				<%} %>
				<!-- 페이징 -->
				<%
						int pageStart = (nowBlock-1)*pagePerBlock+1;
						int pageEnd = (pageStart+pagePerBlock)<totalPage?
								pageStart+pagePerBlock:totalPage+1;
						for(;pageStart<pageEnd;pageStart++){
				%>
					<a href="javascript:pageing('<%=pageStart%>')">
					<%if(nowPage==pageStart){%><font color="blue"><%}%>
						[<%=pageStart%>]
					<%if(nowPage==pageStart){%></font><%}%>
					</a>
				<%}//---for%>
				<!-- 다음 블럭 -->
				<%if(totalBlock>nowBlock){ %>
						<a data-toggle="modal" href="javascript:block('<%=nowBlock+1%>')">...next</a>
				<%} %>
			<%}//---if1%>
			<!-- 페이징 및 블럭 End -->
			</td>
			<td align="right">
				<a style="color:blue;" href="javascript:postDisplay()">[글쓰기]</a>
			</td>
		</tr>
	</table>


<div id="writeDiv" align="center" style="display: none;">
<br/><br/>
<form name="postFrm" method="post" action="<%=request.getContextPath()+"/question/questionPost"%>" enctype="multipart/form-data">
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
</form>
</div>

	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>

	<form name="readFrm">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
		<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<input type="hidden" name="num">
	</form>
</div>