<%@page import="com.hw.boardComment.model.vo.BoardComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hw.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Board b = (Board)request.getAttribute("board");
	// 댓글 리스트
	ArrayList<BoardComment> clist
	  = (ArrayList<BoardComment>)request.getAttribute("clist");
	
	//System.out.print("board_no"+b.getBno() );
%>

<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 

		<%@ include file="../common/header.jsp" %>
<p style="background-image: url(/myWeb/views/main/images/blog-5.jpg);height:110px; width:200%;"/>

	<div class="container" style="padding: 80px 0px 100px 0px;">
	<h3 style="text-align:center;">✒️ Edit Contents&nbsp;</h3>
	<br>

<hr>	<br><br>


		<div class="tableArea">
			<form id="updateForm" method="post" action="<%= request.getContextPath() %>/bUpdateComplete.bo">
				<table style="margin-left:19.5%; font-size:17px;">
					<tr>
						<td>제목 : <input type="text" size="60" name="title" value="<%=b.getBtitle() %>" 
						style="border:none; text-decoration:underline;">
							<input type="hidden" name="board_no" value="<%=b.getBno()%>">
							<%-- System.out.print("여기 값 잘 있는데?"+b.getBno()); --%>
						</td>
					</tr>
					<tr>
						<td>작성자 : <%= b.getBwriter() %></td>
					</tr>
					
					<tr><%if(m!=null) {%>
						<td>이메일 : <input type="text" name="email" id="email" placeholder="<%=b.getBoardfile()%>"
						 style="text-decoration:underline; border:none;"></td>
						<%}else{ %>
						<td>이메일 : <input type="text" name="email" id="email" placeholder="답변 받으실 이메일 주소" 
						style="text-decoration:underline;border:none;"></td>
						<%} %>					
					</tr>
					
					<tr>
											<td height=40px style="font-size:18px;">Content</td>
					
					</tr>
					
					<tr>
						<td>
							<textarea name="content" cols="80" rows="15" style="resize:none;" style="border:none;"><%=b.getBcontent() %></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div style="margin-left:44.5%;">
					<button type="submit" style="margin-top:100px; font-size:16px; background-color:white; border-radius:5px;">수정완료</button>
					<!--<button onclick="deleteBoard();">삭제하기</button>-->&nbsp;
					<button onclick="window.history.back();"style="margin-top:100px; font-size:16px; background-color:white; border-radius:5px;">뒤로가기</button>
					<br>
				</div>
				<hr style="margin-top:100px;"><br>
				<script>
					function complete(){
						$("#updateForm").attr("action","<%= request.getContextPath()%>/bUpdateComplete.bo");
					}
					
					function deleteBoard(){
						$("#updateForm").attr("action","<%= request.getContextPath()%>/bDelete.bo");
					}
				
				</script>
			</form>
	</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>