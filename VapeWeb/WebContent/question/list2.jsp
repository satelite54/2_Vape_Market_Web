<!-- list.jsp -->
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
		
		//요청된 numPerPage 처리
		//요청이 있으면 처리가 되지만 그렇지 않으면 기본 10개 세팅이 된다.
		if(request.getParameter("numPerPage")!=null){
	numPerPage = UtilMgr.parseInt(request, "numPerPage");
		}
		
		//검색에 필요한 변수
		String keyField = "", keyWord = "";
		//검색일때
		if(request.getParameter("keyWord")!=null){
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
		}
		
		//검색 후에 다시 처음화면 요청
		if(request.getParameter("reload")!=null&&
		request.getParameter("reload").equals("true")){
	keyField = ""; keyWord = "";
		}
		
		totalRecord = mgr.getTotalCount(keyField, keyWord);
		//out.print("totalRecord : " + totalRecord);
		
		//nowPage 요청 처리
		if(request.getParameter("nowPage")!=null){
	nowPage = UtilMgr.parseInt(request, "nowPage");
		}
		
		//sql문에 들어가는 start, cnt 선언
		int start = (nowPage*numPerPage)-numPerPage;
		int cnt = numPerPage;
		
		//전체페이지 개수
		totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
		//전체블럭 개수
		 totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
		//현재블럭
		nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
%>
<html>
<head>
	<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		if(document.searchFrm.keyWord.value==""){
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
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
	//list.jsp에서 read.jsp로 요청이 될때 기존에 조건 같이 넘어감.
	//기존 조건 : keyField,keyWord,nowPage,numPerPage
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "question/read.jsp";
		document.readFrm.submit();
	}
</script>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body bgcolor="#FFFFCC" >
<div align="center"><br/>
<h2>JSP Board</h2><br/>
<table>
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
<table>
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
			<a href="/VapeWeb/question/post.jsp">[글쓰기]</a>
		</td>
	</tr>
</table>


<form name="listFrm" method="post">
	<input type="hidden" name="reload" value="true">
	<input type="hidden" name="nowPage" value="1">
</form>

<form name="readFrm">
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<input type="hidden" name="numPerPage" value="<%=numPerPage%>">
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<input type="hidden" name="num">
</form>
</div>
</body>
</html>











