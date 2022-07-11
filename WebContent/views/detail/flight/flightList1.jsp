<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.hw.flight.model.vo.*"%>
    	<%@ include file="../../common/header.jsp" %>
    <%//매핑 안된데서는 받아오기 어려움?!
Reservation r = (Reservation)session2.getAttribute("reservation");//진행중 예약

//Reservation reservation = (Reservation)session2.getAttribute("reserve");//완성된 예약 / 아직 생성 안됨?!
//System.out.print(reservation.toString2()); %>
    
<% //헤더위치!!

ArrayList<Flight> list = (ArrayList<Flight>)request.getAttribute("list"); 
//Reservation reserve = new Reservation();//제작 한번만 해야 초기화 안됨?!
//session2.setAttribute("reservation",reserve);
////Reservation r = (Reservation)session2.getAttribute("reservation");%>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<p style="background-image: linear-gradient(to right,#001e47, #59b4e3);height:105px; width:100%;"/>
<!--
<div style="background-image: linear-gradient(#0c6896, #63afd6);margin-top:-20px;height:100px; width:100%;">
<h2 style="text-align:center;color:white;"><br>항공권 예약</h2>
</div>-->
	
	<div class="stepwizard">
    <div class="stepwizard-row">
        
        <div class="stepwizard-step" ">
            <button onclick="window.location.href='/myWeb/views/main/index.jsp';"  
            class="btn btn-circle" style="background-color:red; color:white; margin-left:22px;">◁</button>
            <p style="margin-left:18px; color:black; font-size:15px;">Flight</p>
        </div> 
          <div class="stepwizard-step">
            <button onclick="window.location.href='/myWeb/views/detail/flight/option2.jsp';" 
             type="button" class="btn btn-circle" style="cursor:not-allowed; background-color:light-gray; color:white;margin-left:20px;">2</button>
            <p style="margin-left:16px;">Option</p>
        </div>
          <div class="stepwizard-step">
            <button onclick="window.location.href='/myWeb/views/detail/flight/passenger3.jsp';"
             type="button" class="btn btn-circle" style=cursor:not-allowed;background-color:light-gray;color:white;">3</button>
            <p>Passenger</p>
        </div>
         <div class="stepwizard-step">
            <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/Flight.go';" 
             class="btn btn-circle" style="cursor:not-allowed;background-color:light-gray; color:white;">4</button>
            <p>Payment</p>
        </div> 
 	
    </div>
</div>
	


	<div class="container" style="padding: 80px 0px 100px 0px;">
		<h1 style="text-align:center;  font-family: 'Jua', sans-serif; color:#0e3469;">☁️ 선택한 항공 일정을 확인하세요</h1>
	<!--  
	<a style=" text-underline:none;position:absolute;font-size:27px; margin-top:-4%;margin-left:0%; color:black;
	" href="../../main/index.jsp">
 < &nbsp;</a>-->
<hr><BR>	
  <form method="post" action="<%= request.getContextPath() %>/views/detail/flight/option2.jsp" style="margin-top:0px;">

	<table class= "table table-striped table-hover" style="margin: 0 auto;">
		<thead>
		<tr>
			<th style="width:270px;">편명</th>
			<th style="width:400px;">출발</th>
			<th style="width:420px;">도착</th>
			<th>선택</th>
		</tr>
		</thead>
		
       
		<tbody>

<% String pclass = request.getParameter("pclass");
	r.setPclass(pclass);
	//System.out.print("항공리스트에서 클래스는?"+r.getPclass());%>

			<% for(int i=0;i<list.size();i++){ %>
			<tr>
				<td><%= list.get(i).getRoute_no()%></td>
				<td><%= list.get(i).getFrom() %><br><%= list.get(i).getDeparture() %></td>
				<td><%= list.get(i).getTo() %><br><%= list.get(i).getArrival2() %></td><!-- list.get(i).getArrival() -->
				
				
				<!-- 입력한 값에 따라 시간까지 띄우다보니까 date 에러 및 db정보 양 부족으로 그냥 시간 띄울꺼면 이대로 가고 아니면, 내가 입력한거로 뜨게 하기 -->
				
				
				
				
<!-- 누르는 순간에 정보 올려지므로 소용x 다음(출력해줄)화면에서 항공번호 기반 다른 정보 db에서 끌어와야 함!
예약중 조회 / 나의 예약-조회
예약중 조회는 payment가 마지막 즉, passenger3에서 servlet으로 갔다가 4로 redirect해야함!(항공번호만 가지고!) -->
			<!-- payment4에서는 insert작업되는 servlet으로 갔다가 예약완료 화면 뜨게 - > 이후 나의 예약 조회에서 조회 가능함! (기능 : 조회/취소신청/추가) -->
							  <!-- 여기서 pmr_no도 생성해주고, 예약날짜도 system날짜로 집어넣기 -->
				
				
				<td>
				  <div class="radio">
                     <label id="maybe" style=" color:gray;font-family: 'Jua', sans-serif; ">			<!-- 선택되는 순간 넘어가므로 찍힌값이 들어감! -->
                     <input id="maybe-button" type="radio" id='regular' name="choose" value=<%= list.get(i).getRoute_no()%>>✈️</label>
                 </div>
    			</td>
			</tr><script>   var div = document.getElementsByTagName('div')[0];
								div.id='regular'+i;//아이디 달라지므로 라디오 선택 가능
								
								//div.value += 1;
	
			  		 </script>
			<% } %>
		</tbody>
	</table>
	<script>var PMR_no = document.getElementById('maybe-button').value;</script><!-- 그냥 확인용  사용x-->

	<hr/>
<br><br>
<br>
<br>
<hr>
<input type="button" id="maybe-button"  onclick="window.location.href='/myWeb/views/main/index.jsp';" value="재 검색" style="float:left;border-radius :10px; color:gray;
	border-color:white; border-width:0.2px; width :165px; font-size:25px; height :50px;font-family: 'Jua', sans-serif;"/>
<input type="submit" id="maybe-button"  value="다음" style="float:right;border-radius :10px; color:#3d3d3d;
	border-color:white; border-width:0.2px; width :165px; font-size:25px; height :50px;font-family: 'Jua', sans-serif;"/>
     <!--onclick="reserve2();"-->		
     </form>
     
</div>
<link rel="stylesheet" href="../../design/css/reserve.css">

<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<style>.progressbar-wrapper {
      background: #fff;
      width: 100%;
      padding-top: 10px;
      padding-bottom: 5px;
}

.progressbar li {
      list-style-type: none;
      width: 20%;
      float: left;
      font-size: 12px;
      position: relative;
      text-align: center;
      text-transform: uppercase;
      color: #7d7d7d;
}</style>
<link rel="stylesheet" href="../../design/css/progress.css">

<style type="text/css">

.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>


<%@include file ="../../common/footer.jsp" %>
