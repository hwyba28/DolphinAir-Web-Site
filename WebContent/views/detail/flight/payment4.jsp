<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.hw.flight.model.vo.*"%>

	<%@ include file="../../common/header.jsp" %>
	<%//매핑 안된데서는 받아오기 어려움?!
Reservation r = (Reservation)session2.getAttribute("reservation");//진행중 예약

//Reservation reservation = (Reservation)session2.getAttribute("reserve");//완성된 예약
//System.out.print(reservation.toString2()); %>
	
	
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<p style="background-image: linear-gradient(to right,#001e47, #59b4e3);height:105px; width:100%;"/>
<!--
<div style="background-image: linear-gradient(#0c6896, #63afd6);margin-top:-20px;height:100px; width:100%;">
<h2 style="text-align:center;color:white;"><br>항공권 예약</h2>
</div>-->
	<% Flight f = (Flight)request.getAttribute("flight"); //객체 한줄%>
	
	
				<%//System.out.print("결제에서 클래스"+r.getPclass());%>
	
	<%	
//	session2.getAttribute(Route_no);
String email="";
	if(m==null){
		email = request.getParameter("userId");}
	else{
		email = m.getUserId();}
		//email = request.getParameter(m.getUserId());요청한적 없으므로!
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String c_code = request.getParameter("c_code");
	String phone = request.getParameter("tel");
	String address = request.getParameter("address");

			r.setEmail(email);
			r.setTitle(title);
			r.setName(name);
			r.setC_code(c_code);
			r.setPhone(phone);
			r.setAddress(address);
			
			r.setFrom(f.getFrom());
			r.setTo(f.getTo());//현재 잘 안되서 입력값 받아와야하는 상황 ㅠ
			r.setDeparture(f.getDeparture());
			r.setArrival2(f.getArrival2());
			System.out.print(r);//r 헤더에서 잘 공유되고 있음!//단, 객체는 한 곳에서만 만들기

			//--------------------여기까지 pmr_no랑 예약시간빼고 모두 입력 들어옴 -- 이 다음단계에서 금액까지 완전! 삽입 가능
			
			
		
			
			
			
				//System.out.print("내 수화물:"+r.getLuggage());ok
			%>
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="stepwizard">
    <div class="stepwizard-row">
        
        <div class="stepwizard-step" ">
            <button onclick="window.location.href='/myWeb/views/main/index.jsp';" 
            type="button" class="btn btn-circle" style="background-color:red; color:white; margin-left:22px;">◁</button>
            <p style="margin-left:18px;">Flight</p>
        </div> 
          <div class="stepwizard-step">
            <button onclick="window.location.href='option2.jsp';" 
             type="button" class="btn btn-circle" style="background-color:orange; color:white;margin-left:20px;">2</button>
            <p style="margin-left:16px;">Option</p>
        </div>
          <div class="stepwizard-step">
            <button onclick="window.location.href='passenger3.jsp';"
             type="button" class="btn btn-circle" style="background-color:green; color:white;">3</button>
            <p>Passenger</p>
        </div>
         <div class="stepwizard-step">
            <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/Flight.go';" 
             class="btn btn-circle" style="background-color:blue; color:white;">4</button>
            <p style="color:black; font-size:15px;">Payment</p>
        </div> 
 	
    </div>
</div>
	
	
	
	<div class="container" style="padding: 80px 0px 100px 0px;height:235%;">
		<h1 style="text-align:center;  font-family: 'Jua', sans-serif; color:#0e3469;">🧾 예약 내역을 검토 및 결제해주세요</h1>
	
