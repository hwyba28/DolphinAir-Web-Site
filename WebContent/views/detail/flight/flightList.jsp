<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,flightTest.Flight"%>

<% ArrayList<Flight> list = (ArrayList<Flight>)request.getAttribute("list"); %>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 

	<%@ include file="../../common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<p style="background-image: url(/myWeb/views/main/images/just14-4.jpg);height:120px; width:200%;"/>
			  
	
	<div class="container" style="padding: 80px 0px 100px 0px;">
	<h2 style="text-align:center; color:#000942; font-family: 'Jua', sans-serif;">☁️ 선택한 항공일정을 확인하세요&nbsp;&nbsp;</h2>
	<br>

<hr>	<br><br>
	<table id="listArea" class= "table table-hover table-striped" style="margin: 0 auto;width:85%;">

		<tbody><!-- i>2전제하에 -->
<%//System.out.println(list); %>
				<% for(int i=0;i<list.size();i++){ %>
			<tr>
				<td><%= list.get(i).getRoute_no() %></td>
				<td><%= list.get(i).getFrom() %></td>
				<td><%= list.get(i).getTo() %></td>
				<td><%= list.get(i).getDeparture() %></td>
				<td><%= list.get(i).getArrival() %></td>
			</tr>
			<% } %>
			
		</tbody>
	</table>
<br><br><br>



<br><br>

	<hr/>


<!-- <a class="btn btn-default pull-right">글쓰기</a>-->
</div>




	
	
<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<%@include file ="../../common/footer.jsp" %>
