<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.hw.notice.model.vo.*"%>

<% ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 

	<%@ include file="../common/header.jsp" %>
<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<p style="background-image: url(/myWeb/views/main/images/just14-4.jpg);height:120px; width:200%;"/>
			  
	
	<div class="container" style="padding: 80px 0px 100px 0px;">
	<h2 style="text-align:center;" id="notice" onclick="location.href='/myWeb/selectList.no'">⚠️ Notice&nbsp;&nbsp;</h2>
	<br>

<hr>	<MARQUEE scrollamount="14" direction="left" hspace="40" vspace="10" style="margin-left:87px; margin-top:20px;
		width:84.9%; font-size:16px;color:#9c9392; background-color:#f2f2f2;">
	📢 COVID-19으로 인해 현재 예약하신 항공권이 취소될 수 있습니다.  추가적인 관련 사항은 1443-4444 고객센터로 연락 주십시오. </MARQUEE>
	<table id="listArea" class= "table table-hover" style="margin: 0 auto;width:85%;">
	<!-- table-striped
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		</thead>
		-->
		<tbody><!-- i>2전제하에 --> <!--  공지글자는 뭐 변수로 신호를 주던지 아니면 DB에 저장할때부터 공지글 들어가게 함 여기서만 보여지게 하려고 임시로 위 게시물 3개 공지로 만듦 -->
		
		
		<%if(list.size()>1){%>
			<% for(int i=0;i<2;i++){ %>
			<style>#ab:hover{font-color:black;}</style>
			<tr style="background-color:#faf0ed; padding: 30px 30px 30px 30px;">
				<td id="ab"style="color:#faf0ed;"><%= list.get(i).getNno() %></td>
				<td><span style="color:#eb1b00;font-family: 'Jua', sans-serif;">📌 공지 &nbsp;</span><%= list.get(i).getNtitle() %></td>
				<td><%= list.get(i).getNcount() %></td>
				<td><%= list.get(i).getNdate() %></td>
			</tr>
			<% } %>
		
		
				<% for(int i=2;i<list.size();i++){ %>
			<tr>
				<td style="color:white;"><%= list.get(i).getNno() %></td>
				<td><%= list.get(i).getNtitle() %></td>
				<td><%= list.get(i).getNcount() %></td>
				<td><%= list.get(i).getNdate() %></td>
			</tr>
			<% } %>
					<%}else{%>
			
			
					<% for(int i=0;i<list.size();i++){ %>
			<tr>
				<td style="color:white;"><%= list.get(i).getNno() %></td>
				<td><%= list.get(i).getNtitle() %></td>
				<td><%= list.get(i).getNcount() %></td>
				<td><%= list.get(i).getNdate() %></td>
			</tr>
			<% } %>
			
			<%} %>
		</tbody>
	</table>
<br><br><br>
	<a id="mouse" style="font-size:15px; color:gray; position:absolute; left:18.6%; top:43%;/*%로 줘야 글 개수에 따라 위치 유동적*/
	"onclick="location.href='/myWeb/selectList.no'">📋 <span style="text-decoration: underline;">전체 글 보기</span></a>


		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition" style="height:28.5px;width:100px;">
				<option value="title+content">제목+내용</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" id="keyword" style="height:29.5px;width:300px;" onkeydown="javascript:onEnterLogin();"> 
			<button type="button" onclick="search();"style="padding:1.6px 20px 1.6px 20px;
			border:1px solid lightgray; border-radious:10px; font-size:15px;"">검색</button>
			<% if(m != null && m.getUserId().equals("admin@co.kr")){ %><!-- 관리자 계정 -->
				<button onclick="location.href='noticeInsert.jsp'"style="padding:1.6px 10px 1.6px 10px;
			border:1px solid lightgray; border-radious:10px;background-color:white; font-size:15px;">공지 게시</button>
			<% } %>
		</div>
<br><br>

	<hr/>
	<div class="text-center">
		<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
		</ul>
	</div>

<!-- <a class="btn btn-default pull-right">글쓰기</a>-->
</div>




	<script>  
	


	$(function(){
		$("#mouse,#notice").mouseenter(function(){
			$(this).parent().css({"cursor":"pointer"});
		});
	});


	
	
		$(function(){
			
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"cursor":"pointer"});
			}).click(function(){
				var nno = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno;
			});
		});//좀더 연구... 보이지 않게. 속성 value 접근 가능한지.. ->디테일로 이동하게
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		/*
		function show(){
		    $("#mouse").css('visibility', 'visible'); 
		}
		function hide(){
		    $("#mouse").css('visibility', 'hidden'); 
		}
		*/
		
		function onEnterLogin(){

			if (event.keyCode == 13) { //엔터키 이면<조건 안누르면 다 눌림-어떤 버튼이든>

				location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();

			}
		} //onEnterLogin()
	</script>
	
	
	
	
<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<%@include file ="../common/footer.jsp" %>