<hr>	 <p style="text-align:center;">시간 초과로 항공 정보가 뜨지 않을 경우, 재검색을 해주세요</p>
	<br><br><br>
	<table class= "table">
		<thead>
				<tr>
				<td style="font-size:15px;">※&nbsp;여정 정보	</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		<tr style="background-color:#f0f5f7;">
			<th>편명</th>
			<th style="width:23%;">출발</th>
			<th style="width:300px;">도착</th>
			<th style="width:220px;">클래스 / 좌석</th>
			<th>옵션</th>
		</tr>
		</thead>
		<tbody>
			<tr style="font-size:16.5px;">
				<td style="color:darkblue;"><%= r.getRoute_no() %></td>
				
				<td><%= r.getFrom() %><br><%= f.getDeparture() %></td>
				<td><%= r.getTo() %><br><%=f.getArrival2() %></td><!-- f.getArrival() -->
				<!-- string형식으로 가져오면 시간까지 다 긁어옴 데이트만 가져오는게 아니라! date 자체가 time(시간포함) 들어가있음 -->
				<td><%= r.getPclass() %><br>좌석( <%= r.getSeat() %> )</td>
				<td><%= r.getLuggage() %><br><%= r.getMeal() %></td>
			</tr>
			
				<tr style="height:80px;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
	
		</tbody>
	</table>
	
	
	
	

		<table class= "table">
		<thead>
			<tr>
				<td style="font-size:15px;border-top:none;">※&nbsp;탑승객 정보</td>
				<td style="font-size:15px;border-top:none;"></td>
				<td style="font-size:15px;border-top:none;"></td>
				<td style="font-size:15px;border-top:none;"></td>
				<td style="font-size:15px;border-top:none;"></td>
			</tr>
						<tr style="background-color:#f0f5f7;">
			
			<th style="width:13%;">Title</th>
			<th style="width:17%;">이름</th>
			<th style="width:22.5%;">이메일</th>
			<th style="width:22%;">전화번호</th>
			<th>주소</th>

		</thead>
		<tbody>
	
	
					
			<tr style="font-size:16.5px;">
				<td><%= r.getTitle() %></td>
				<td><%= r.getName() %></td>
				<td><%= r.getEmail() %></td>
				<td><%= r.getC_code() %>/<%= r.getPhone() %></td>
				<td><%= r.getAddress() %></td>
			</tr>
			
		<tr style="height:80px;">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			
		</tbody>
	</table><br>
	          <p style="text-align:center; margin-top:2%;">※ 귀하가 예약하신 내용과 정확히 일치합니까?</p>

	<button onclick="$('html, body').stop().animate( { scrollTop : 1300 },770 ); "
	style="margin-left:41.6%; border-radius :10px; color:#3d3d3d; background-color:white;
	border-color:light-gray; border-width:0.2px; width :190px; font-size:25px; height :50px;font-family: 'Jua', sans-serif;">예약 확인</button>

	<!--
	<script src="../design/js/jquery-3.4.1.min.js">
	$(".button").on("click", function (e) {
		e.preventDefault();//anchor이벤트의 기본동작을 막는다.
		var thisTarget = $(this).attr("href");
		$(window).scrollTop($(thisTarget).offset().top);
	});

	</script>
	<input type="button" class="button" value="확인" style="position:absolute;margin-top:165px; left:220px;border-radius :10px; color:#3d3d3d;
	border-color:white; border-width:0.2px; width :205px; font-size:25px; height :60px;font-family: 'Jua', sans-serif;"/>-->

	
	
	
	<% //System.out.println(request.getContextPath()); //myWeb%>
	
	
	<div class="page">
		<br><br><br><br><br><br><br>
		<br><br><br><br>
		<h2 style="text-align: center;  font-family: 'Jua', sans-serif;">💳 Payment</h2>
		<br><p style="text-align:center;">
	             선택할 수 있는 결제 옵션이 여러 가지입니다. 바우처 및 돌핀에어 마스터 카드 이외의 결제 옵션에는 수수료가 부과됩니다.
	             <br> 결제 옵션 및 수수료는 통화별로 다를 수 있습니다. 또한 귀하의 카드 데이터는 안전하게 처리됩니다</p>
	
	<hr style="margin-top:4%; margin-bottom:-7%;">
		<!-- 4번에서는 payment 정보만 추가하면 됨 -->
  <div class="page__demo"> <!-- 서버 DEPLOY 문제?!동기화 -->
    <form class="payment-card" action="<%= request.getContextPath() %>/Reserve.do" style="margin: 0 auto;" method="post">    
    
    
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
//$("#info").serialize();
</script> 
<!-- 여기까지 결제정보/date/pmr_no 뺴고 예약정보를 객체로 전송하기 / 예약은 따로 들어갈것임/ 여기가 사용자가 필수로 눌러야하는 마지막 버튼이므로 여기서 db가 insert되어야함!-->
 <!-- 1. 객체 전송(ajax/json) -->
 <!-- 제이슨 등으로 JQUERY 객체 전송 하기!!! 통째로 OR 노가다 -->
 
  <!-- 2. 각 객체 따로 전송() 최종전송--> <!-- 보여줘야할 때 빼고는 r. 정보들을 다음페이지까지 이어올 필요 없음-->
 
 
 <!-- 예약 만료시 탑승객 정보가 뜨지 않았음 -->
 
 
    <input style="visibility:hidden" name="route_no" value=<%= r.getRoute_no() %>/>
    <input style="visibility:hidden" name="from" value=<%= r.getFrom() %>/>
    <input style="visibility:hidden" name="to" value=<%= r.getTo() %>/>
    <input style="visibility:hidden" name="departure" value=<%= r.getDeparture() %>/>
    <input style="visibility:hidden" name="arrival" value=<%= r.getArrival2() %>/>
 
 
      <input style="visibility:hidden" name="email" value=<%= r.getEmail() %>/><!-- user 이면 userid가 들어감 -->
      <input style="visibility:hidden" name="title" value=<%= r.getTitle() %>/>
      <input style="visibility:hidden" name="name" value=<%= r.getName() %>/>
      <input style="visibility:hidden" name="c_code" value=<%= r.getC_code() %>/>
      <input style="visibility:hidden" name="phone" value=<%= r.getPhone() %>/>
      <input style="visibility:hidden" name="address" value=<%= r.getAddress() %>/>

      <input style="visibility:hidden" name="pclass" value=<%= r.getPclass() %>/>
      <input style="visibility:hidden" name="seat" value=<%= r.getSeat() %>/>
      <input style="visibility:hidden" name="luggage" value=<%= r.getLuggage() %>/>
      <input style="visibility:hidden" name="meal" value=<%= r.getMeal() %>/>
      
      <div class="payment-card__front" style="width:500px;">
        <div class="payment-card__group">
          <label class="payment-card__field">
            <span class="payment-card__hint">Holder of card</span>
            <input class="payment-card__input" placeholder="Holder of card" pattern="[A-Za-z, ]{2,}" name="owner" required>
          </label>
        </div>
        <div class="payment-card__group">
          <label class="payment-card__field">
            <span class="payment-card__hint">Number of card</span>
            <input type="text" class="payment-card__input" placeholder="Number of card" pattern="[0-9]{16}" name="card_no" required>
          </label>
        </div>
        <div class="payment-card__group">
          <span class="payment-card__caption">valid thru</span>
        </div>
        <div class="payment-card__group payment-card__footer">
          <label class="payment-card__field payment-card__month">
            <span class="payment-card__hint">Month</span>
            <input type="text" class="payment-card__input" placeholder="MM" maxlength="2" pattern="[0-9]{2}" name="mm" required>
          </label>
          <span class="payment-card__separator">/</span>
          <label class="payment-card__field payment-card__year">
            <span class="payment-card__hint">Year</span>
            <input type="text" class="payment-card__input" placeholder="YY" maxlength="2" pattern="[0-9]{2}" name="yy" required>
          </label>
        </div>
      </div>
      
      <div class="payment-card__back" style="width:500px; height:300px;">
        <div class="payment-card__group">
          <label class="payment-card__field payment-card__cvc">
            <span class="payment-card__hint">CVC</span>
            <input type="text" class="payment-card__input" placeholder="CVC" maxlength="3" pattern="[0-9]{3}" name="cvc" required>
          </label>
        </div>
      </div><br>
      
<input type="submit" id="maybe-button"  value="결제 하기" style="position:absolute;margin-top:170px; left:200px;border-radius :10px; color:#3d3d3d;
	border-color:white; border-width:0.2px; width :205px; font-size:25px; height :60px;font-family: 'Jua', sans-serif;"/>
	    </form>
	          <p style="text-align:center; margin-top:8%;">모든 사항을 완전히 이해하고 확인하였습니까?</p>
	    
	    <p style="margin-top:50px;"></p>
  </div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
