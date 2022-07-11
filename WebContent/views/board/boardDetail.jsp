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
	<h2 style="text-align:center;">🙋 Q & A</h2>
	<br>

<hr>	<br><br>



		<div class="tableArea">
				<table style="margin: 0 auto; line-height:35px;" width=70%">
					<tr>
					<input type="hidden" name="bno" value="<%=b.getBno() %>" />
					
					<td row=2 style="font-size:23px;"><%= b.getBtitle() %></td>
						<td style="float:right;">작성일자 :&nbsp; <%= b.getBdate() %></td>
						
					</tr>
					
					<tr>
					<td></td>
						<td style="float:right;">작성자 : <%= b.getBwriter() %>&nbsp;&nbsp;&nbsp;조회수: <%= b.getBcount()+1 %></td>
					</tr>

					<tr>

						<td colspan="4" ><br><br>
							<pre style="border:1px solid gray; width:100%; font-size:15px;"><%= b.getBcontent() %></pre>
						</td>
					</tr>
				</table>
				<br>
				<div style="margin-left:38.5%;">
					
			<button style="margin-top:100px; font-size:16px; background-color:white; border-radius:5px;"onclick="location.href='<%= request.getContextPath() %>/selectList.bo'">Back to menu</button>
			<button onclick="check1();" style="margin-top:100px; font-size:16px; background-color:white; border-radius:5px;">&nbsp;Edit&nbsp;</button>
			<button onclick="check2();" style="margin-top:100px; font-size:16px; background-color:white; border-radius:5px;">&nbsp;Delete&nbsp;</button>
	
	
	
				</div>
		</div>

<script>
function check1(){
	var tmp = prompt("게시글의 비밀번호를 입력해주세요","비밀번호");
	var count = 0;

	var root = '<%= request.getContextPath() %>';
	
	
	var pwd = parseInt(tmp);
		while(count<=2)//비밀번호 기회
		{
		if(pwd ==<%=b.getBpwd()%>){
			var bno = '<%=b.getBno()%>';
		location.href=root+"/bUpView.bo"+"?bno="+bno;
			break;
		}else {count += 1;}
		}
		
		
		if(count==3){
			alert('비정상적인 접근입니다.');
			   window.history.back();		}
}

function check2(){
	var tmp = prompt("게시글의 비밀번호를 입력해주세요","비밀번호");
	var count = 0;
	var root = '<%= request.getContextPath() %>';

	var pwd = parseInt(tmp);
		while(count<=2)//비밀번호 기회
		{
		if(pwd ==<%=b.getBpwd()%>){
			var bno = '<%=b.getBno()%>';
		location.href=root+"/bDelete.bo"+"?bno="+bno;
			break;
		}else {
			//alert('비밀번호가 맞지 않습니다');
			count += 1;}
		}
		
		
		if(count==3){
			alert('비정상적인 접근으로 확인되었습니다.');
			   window.history.back();
			   }
}
</script>


<br><br>



	<!--<hr/>-->
