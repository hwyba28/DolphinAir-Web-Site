<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 

		<%@ include file="../common/header.jsp" %>
	
<p style="background-image: url(/myWeb/views/main/images/blog-5.jpg);height:110px; width:200%;"/>
			  
			  
			  
			  
	
	<div class="container" style="padding: 80px 0px 100px 0px;">
	<h2 style="text-align:center;">write</h2>
	<br>

<hr>	<br><br>


			<form action="<%= request.getContextPath() %>/bInsert.bo" method="post">
		
				<table style="margin-left:22%; line-height:35px;" width=100%">
					<tr><!-- 테이블에서 먹히는 속성 -->
					<td style="font-size:15px;">제목 : <input type="text" name="title"
					 style="border: none;
					 padding:-10px 0px -40px 0px; text-decoration:underline; " placeholder='제목을 입력해주세요'></td>
					
					</tr>
					
					<tr>
						<td style="font-size:15px;">작성자 : <input type="text" name="name"
					 style="border: 1px solid white; padding:-10px 0px -40px 0px; " placeholder="성함을 입력해주세요">
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
		
					
					
					
					
					
					
					<% if(m==null){ %>
					# 답변 받으실 이메일 : <input type="text" name="userId" placeholder='원하시면 입력해주세요 !' style="
					 text-decoration:underline; border: 1px solid white; "></td>
					<%} else {%>
						# 답변 받으실 이메일 : <span style="text-decoration:underline;"><%= m.getUserId() %></span>
						<input style="visibility:hidden;"type="text" name="userId" value="<%= m.getUserId() %>"></td>
					<%} %>
					</tr>
										<tr></tr>
					
					<tr>
										<td height="50px" style="font-size:16px;">✏️ Contents</td>
					</tr>
					<tr>
						<td colspan="3">
							<textarea name="content" cols="78" rows="15" 
							style="border: 1px solid lightgray; margin-left:0%;resize:none;"></textarea>
						</td>
						</tr>
				</table>
				<br>
							
					
					
					
					

					
				
				<div style="margin-left:44%;">
									
					<p style=" font-size:15px;">게시글 비밀번호 : 
					<input type="text" name="pwd" style="text-decoration:underline;border: none;
					 padding:-10px 0px -40px 0px; " placeholder="4자리 입력" required/><br>
					<button style="background-color:white; border-radius:4px;" type="reset">다시 작성</button>&nbsp;
					<button style="background-color:white; border-radius:4px;" type="submit">문의 글 등록</button>
				</div>
				</form>

		</div>




<br><br>
<hr style="margin-top:100px;">









<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<%@include file ="../common/footer.jsp" %>