<br><br>
<br>
<br style="margin-top:100px;">

     <!--onclick="reserve2();"-->
</div>
<link rel="stylesheet" href="../../design/css/reserve.css">
<link rel="stylesheet" href="../../design/css/card.css">

<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
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



<style>

.payment-card{
  position: relative;
  width: 60rem;  
  padding-bottom: 3.5rem;
}

.payment-card__front{
  width: 65%;
  padding: 5%;
  
  border-radius: 10px;
  background-color: #f0f0ee;
  box-shadow: 0 0 10px #f4f4f2;
  border: 1px solid #a29e97;

  position: relative;
  z-index: 1;
}

.payment-card__back{
  width: 65%;
  padding: 25% 5% 10%;
  text-align: end;
  
  border-radius: 10px;
  border: 1px solid #dad9d6;
  background-color: #e0ddd7;
  box-shadow: 0 0 20px #f3f3f3;

  position: absolute;
  bottom: 0;
  right: 0;
}

.payment-card__back::before{
  content: "";
  width: 100%;
  height: 6.5rem;
  background-color: #8e8b85;

  position: absolute;
  top: 3.5rem;
  right: 0;
}

.payment-card__group:nth-child(n+2){
  margin-top: 2rem;
}

.payment-card__field{
  display: inline-block;
  vertical-align: middle;
  width: 100%;
}

.payment-card__month, .payment-card__year, .payment-card__cvc{
  width: 25%;
}

.payment-card__hint{
  position: absolute;
  left: -9999px;
}

.payment-card__input{
  box-sizing: border-box;
  width: 100%;
  padding: 1rem;
  border: 3px solid #d0d0ce;  
  
  font-family: inherit;
  font-size: 100%;
}

.payment-card__input:focus{
  outline: none;
  border-color: #fdde60;
}

.payment-card__caption{
  text-transform: uppercase;
  font-size: 1.2rem;
}

.payment-card__separator{
  font-size: 3.2rem;
  color: #c4c4c3;

  margin-left: 1.2rem;
  margin-right: 1.2rem;
  display: inline-block;
  vertical-align: middle;
}

