<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hw.notice.model.vo.*"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>

<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 

	<%@ include file="../common/header.jsp" %>
	
<p style="background-image: url(/myWeb/views/main/images/blog-5.jpg);height:110px; width:200%;"/>
			  
			  
			  
			  
	
	<div class="container" style="padding: 80px 0px 100px 0px;">
	<h2 style="text-align:center;">⚠ Detail&nbsp;&nbsp;</h2>
	<br>

<hr>	<br><br>



		<div class="tableArea">
				<table style="margin: 0 auto; line-height:35px;">
					<tr>
						<td style="font-size:17px;">제목 : <%= n.getNtitle() %></td>
						<td style="float:right;"><%= n.getNdate() %>  조회수 : <%= n.getNcount() %></td>
					</tr>
					
					<tr>
					</tr>
					<tr>

						<td colspan="4" ><br><br>
							<pre style="border:1px solid gray; width:100%; font-size:15px;"><%= n.getNcontent() %></pre>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					
					<button style="margin-top:100px; font-size:16px; background-color:white; border-radius:10px;"onclick="location.href='/myWeb/selectList.no'">Back to menu</button>

					<% if( m != null && m.getUserId().equals("admin@co.kr")) { %>
						<button onclick="location.href='nUpView.no?nno=<%=n.getNno()%>'">수정하기</button>
					<% } %>
				</div>
		</div>




<br><br>



	<hr/>


<!-- <a class="btn btn-default pull-right">글쓰기</a>-->
</div>








<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<%@include file ="../common/footer.jsp" %>
