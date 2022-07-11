<%@page import="com.hw.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hw.board.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% //페이징 처리

//요청에 따른 서블릿 처리 한 jsp에 여러 서블릿 사용! 그때그때 요청에 따라서! -- but 공유해야 하는애는 서블릿 모두
//돌려주는 값을 같은 list로 만들어주기

//selectservlet searchservlet 두군데서 모두 받아올 list
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 

//방법1: 검색 기능/페이징 따로 사용하기- 공유해야되서 실패!

//우선 list 두개를 만들어서 요청에 따라서 jsp가 때에 따라 두가지 list를 가져오게 하고,
//select all servlet으로 들어갔을때는 all_list를 쓰고,
//search servlet으로 들어갔을때는 search_list사용 해서 list라는 변수에 대입하기



//방법2: 검색 기능과 페이징 동시 사용하기 -> search list에 페이징 처리하는 기능 넣어주면 됨!
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	 int listCount = pi.getListCount();
	 int currentPage = pi.getCurrentPage();
	 int maxPage = pi.getMaxPage();
	 int startPage = pi.getStartPage();
	 int endPage = pi.getEndPage();


%>


	<%@ include file="../common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<p style="background-image: url(/myWeb/views/main/images/just14-4.jpg);height:120px; width:200%;"/>
			  
	
	<div class="container" style="padding: 80px 0px 100px 0px;">
	<h2 style="margin-left:42%;">🤔&nbsp; Q & A</h2>
	<a style="font-family: 'Roboto Mono', monospace; text-underline:none;position:absolute;/* background-color:#fafafa;*/font-size:20px; margin-top:-8%;margin-left:-11%; color:darkblue;
	" href="/myWeb/views/main/contact.jsp">
 🗨️ Contact us&nbsp;</a>
<hr style="width:90%; margin-top:50px;">
	<table class= "table table-striped table-hover" id="listArea" style="margin:0 auto;width:90%;">
		<thead style="text-align:center;">
		<tr>
				<th width="200px" style="margin-left:-10px;">번호</th>
				<th width="450px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</th>
				<th width="200px">작성자</th>
				<th width="200px">&nbsp;작성 일자</th>
				<th width="100px">조회수</th>
		</tr>
		</thead>
		<tbody>
		<% for(Board b : list) {%>
			<tr>
				<input type="hidden" value="<%= b.getBno() %>"/>
				<input id="id" type="hidden" value="<%= b.getBoardfile() %>"/>
				 
				<td><%= b.getBno() %></td>
				<td><%= b.getBtitle() %></td>
				<td><%= b.getBwriter() %></td>
				<td><%= b.getBdate() %></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;<%= b.getBcount() %></td>

			</tr>
			<%} %>
		</tbody>
	</table>

	<hr style="width:90%;">
	<button onclick="location.href='views/board/boardInsertForm.jsp'" 
	style="position:absolute;margin-top:6.3%;margin-left:62%; Padding:-10px 0px -10px 0px;
	background-color:white; border-radius:5px; font-size:15px;">문의 글 작성 </button>
	
	<style>.pagingArea button{background-color:white; border: 1px solid white;}</style>
	<%-- 페이징처리 --%>
<br>		<div class="pagingArea" style="margin-left:31%;">
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
				
				
				
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo?currentPage=<%= maxPage %>'">>></button>
			
		</div>
	
	<br><br>
		<div class="searchArea" style="margin-left:29%;">
			<select id="searchCondition" name="searchCondition" style="height:28.5px;width:100px;">
				<option value="title+content">제목+내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="search" id="keyword" style="height:29.5px;width:300px;" onkeydown="javascript:onEnterLogin();"> 
			<button type="button" onclick="search();"style="padding:1.6px 20px 1.6px 20px;
			border:1px solid lightgray; border-radious:10px; font-size:15px;">검색</button>
	<!-- 그냥 onkeyup등을 하면 계속 새로고침화면이 load됨 따라서, json ajax로 비동기 통신 필수! --> 
		</div>
	
	
	
</div>

<br style="margin-top:100px;">
	<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			}).click(function(){
				var bno = $(this).parent().find("input").val();
				var writerId = $(this).parent().find("#id").val();

				location.href="<%=request.getContextPath()%>/selectOne.bo?bno=" + bno ;
				//+"&writerId="+$('#id').val();//나중 재시도 같은 아이디한테만 edit 보여지게 selectOne 서블릿으로 이동해서!
			});
		});
		

		function search(){
			location.href="<%=request.getContextPath()%>/searchBoard.bo?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		
		
		function onEnterLogin(){

			var keyCode = window.event.keyCode;

			

			if (keyCode == 13) { //엔터키 이면<조건 안누르면 다 눌림-어떤 버튼이든>

				location.href="<%=request.getContextPath()%>/searchBoard.bo?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();

			}
		} //onEnterLogin()
		
		
	</script>
<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<%@include file ="../common/footer.jsp" %>
