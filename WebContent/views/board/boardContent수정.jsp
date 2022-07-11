<%@page import="com.hw.boardComment.model.vo.BoardComment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hw.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Board b = (Board)request.getAttribute("board");

	// 댓글 리스트
	ArrayList<BoardComment> clist = (ArrayList<BoardComment>)request.getAttribute("clist");
%>

<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 

	<%@ include file="../common/header.jsp" %>
	
<p style="background-image: url(/myWeb/views/main/images/blog-5.jpg);height:110px; width:200%;"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시글 상세보기</title>
</head>
<body>
	<div class="outer">
		<br>
		<h2 align="center">게시글 내용</h2>
		<div class="tableArea">
				<table align="center" width="800px">
					<tr>
						<td>제목 </td>
						<td colspan="5"><span><%= b.getBtitle() %></span></td>
					</tr>
					
					<tr>
						<td>작성자 </td>
						<td><span><%= b.getBwriter() %></span></td>
						<td>작성일</td>
						<td><span><%= b.getBdate() %></span></td>
						<td>조회수 </td>
						<td><span><%= b.getBcount() %></span></td>
					</tr>
				
					<tr>
						<td colspan="6">내용 </td>
					</tr>
					
					<tr>
						<td colspan="6">
							<p id="content"><%= b.getBcontent() %>
						</td>
					</tr>
					
				</table>
				<br>
		</div><!-- tablearea -->
		
		
		
		
		
		
		<div align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.bo'">메뉴로 돌아가기</button>
			<button onclick="location.href='<%= request.getContextPath() %>/bUpView.bo?bno='+<%=b.getBno()%>">수정하기</button>
		</div>
		
		
		
		
	<script>
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
	
	function deleteReply(obj) {
		// 댓글의 번호 가져오기
		var cno = $(obj).siblings('input').val();
		
		// 게시글 번호 가져오기
		var bno = '<%=b.getBno()%>';
		
		location.href="/myWeb/deleteComment.bo"
		+"?cno="+cno+"&bno="+bno;
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

	<%-- <%@ include file="../common/footer.jsp" /%> --%>
</body>
</html>
	<hr/>






<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<%@include file ="../common/footer.jsp" %>