<%if(m!=null) {// clist=null;%>
<!-- 댓글 작성(회원만 작성/수정/삭제 가능) -->
		<div class="replyArea">
			<div class="replyWriteArea">
			
			<!-- 댓글 삽입! -->
				<form action="/myWeb/insertComment.bo" method="post">
				<!--//항상 회원과 분리 기능!! //어지간하면 jsp에서 호출할 db없어서 나는 에러 -->
					<input type="hidden" name="writer" value="<%=m.getUserId()%>"/>
<!-- 					<input type="hidden" name="writer" value="익명"/>-->
					<input type="hidden" name="bno" value="<%=b.getBno()%>" />
					<input type="hidden" name="refcno" value="0" />
					<input type="hidden" name="clevel" value="1" />
					<br>
					<table align="center">
						<tr>
							<td><textArea  placeholder='&nbsp;※ 40자 미만으로 작성해주세요
&nbsp;다른 사람의 권리를 침해하거나 타인을 비방하는 사용자는 댓글 사용이 중지됩니다.
&nbsp;회원 익명으로 댓글 작성시 수정 및 삭제가 불가합니다.' style="font-size:16px;"
							rows="4" cols="80" id="replyContent" name="replyContent"></textArea></td>
							<td><button type="submit" id="addReply" style="border-color:none; padding:28px 5px 28px 5px; margin-left:12px;
							 background-color:white; border-radius:5px;/*font-family: 'Jua', sans-serif;*/
							 font-size:16px;/*color:white;*/">Comment</button></td>
						</tr>
					</table>
				</form>
			</div><!-- replyWrite -->
			
						<% int count; %><!-- 반복문 바깥에 선언?! 계속 저장 유지되게! 선언만! -->
			
			
			<div class="replySelectArea">
			<!-- 게시글의 댓글들을 보여주는 부분  -->
			<% if (clist != null) { %>		
			<% for(BoardComment bco : clist) { %>
			
			
			
	<table id="replySelectTable" style="margin-left : 15%;
	      	 		width : <%= 600 - ((bco.getClevel()-1) * 15)%>px;"
	      	 class="replyList<%=bco.getClevel()%>">
		  		<tr>
		  			<td rowspan="2"> </td>
		  			<% if(bco.getCwriter()==null){ %>
		  			<td><i>비공개된 사용자</i><%}else{ %>
					<td><b><%= bco.getCwriter() %></b><%} %>
					&nbsp;&nbsp;&nbsp;&nbsp;<%= bco.getCdate() %></td>
					<td align="center">
 					<%if(m.getUserId().equals(bco.getCwriterId())) { %>
						<input type="hidden" name="cno" value="<%=bco.getCno()%>"/>
							<!--  
						<button type="button" class="updateBtn" 
							onclick="updateReply(this);">수정하기</button>
							
						<button type="button" class="updateConfirm"
							onclick="updateConfirm(this);"
							style="display:none;" >수정완료</button> &nbsp;&nbsp;
							-->
							<%if(bco.getCwriter()!=null) {%>
						<button type="button" class="deleteBtn" style="border:none; 
						background-color:white;margin-left:60%;"
							onclick="deleteReply(this);">삭제</button>
							<%}%>
					<% } else if( bco.getClevel() < 3) { %>
						<input type="hidden" name="writer" value="<%=m.getUserId()%>"/>
						<input type="hidden" name="refcno" value="<%= bco.getCno() %>" />
						<input type="hidden" name="clevel" value="<%=bco.getClevel() %>" />
						<!-- 나중 대댓글 필요시 <button type="button" class="insertBtn" 
							 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
							 --><!--
						<button type="button" class="insertConfirm"
							onclick="reConfirm(this);"
							style="display:none;" >댓글 추가 완료</button> 
							-->
					<% } else {%>
						<span> 마지막 레벨</span>
					<% } %>
					</td>
				</tr><br>
				<hr style="margin-left:14.5%;width:64%;">
				<tr class="comment replyList<%=bco.getClevel()%>">
					<td colspan="3" style="background : transparent;">
					<textarea class="reply-content" cols="80" rows="1" style="
					resize:none; /*border: 0.1px solid lightgray;*/border:none; background-color:white;"
					 readonly="readonly"><%= bco.getCcontent() %></textarea>
					</td>
				</tr>
			</table>
					
					
					
			<% }} else { %>
			<p style="margin-left:68%; color:light-gray">※ 현재 등록된 댓글이 없습니다 !</p>
			<% } %>
			</div>
			
			
			
			
				<script>
	///* 현재 수정 기능 없음
		function updateReply(obj) {
		// 현재 위치와 가장 근접한 textarea 접근하기
		$(obj).parent().parent().next().find('textarea')
		.removeAttr('readonly');
		
		// 수정 완료 버튼을 화면 보이게 하기
		$(obj).siblings('.updateConfirm').css('display','inline');
		
		// 수정하기 버튼 숨기기
		$(obj).css('display', 'none');
	}
	
		function updateConfirm(obj) {
		// 댓글의 내용 가져오기
		var content
		  = $(obj).parent().parent().next().find('textarea').val();
		
		// 댓글의 번호 가져오기
		var cno = $(obj).siblings('input').val();
		
		// 게시글 번호 가져오기
		var bno = '<%=b.getBno()%>';
		
		location.href="/myWeb/updateComment.bo?"
				 +"cno="+cno+"&bno="+bno+"&content="+content;
	}
	//*/

	
	
	
	
	
	function deleteReply(obj) {
		// 댓글의 번호 가져오기
		var cno = $(obj).siblings('input').val();
		
		// 게시글 번호 가져오기
		var bno = '<%=b.getBno()%>';
		
		location.href="/myWeb/comDelete.do"
		+"?cno="+cno+"&bno="+bno;//request.getParameter
	}
	
	function reComment(obj){
		// 추가 완료 버튼을 화면 보이게 하기
		$(obj).siblings('.insertConfirm').css('display','inline');
		
		// 클릭한 버튼 숨기기
		$(obj).css('display', 'none');
		
		// 내용 입력 공간 만들기
		var htmlForm = 
			'<tr class="comment"><td></td>'
				+'<td colspan="3" style="background : transparent;">'
					+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
				+ '</td>'
			+ '</tr>';
		
		$(obj).parents('table').append(htmlForm);
		
	}
	
	
	
	
	
	//select Comment
	function reConfirm(obj) {
		// 댓글의 내용 가져오기
		
		// 참조할 댓글의 번호 가져오기
		var refcno = $(obj).siblings('input[name="refcno"]').val();
		var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
		
		// console.log(refcno + " : " + level);
		
		// 게시글 번호 가져오기
		var bno = '<%=b.getBno()%>';
		
		var parent = $(obj).parent();
		var grandparent = parent.parent();
		var siblingsTR = grandparent.siblings().last();
		
		var content = siblingsTR.find('textarea').val();
		
		location.href='/myWeb/insertComment.bo'
		           + '?writer=<%= m.getUserId() %>' 
		           + '&replyContent=' + content
		           + '&bno=' + bno
		           + '&refcno=' + refcno
		           + '&clevel=' + level;
	}
	</script>
	
			
			
			
			
			</div><!-- replyArea -->
			
			<%} else {%>
			<p style="margin-left:37%;">※ 로그인 후 댓글 작성 및 확인이 가능합니다.</p>
<% } %>
<!-- <a class="btn btn-default pull-right">글쓰기</a>-->
</div><!-- container -->


<% System.out.print(b.getBpwd()); %>
<!-- 스크립트 위치에러?! -->


<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<%@include file ="../common/footer.jsp" %>