.payment-card__footer{
  background-repeat: no-repeat;
  background-position: calc(100% - 6.2rem) 50%, 100% 50%;
  background-size: 5.2rem;  
  background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI2MCIgaGVpZ2h0PSIzNiIgdmlld0JveD0iMCAwIDMwMCAxODAiPjxwYXRoIGQ9Ik0yOTguMDMyIDkwLjVjLjAxNCA0OC45MzYtMzkuNjQ2IDg4LjYxNC04OC41ODIgODguNjI3LTQ4LjkzNy4wMTItODguNjE0LTM5LjY0Ni04OC42MjctODguNTgyVjkwLjVjLS4wMTMtNDguOTM1IDM5LjY0Ny04OC42MTUgODguNTgxLTg4LjYyOCA0OC45MzctLjAxMyA4OC42MTUgMzkuNjQ3IDg4LjYyOCA4OC41ODN2LjA0NXoiIGZpbGw9IiNmOTAiLz48cGF0aCBkPSJNOTAuMDAxIDEuODk1QzQxLjM1NSAyLjIwNCAxLjk2NyA0MS43ODEgMS45NjcgOTAuNWMwIDQ4LjkwOSAzOS42OTUgODguNjA0IDg4LjYwNSA4OC42MDQgMjIuOTU1IDAgNDMuODc5LTguNzQ4IDU5LjYyNC0yMy4wODZsLS4wMDctLjAwNGguMDE5YTg5LjQzNyA4OS40MzcgMCAwIDAgOC45OTUtOS40ODhIMTQxLjA1YTg2LjUzNiA4Ni41MzYgMCAwIDEtNi42MDYtOS4xMjdoMzEuMzA4YTg4Ljc1IDg4Ljc1IDAgMCAwIDUuMTU4LTkuNDg4aC00MS42MzVhODcuMzkyIDg3LjM5MiAwIDAgMS0zLjcwMy05LjMwOWg0OS4wNDVhODguMzg4IDg4LjM4OCAwIDAgMCA0LjU2LTI4LjEwM2MwLTYuNTEyLS43MDYtMTIuODYxLTIuMDQyLTE4Ljk3NGgtNTQuMTY0YTg4LjM0NyA4OC4zNDcgMCAwIDEgMi41MjgtOS4zMDhoNDkuMDYzYTg4LjYxOCA4OC42MTggMCAwIDAtMy44Mi05LjQ4N0gxMjkuMjdhODUuMDEzIDg1LjAxMyAwIDAgMSA1LjA4NC05LjMwN2gzMS4yODVhODguNzk4IDg4Ljc5OCAwIDAgMC02Ljg3Ny05LjQ4OGgtMTcuNDQzYTgyLjIzMiA4Mi4yMzIgMCAwIDEgOC44ODktOC45NWMtMTUuNzQ2LTE0LjM0LTM2LjY3Ni0yMy4wOS01OS42MzYtMjMuMDloLS41NzF6IiBmaWxsPSIjYzAwIi8+PHBhdGggZD0iTTI4OS4xNDMgMTM2LjgyYy40ODIgMCAuOTUxLjEyNSAxLjQwOS4zNzEuNDYuMjQ2LjgxNC42MDEgMS4wNyAxLjA2Mi4yNTYuNDU2LjM4NC45MzcuMzg0IDEuNDM1IDAgLjQ5Mi0uMTI3Ljk2OC0uMzc5IDEuNDI0LS4yNTEuNDU1LS42MDUuODEtMS4wNjEgMS4wNjMtLjQ1MS4yNDktLjkyOC4zNzUtMS40MjQuMzc1cy0uOTcyLS4xMjYtMS40MjYtLjM3NWEyLjcxIDIuNzEgMCAwIDEtMS4wNjMtMS4wNjMgMi45MDggMi45MDggMCAwIDEtLjM3Ny0xLjQyNGMwLS40OTguMTI3LS45NzkuMzg0LTEuNDM1YTIuNjYzIDIuNjYzIDAgMCAxIDEuMDcxLTEuMDYyIDIuOTcgMi45NyAwIDAgMSAxLjQxMi0uMzcxbTAgLjQ3NWMtLjQwMSAwLS43OTMuMTA0LTEuMTc2LjMxMS0uMzguMjA3LS42NzcuNS0uODkxLjg4OGEyLjM3OCAyLjM3OCAwIDAgMC0uMzI1IDEuMTk0YzAgLjQxMi4xMDYuODEuMzE1IDEuMTg4LjIxNC4zNzcuNTEuNjczLjg4OC44ODUuMzgxLjIxMS43NzYuMzE1IDEuMTg4LjMxNS40MTQgMCAuODEtLjEwNCAxLjE4OS0uMzE1LjM3OC0uMjEyLjY3My0uNTA4Ljg4NC0uODg1YTIuMzkyIDIuMzkyIDAgMCAwLS4wMDgtMi4zODIgMi4xNzkgMi4xNzkgMCAwIDAtLjg5NC0uODg4IDIuNDAyIDIuNDAyIDAgMCAwLTEuMTctLjMxMW0tMS4yNTYgMy45NzV2LTMuMDgyaDEuMDYyYy4zNiAwIC42MjIuMDI4Ljc4NC4wODhhLjc1OC43NTggMCAwIDEgLjM4OC4yOTcuODEzLjgxMyAwIDAgMS0uMDk4IDEuMDM5Ljk0OS45NDkgMCAwIDEtLjYzOS4yODEuODk2Ljg5NiAwIDAgMSAuMjY0LjE2NGMuMTI1LjEyLjI3NS4zMjMuNDU1LjYxbC4zNzUuNjAzaC0uNjA2bC0uMjcyLS40ODVjLS4yMTUtLjM4Mi0uMzg4LS42Mi0uNTIxLS43MTgtLjA5MS0uMDY5LS4yMjQtLjEwNS0uMzk3LS4xMDVoLS4yOTN2MS4zMTFoLS41bS40OTYtMS43MzhoLjYwNGMuMjg4IDAgLjQ4My0uMDQ0LjU4OC0uMTI5YS40MjEuNDIxIDAgMCAwIC4xNTktLjM0Mi40MDQuNDA0IDAgMCAwLS4wNzUtLjI0NC40NjYuNDY2IDAgMCAwLS4yMTMtLjE2MmMtLjA4OS0uMDM1LS4yNTUtLjA1NS0uNDk3LS4wNTVoLS41NjR2LjkzMiIgZmlsbD0iI2ZjYjM0MCIvPjxnPjxwYXRoIGQ9Ik0xMTkuOTc1IDExNS45MmwxLjE4LTguMDJjLS42NDUgMC0xLjU5My4yNzktMi40MzEuMjc5LTMuMjg0IDAtMy42OTQtMS43NTUtMy40MzYtMy4wMzdsMy4yMzYtMTYuMTNoNC45OTJsMS4wMjktOS4xMDNoLTQuNzA1bC45NTgtNS41MTZoLTkuODQyYy0uMjA4LjIwOC01LjU2OCAzMS4wMjItNS41NjggMzQuNzc2IDAgNS41NTUgMy4xMTggOC4wMjcgNy41MTYgNy45ODggMy40NDItLjAzIDYuMTI1LS45ODIgNy4wNzEtMS4yMzd6TTEyMi45NjIgMTAwLjYzMmMwIDEzLjMzMiA4Ljc5OSAxNi40OTkgMTYuMjk3IDE2LjQ5OSA2LjkyMSAwIDEwLjU1LTEuNjA0IDEwLjU1LTEuNjA0bDEuNjYyLTkuMXMtNS44NDggMi4zNzgtMTAuNjAxIDIuMzc4Yy0xMC4xMzEgMC04LjM1NS03LjU1NC04LjM1NS03LjU1NGwxOS40NjMuMDU5czEuMjM5LTYuMTExIDEuMjM5LTguNjAyYzAtNi4yMTctMy4zODctMTMuODUtMTMuNzQ1LTEzLjg1LTkuNDg2LjAwMy0xNi41MSAxMC4yMjQtMTYuNTEgMjEuNzc0em0xNi41NDYtMTMuMzI1YzUuMzI0IDAgNC4zNDIgNS45ODQgNC4zNDIgNi40NjloLTEwLjQ3NGMwLS42Mi45ODktNi40NyA2LjEzMi02LjQ3ek0xOTkuMjQ2IDExNS45MTdsMS42ODktMTAuMjg0cy00LjYzMiAyLjMyLTcuODA3IDIuMzJjLTYuNjkzIDAtOS4zNzgtNS4xMS05LjM3OC0xMC42IDAtMTEuMTM3IDUuNzU4LTE3LjI2NSAxMi4xNjgtMTcuMjY1IDQuODA4IDAgOC42NjUgMi42OTkgOC42NjUgMi42OTlsMS41NC05Ljk5M3MtNC41NTQtMy4yOS05LjQ1Ni0zLjMwOGMtMTQuNzQ1LS4wNTgtMjMuMTgyIDEwLjIwOC0yMy4xODIgMjcuOTU1IDAgMTEuNzYzIDYuMjQ4IDE5Ljc2OCAxNy41MDYgMTkuNzY4IDMuMTgzIDAgOC4yNTUtMS4yOTIgOC4yNTUtMS4yOTJ6TTY4LjA4NiA3OS4wMDZjLTYuNDcgMC0xMS40MjcgMi4wNzktMTEuNDI3IDIuMDc5bC0xLjM3IDguMTI3czQuMDkzLTEuNjYzIDEwLjI4LTEuNjYzYzMuNTE0IDAgNi4wODQuMzk1IDYuMDg0IDMuMjUgMCAxLjczNC0uMzE0IDIuMzc0LS4zMTQgMi4zNzRzLTIuNzcyLS4yMzEtNC4wNTYtLjIzMWMtOS4yMSAwLTE2LjcyOSAzLjQ4Mi0xNi43MjkgMTMuOTggMCA4LjI3MyA1LjYyMyAxMC4xNyA5LjEwOCAxMC4xNyA2LjY1NyAwIDkuMjkyLTQuMjAzIDkuNDQ0LTQuMjE1bC0uMDc3IDMuNDg4aDguMzA3bDMuNzA2LTI1Ljk4YzAtMTEuMDI1LTkuNjE2LTExLjM4LTEyLjk1Ni0xMS4zOHptMS40MzggMjEuMDk2Yy4xOCAxLjU4Ni0uNDEgOS4wODYtNi4wOTIgOS4wODYtMi45MyAwLTMuNjkxLTIuMjQtMy42OTEtMy41NjIgMC0yLjU4NCAxLjQwMy01LjY4MyA4LjMxNS01LjY4MyAxLjYxIDAgMS4xOTcuMTE2IDEuNDY4LjE1OXpNODkuODcgMTE2LjljMi4xMjYgMCAxNC4yNzMuNTQgMTQuMjczLTExLjk5NCAwLTExLjcyMS0xMS4yNDQtOS40MDQtMTEuMjQ0LTE0LjExNCAwLTIuMzQyIDEuODMzLTMuMDggNS4xODQtMy4wOCAxLjMyOSAwIDYuNDQ3LjQyMyA2LjQ0Ny40MjNsMS4xODktOC4zM3MtMy4zMTItLjc0MS04LjcwNC0uNzQxYy02Ljk4IDAtMTQuMDYzIDIuNzg2LTE0LjA2MyAxMi4zMTggMCAxMC44MDIgMTEuODEyIDkuNzE3IDExLjgxMiAxNC4yNjcgMCAzLjAzNy0zLjMgMy4yODctNS44NDQgMy4yODctNC40MDEgMC04LjM2My0xLjUxMS04LjM3Ny0xLjQzOGwtMS4yNiA4LjI0NWMuMjMuMDcgMi42NzUgMS4xNTcgMTAuNTg4IDEuMTU3ek0yNzcuMDYzIDcxLjQ0OWwtMS43MDUgMTIuNzA5cy0zLjU1My00LjkwNS05LjExMi00LjkwNWMtMTAuNDU5IDAtMTUuODQ5IDEwLjQyMy0xNS44NDkgMjIuMzk2IDAgNy43MyAzLjg0NCAxNS4zMDcgMTEuNjk5IDE1LjMwNyA1LjY1MSAwIDguNzg0LTMuOTQxIDguNzg0LTMuOTQxbC0uNDE1IDMuMzY1aDkuMTc4bDcuMjA3LTQ0Ljg2Mi05Ljc4Ny0uMDd6bS00LjA1MiAyNC43YzAgNC45ODQtMi40NjggMTEuNjQtNy41ODEgMTEuNjQtMy4zOTYgMC00Ljk4OC0yLjg1LTQuOTg4LTcuMzIzIDAtNy4zMTUgMy4yODUtMTIuMTQgNy40MzItMTIuMTQgMy4zOTQgMCA1LjEzNyAyLjMzIDUuMTM3IDcuODI0ek0xNy4wMDUgMTE2LjQxN2w1Ljc0My0zMy44Ny44NDQgMzMuODdoNi40OTlsMTIuMTI1LTMzLjg3LTUuMzcxIDMzLjg3aDkuNjU4bDcuNDM3LTQ0LjkyMi0xNS4zNDItLjExNy05LjEyNiAyNy41MDQtLjI1LTI3LjM4N2gtMTQuMDZsLTcuNTQ0IDQ0LjkyMmg5LjM4N3oiIGZpbGw9IiMwMDYiLz48cGF0aCBkPSJNMTYyLjM1NyAxMTYuNDhjMi43NDYtMTUuNjE0IDMuNzI0LTI3Ljk0NiAxMS43MzItMjUuMzkyIDEuMTUtNi4wNDQgMy44OTEtMTEuMyA1LjE0My0xMy44NTggMCAwLS4zOTYtLjU5LTIuODcxLS41OS00LjIyNSAwLTkuODY2IDguNTc1LTkuODY2IDguNTc1bC44NDMtNS4zMDFoLTguNzg2bC01Ljg4NCAzNi41NjZoOS42ODl6TTIxOS4wMDYgNzkuMDA2Yy02LjQ3MiAwLTExLjQzIDIuMDc5LTExLjQzIDIuMDc5bC0xLjM2OSA4LjEyN3M0LjA5NS0xLjY2MyAxMC4yOC0xLjY2M2MzLjUxNCAwIDYuMDgzLjM5NSA2LjA4MyAzLjI1IDAgMS43MzQtLjMxMyAyLjM3NC0uMzEzIDIuMzc0cy0yLjc3LS4yMzEtNC4wNTUtLjIzMWMtOS4yMSAwLTE2LjcyOSAzLjQ4Mi0xNi43MjkgMTMuOTggMCA4LjI3MyA1LjYyMiAxMC4xNyA5LjEwNyAxMC4xNyA2LjY1NSAwIDkuMjkyLTQuMjAzIDkuNDQzLTQuMjE1bC0uMDc4IDMuNDg4aDguMzFsMy43MDQtMjUuOThjLjAwMS0xMS4wMjUtOS42MTUtMTEuMzgtMTIuOTUzLTExLjM4em0xLjQzNiAyMS4wOTZjLjE4IDEuNTg2LS40MTEgOS4wODYtNi4wOTIgOS4wODYtMi45MzIgMC0zLjY5Mi0yLjI0LTMuNjkyLTMuNTYyIDAtMi41ODQgMS40MDItNS42ODMgOC4zMTUtNS42ODMgMS42MTEgMCAxLjE5OS4xMTYgMS40NjkuMTU5ek0yNDEuNTIyIDExNi40OGMxLjUwOC0xMS40ODcgNC4yOTktMjcuNjE1IDExLjczMS0yNS4zOTIgMS4xNDktNi4wNDQuMDQxLTYuMDI4LTIuNDMzLTYuMDI4LTQuMjI4IDAtNS4xNjQuMTU0LTUuMTY0LjE1NGwuODQ0LTUuMzAxaC04Ljc4NWwtNS44ODQgMzYuNTY3aDkuNjl6IiBmaWxsPSIjMDA2Ii8+PGc+PHBhdGggZD0iTTEyMi40MzQgMTEzLjA1OWwxLjE4MS04LjAxOWMtLjY0NSAwLTEuNTk0LjI3Ni0yLjQzMS4yNzYtMy4yODQgMC0zLjY0Ni0xLjc0Ni0zLjQzNy0zLjAzN2wyLjY1My0xNi4zNjJoNC45OTFsMS4yMDUtOC44N2gtNC43MDZsLjk1OC01LjUxNmgtOS40MzRjLS4yMDguMjA4LTUuNTY5IDMxLjAyMy01LjU2OSAzNC43NzUgMCA1LjU1NSAzLjExOSA4LjAyOSA3LjUxNyA3Ljk4OSAzLjQ0NC0uMDI5IDYuMTI2LS45ODIgNy4wNzItMS4yMzZ6TTEyNS40MjMgOTcuNzdjMCAxMy4zMzIgOC44IDE2LjUgMTYuMjk3IDE2LjUgNi45MiAwIDkuOTY1LTEuNTQ3IDkuOTY1LTEuNTQ3bDEuNjYyLTkuMDk5cy01LjI2NCAyLjMxOS0xMC4wMTggMi4zMTljLTEwLjEzIDAtOC4zNTYtNy41NTMtOC4zNTYtNy41NTNoMTkuMTcyczEuMjM4LTYuMTEzIDEuMjM4LTguNjA0YzAtNi4yMTYtMy4wOTQtMTMuNzktMTMuNDUyLTEzLjc5LTkuNDg2LjAwMi0xNi41MDggMTAuMjIzLTE2LjUwOCAyMS43NzR6bTE2LjU0NC0xMy4zMjVjNS4zMjQgMCA0LjM0MiA1Ljk4MyA0LjM0MiA2LjQ2N2gtMTAuNDc0YzAtLjYxOC45OS02LjQ2NyA2LjEzMi02LjQ2N3pNMjAxLjcwNyAxMTMuMDU1bDEuNjg4LTEwLjI4NXMtNC42MjkgMi4zMjEtNy44MDYgMi4zMjFjLTYuNjkyIDAtOS4zNzYtNS4xMS05LjM3Ni0xMC42IDAtMTEuMTM3IDUuNzU4LTE3LjI2NCAxMi4xNjgtMTcuMjY0IDQuODA3IDAgOC42NjUgMi42OTkgOC42NjUgMi42OTlsMS41NC05Ljk5M3MtNS43MjEtMi4zMTUtMTAuNjI1LTIuMzE1Yy0xMC44OTEgMC0yMS40ODYgOS40NDgtMjEuNDg2IDI3LjE5MiAwIDExLjc2NiA1LjcyMSAxOS41MzcgMTYuOTc5IDE5LjUzNyAzLjE4My4wMDEgOC4yNTMtMS4yOTIgOC4yNTMtMS4yOTJ6TTcwLjU0NyA3Ni4xNDNjLTYuNDY5IDAtMTEuNDI4IDIuMDc5LTExLjQyOCAyLjA3OWwtMS4zNjkgOC4xMjdzNC4wOTMtMS42NjMgMTAuMjgtMS42NjNjMy41MTMgMCA2LjA4My4zOTUgNi4wODMgMy4yNSAwIDEuNzM0LS4zMTUgMi4zNzQtLjMxNSAyLjM3NHMtMi43NzEtLjIzMi00LjA1NC0uMjMyYy04LjE1OSAwLTE2LjczIDMuNDgyLTE2LjczIDEzLjk4IDAgOC4yNzIgNS42MjMgMTAuMTcgOS4xMDggMTAuMTcgNi42NTYgMCA5LjUyNS00LjMxOSA5LjY3OC00LjMzMmwtLjMxMSAzLjYwNWg4LjMwN2wzLjcwNi0yNS45ODFjMC0xMS4wMjItOS42MTUtMTEuMzc3LTEyLjk1NS0xMS4zNzd6bTIuMDIxIDIxLjE1NGMuMTggMS41ODctLjk5NSA5LjAyNi02LjY3NSA5LjAyNi0yLjkzIDAtMy42OTItMi4yMzgtMy42OTItMy41NjIgMC0yLjU4MiAxLjQwMy01LjY4MiA4LjMxNi01LjY4MiAxLjYwOC4wMDIgMS43OC4xNzQgMi4wNTEuMjE4ek05Mi4zMzEgMTE0LjAzOGMyLjEyNSAwIDE0LjI3My41NCAxNC4yNzMtMTEuOTk1IDAtMTEuNzE5LTExLjI0NS05LjQwNC0xMS4yNDUtMTQuMTEyIDAtMi4zNDQgMS44MzMtMy4wODIgNS4xODMtMy4wODIgMS4zMyAwIDYuNDQ3LjQyMyA2LjQ0Ny40MjNsMS4xOS04LjMzYzAgLjAwMS0zLjMxMi0uNzQxLTguNzA0LS43NDEtNi45NzkgMC0xNC4wNjMgMi43ODYtMTQuMDYzIDEyLjMxOCAwIDEwLjgwMSAxMS44MTIgOS43MTcgMTEuODEyIDE0LjI2NyAwIDMuMDM3LTMuMyAzLjI4NC01Ljg0MyAzLjI4NC00LjQwMSAwLTguMzY0LTEuNTEtOC4zNzgtMS40MzhsLTEuMjU4IDguMjQ2Yy4yMjguMDcgMi42NzIgMS4xNiAxMC41ODYgMS4xNnpNMjc5Ljg1MiA2OC42NjhsLTIuMDM1IDEyLjYyN3MtMy41NTEtNC45MDUtOS4xMS00LjkwNWMtOC42NDQgMC0xNS44NDkgMTAuNDIyLTE1Ljg0OSAyMi4zOTcgMCA3LjczIDMuODQzIDE1LjMwNCAxMS42OTkgMTUuMzA0IDUuNjUxIDAgOC43ODQtMy45NCA4Ljc4NC0zLjk0bC0uNDE1IDMuMzY1aDkuMTc2bDcuMjA3LTQ0Ljg2My05LjQ1Ny4wMTV6bS00LjM4MSAyNC42MmMwIDQuOTgzLTIuNDY3IDExLjYzOS03LjU4MiAxMS42MzktMy4zOTUgMC00Ljk4Ni0yLjg1LTQuOTg2LTcuMzIzIDAtNy4zMTQgMy4yODUtMTIuMTQgNy40My0xMi4xNCAzLjM5Ni0uMDAxIDUuMTM4IDIuMzMyIDUuMTM4IDcuODI0ek0xOS40NjYgMTEzLjU1NWw1Ljc0My0zMy44Ny44NDMgMzMuODdoNi41bDEyLjEyNS0zMy44Ny01LjM3MSAzMy44N2g5LjY1OGw3LjQzOC00NC45MjNINDEuNDY3bC05LjMwMSAyNy41NjMtLjQ4NC0yNy41NjNIMTcuOTE1bC03LjU0NSA0NC45MjNoOS4wOTZ6TTE2NC44MTggMTEzLjYxN2MyLjc0Ni0xNS42MTYgMy4yNTUtMjguMjk2IDkuODA4LTI1Ljk3NSAxLjE0Ny02LjA0NCAyLjI1NC04LjM4MiAzLjUwNi0xMC45NCAwIDAtLjU4Ny0uMTIzLTEuODE5LS4xMjMtNC4yMjUgMC03LjM1NSA1Ljc3Mi03LjM1NSA1Ljc3MmwuODQxLTUuMzAxaC04Ljc4NGwtNS44ODUgMzYuNTY3aDkuNjg4ek0yMjMuNDc1IDc2LjE0M2MtNi40NjkgMC0xMS40MjggMi4wNzktMTEuNDI4IDIuMDc5bC0xLjM2OCA4LjEyN3M0LjA5My0xLjY2MyAxMC4yOC0xLjY2M2MzLjUxMyAwIDYuMDgxLjM5NSA2LjA4MSAzLjI1IDAgMS43MzQtLjMxMyAyLjM3NC0uMzEzIDIuMzc0cy0yLjc3LS4yMzItNC4wNTUtLjIzMmMtOC4xNTggMC0xNi43MjkgMy40ODItMTYuNzI5IDEzLjk4IDAgOC4yNzIgNS42MjIgMTAuMTcgOS4xMDcgMTAuMTcgNi42NTYgMCA5LjUyNS00LjMxOSA5LjY3Ny00LjMzMmwtLjMwOSAzLjYwNWg4LjMwN2wzLjcwNS0yNS45ODFjLjAwMS0xMS4wMjItOS42MTUtMTEuMzc3LTEyLjk1NS0xMS4zNzd6bTIuMDI0IDIxLjE1NGMuMTggMS41ODctLjk5NiA5LjAyNi02LjY3OCA5LjAyNi0yLjkzIDAtMy42OS0yLjIzOC0zLjY5LTMuNTYyIDAtMi41ODIgMS40MDMtNS42ODIgOC4zMTUtNS42ODIgMS42MDguMDAyIDEuNzguMTc0IDIuMDUzLjIxOHpNMjQ0LjAyMyAxMTMuNjE3YzIuNzQ3LTE1LjYxNiAzLjI1Ni0yOC4yOTYgOS44MDctMjUuOTc1IDEuMTQ5LTYuMDQ0IDIuMjU3LTguMzgyIDMuNTA4LTEwLjk0IDAgMC0uNTg3LS4xMjMtMS44Mi0uMTIzLTQuMjI0IDAtNy4zNTQgNS43NzItNy4zNTQgNS43NzJsLjg0LTUuMzAxaC04Ljc4M2wtNS44ODUgMzYuNTY3aDkuNjg3ek0yODkuMTA1IDEwNy45NzVjLjQ3OSAwIC45NTEuMTIzIDEuNDA2LjM3My40NTkuMjQyLjgxNi41OTggMS4wNzIgMS4wNTkuMjU3LjQ1OC4zODMuOTM1LjM4MyAxLjQzNCAwIC40OTMtLjEyNi45NjktLjM3OSAxLjQyNGEyLjY1NSAyLjY1NSAwIDAgMS0xLjA1OSAxLjA2M2MtLjQ1NC4yNS0uOTMuMzc2LTEuNDI0LjM3Ni0uNDk4IDAtLjk3NC0uMTI2LTEuNDI5LS4zNzZhMi42NzggMi42NzggMCAwIDEtMS4wNTgtMS4wNjMgMi44NjUgMi44NjUgMCAwIDEtLjM4MS0xLjQyNGMwLS40OTkuMTI3LS45NzYuMzg0LTEuNDM0YTIuNjMgMi42MyAwIDAgMSAxLjA3My0xLjA1OWMuNDYxLS4yNS45MzMtLjM3MyAxLjQxMi0uMzczbTAgLjQ3MmMtLjQwMSAwLS43OTMuMTA0LTEuMTc2LjMxM2EyLjE4MyAyLjE4MyAwIDAgMC0uODk0Ljg4NWMtLjIxNC4zODEtLjMyMi43OC0uMzIyIDEuMTk0cy4xMDQuODEuMzEzIDEuMTg4Yy4yMTMuMzc3LjUwOS42NzMuODkxLjg4Ni4zNzguMjA4Ljc3My4zMTMgMS4xODguMzEzLjQxMiAwIC44MS0uMTA1IDEuMTg4LS4zMTMuMzc4LS4yMTMuNjc0LS41MDkuODg0LS44ODYuMjExLS4zODEuMzE0LS43NzQuMzE0LTEuMTg4cy0uMTA3LS44MTMtLjMyMS0xLjE5NGEyLjE2IDIuMTYgMCAwIDAtLjg5NC0uODg1IDIuNDA4IDIuNDA4IDAgMCAwLTEuMTcxLS4zMTNtLTEuMjU1IDMuOTc2di0zLjA4M2gxLjA2MWMuMzYxIDAgLjYyNS4wMjkuNzg1LjA4OGEuNzU2Ljc1NiAwIDAgMSAuMzg4LjI5Ny43ODQuNzg0IDAgMCAxIC4xNDYuNDUxLjgxNy44MTcgMCAwIDEtLjI0NC41ODguOTM0LjkzNCAwIDAgMS0uNjM3LjI4Ljk0Ni45NDYgMCAwIDEgLjI2Mi4xNjNjLjEyMy4xMjIuMjc1LjMyNi40NTUuNjExbC4zNzcuNjA0aC0uNjA5bC0uMjcxLS40ODVjLS4yMTYtLjM4My0uMzg5LS42MjEtLjUyMS0uNzE4LS4wOTEtLjA3MS0uMjI0LS4xMDYtLjM5OS0uMTA2aC0uMjkxdjEuMzExbC0uNTAyLS4wMDFtLjQ5OC0xLjczNWguNjA0Yy4yODkgMCAuNDg0LS4wNDMuNTg4LS4xMjlhLjQxOC40MTggMCAwIDAgLjE2LS4zNDIuNDA0LjQwNCAwIDAgMC0uMDc1LS4yNDIuNDU4LjQ1OCAwIDAgMC0uMjEzLS4xNjRjLS4wOTEtLjAzNS0uMjU0LS4wNTMtLjQ5OC0uMDUzaC0uNTY1di45MyIgZmlsbD0iI2ZmZiIvPjwvZz48L2c+PC9zdmc+), url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEiIHdpZHRoPSI2MCIgaGVpZ2h0PSIxOCIgdmlld0JveD0iMCAwIDg4LjA0ODcgMjYuOTk1OSIgaWQ9InN2ZzIiPjxkZWZzIGlkPSJkZWZzNCI+PHN0eWxlIGlkPSJzdHlsZTYiLz48L2RlZnM+PGcgaWQ9Imc1MDg4Ij48cGF0aCBpZD0icG9seWdvbjEwIiBmaWxsPSIjMDA0Njg2IiBkPSJNMzEuMDE4IDI2LjYwOEwzNS40NzUuNDU0aDcuMTNsLTQuNDYgMjYuMTU0aC03LjEyN3oiLz48cGF0aCBkPSJNNjMuOTk5IDEuMDk4QzYyLjU4Ni41NjggNjAuMzczIDAgNTcuNjA5IDBjLTcuMDQzIDAtMTIuMDA1IDMuNTQ3LTEyLjA0NyA4LjYzLS4wNCAzLjc1OSAzLjU0MiA1Ljg1NSA2LjI0NiA3LjEwNiAyLjc3NSAxLjI4MSAzLjcwOCAyLjEgMy42OTQgMy4yNDQtLjAxNyAxLjc1My0yLjIxNSAyLjU1NC00LjI2NCAyLjU1NC0yLjg1NCAwLTQuMzctLjM5Ni02LjcxLTEuMzcybC0uOTItLjQxNy0xIDUuODU1YzEuNjY2LjczIDQuNzQ0IDEuMzYzIDcuOTQxIDEuMzk2IDcuNDk0IDAgMTIuMzU4LTMuNTA3IDEyLjQxMy04LjkzNS4wMjctMi45NzYtMS44NzItNS4yNC01Ljk4NC03LjEwNi0yLjQ5Mi0xLjIxLTQuMDE4LTIuMDE3LTQuMDAyLTMuMjQyIDAtMS4wODggMS4yOTItMi4yNSA0LjA4Mi0yLjI1IDIuMzMyLS4wMzcgNC4wMi40NzIgNS4zMzYgMS4wMDJsLjYzOS4zMDEuOTY2LTUuNjY4eiIgaWQ9InBhdGgxMiIgZmlsbD0iIzAwNDY4NiIvPjxwYXRoIGQ9Ik04Mi4yNzkuNDc4SDc2Ljc3Yy0xLjcwNiAwLTIuOTgzLjQ2Ny0zLjczMyAyLjE3TDYyLjQ1IDI2LjYxNmg3LjQ4NnMxLjIyNC0zLjIyMyAxLjUtMy45M2MuODIgMCA4LjA5LjAxMSA5LjEzLjAxMS4yMTQuOTE2Ljg2OCAzLjkyLjg2OCAzLjkybDYuNjE1LS4wMDFMODIuMjc5LjQ3OG0tOC43OSAxNi44NThjLjU4OS0xLjUwNyAyLjg0LTcuMzEgMi44NC03LjMxLS4wNDIuMDY5LjU4NC0xLjUxNS45NDUtMi40OTZsLjQ4MiAyLjI1NCAxLjY1IDcuNTUzaC01LjkxOHoiIGlkPSJwYXRoMTQiIGZpbGw9IiMwMDQ2ODYiLz48cGF0aCBkPSJNMjUuMDQuNDczbC02Ljk4IDE3LjgzNS0uNzQzLTMuNjI0Yy0xLjMtNC4xNzktNS4zNDgtOC43MDUtOS44NzMtMTAuOTcxbDYuMzgxIDIyLjg3MiA3LjU0My0uMDA5TDMyLjU5LjQ3M0gyNS4wNHoiIGlkPSJwYXRoMTYiIGZpbGw9IiMwMDQ2ODYiLz48cGF0aCBkPSJNMTEuNTg2LjQ1N0guMDkxTDAgMS4wMDFjOC45NDMgMi4xNjUgMTQuODYgNy4zOTcgMTcuMzE3IDEzLjY4M2wtMi41LTEyLjAxOUMxNC4zODYgMS4wMSAxMy4xMzQuNTE1IDExLjU4Ni40NTd6IiBpZD0icGF0aDE4IiBmaWxsPSIjZWY5YjExIi8+PC9nPjwvc3ZnPg==);
}
</style>
<%@include file ="../../common/footer.jsp" %>
