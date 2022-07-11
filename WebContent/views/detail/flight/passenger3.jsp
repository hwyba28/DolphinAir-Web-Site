<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../../common/header.jsp" %>

<%//매핑 안된데서는 받아오기 어려움?!
Reservation r = (Reservation)session2.getAttribute("reservation");//진행중 예약

//Reservation reservation = (Reservation)session2.getAttribute("reserve");//완성된 예약
//System.out.print(reservation.toString2()); %>




<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<p style="background-image: linear-gradient(to right,#001e47, #59b4e3);height:105px; width:100%;"/>


	<div class="stepwizard">
    <div class="stepwizard-row">
        
        <div class="stepwizard-step">
            <button  onclick="window.location.href='/myWeb/views/main/index.jsp';" 
            class="btn btn-circle" style="background-color:red; color:white; margin-left:22px;">◁</button>
            <p style="margin-left:18px;">Flight</p>
        </div> 
          <div class="stepwizard-step">
            <button  onclick="window.location.href='option2.jsp';"
             type="button" class="btn btn-circle" style="background-color:orange; color:white;margin-left:20px;">2</button>
            <p style="margin-left:16px;">Option</p>
        </div>
          <div class="stepwizard-step">
            <button onclick="window.location.href='passenger3.jsp';"
             type="button" class="btn btn-circle" style="background-color:green; color:white;">3</button>
            <p style="color:black; font-size:15px;">Passenger</p>
        </div>
         <div class="stepwizard-step">
            <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/Flight.go';" 
             class="btn btn-circle" style="cursor:not-allowed;background-color:light-gray; color:white;">4</button>
            <p>Payment</p>
        </div> 
 	
    </div>
</div>

				<%System.out.print("탑승객에서 클래스"+r.getPclass());%>

 
<%	
//	session2.getAttribute(Route_no);
	String luggage = request.getParameter("accept-offers");
	String seat = request.getParameter("accept-offers2"); 
	String meal = request.getParameter("accept-offers3"); 
	
	//System.out.print("내 수화물 ㅜ:"+luggage);
//우선 전에꺼 가져와서
	
//여기서 저장하기 (세션에 할꺼고 여기서 띄우지 않을거면 전에꺼에서 세션에 저장해도 ok)
	
r.setLuggage(luggage);
r.setSeat(seat);
r.setMeal(meal);
//System.out.print(r);
//	System.out.print("내 수화물:"+r.getLuggage());





	//헤더에 세션2 객체
	//항공권 + 세션 추가 옵션 저장
%>


								<form id="passenger_info"  action="<%= request.getContextPath() %>/Flight.go" method="post">
<input type="text" name="route" style="visibility:hidden" value=<%=r.getRoute_no() %>></input>

	<div class="container" style="padding: 80px 0px 100px 0px;">
		<h2 style="text-align:center; font-size:35px;font-family: 'Jua', sans-serif; color:#0e3469;">🙍  탑승객 정보를 입력해주세요</h2><br>

<hr>
 <p style="margin-bottom:-2%;text-align:center;">※ 유효한 신분증에 표시된 모든 탑승객의 이름을 기입하세요. 체크인 시 신분증을 제시해야 합니다.</p>
	<br><br><br>


<!-- 비회원은 비밀번호 자리가 예약 번호이고(자동 생성),  / 별개로 회원은 추가 번호 존재(없어도 됨/이메일 고유번호) -->

<div class="option" style="margin-top:0px; margin-bottom:100px;">
<div class="detail" style="margin:0 auto;height:600px;width:800px; border: 1px solid #aeb7bf; border-radius:10px; background-color:white; padding:10px 10px 10px 19px;">
<br><h3 style="text-align:center; font-size:25px;font-family: 'Jua', sans-serif; margin-top:6px;">📝 My Info</h3>

									<div class="desc" style="margin-left:10%; margin-top:5%;">
									
									<!-- 차후 예약을 조회 할때 사용됩니다. -->
									
									
									
								<!--1. 로그인 상태-->									
								<%if ( m != null ) { %>
									
								<br><h5 style="color:black;font-size:17px;">Email :&nbsp;&nbsp;&nbsp;<%= m.getUserId() %>&nbsp;</h5>
									
									<%--얘는 이걸로 넘어가면 됨 세션 자체로! m.getUserId() --%>
									
									<!-- 로그인 아닐때는 화면 자체가 안돌아가므로 if문 -->
									<hr style="border-color:gray; float:left;width:650px; margin-top:2%;"><br><br>
									<p style="font-size:17px; margin-top:10px;">※ 탑승객 용 추가 정보<br><span style="font-size:13px; color:#9e888b;">- 여권 정보와 동일하게 입력해주세요</span></p>
									<h5 style="margin-top:30px;">Title&nbsp; <select name="title"><option>👧Ms</option><option>👩Mrs</option><option>👨Mr</option></select>
									&nbsp;&nbsp;&nbsp; Full name&nbsp; 
									
									<%if ( m.getUserName() == null ) { %>
									<input type="text" name="name" style="height:27px;" size="18" required/></h5>
									<% } else { %> 	<input type="text" name="name" style="height:27px;" size="18" placeholder="<%=m.getUserName()%>"
									 value="<%=m.getUserName()%>" ><%}%>
									
									
									<h5>Phone &nbsp;&nbsp;<select name ="c_code"><option>+82 한국</option><option>+33 프랑스</option><option>+49 독일</option></select>&nbsp;&nbsp;&nbsp;&nbsp;
									<% if ( m.getPhone() == null ) { %>
									<input type="text" maxlength="15" name="tel" style="height:27px;" required/></h5>
									<% } else  { %>
									<input type="text" maxlength="15" name="tel" placeholder="<%=m.getPhone()%>"
									style="height:27px;" value="<%=m.getPhone()%>"></h5> <%}%>
									
									<h5>Post code / Address<br><br>
									<%if ( m.getAddress() == null ) { %>
									<input name="address" type="text" id="address1"size="59" style="margin-top:-20px;height:27px; required/"></h5>
									<% }  else { %> 	<input type="text" id="address1" size="59" style="height:27px;" name="address" placeholder="<%=m.getAddress()%>" value="<%=m.getAddress()%>">
									<%}%>
									
									
									
											
									<p style="margin-top:8%;color:gray;">회원의 경우 정보가 일치하면 다음으로 넘어가 주십시오</p>
									<p style="margin-top:-2%;font-size:11.5px; color:gray;">&nbsp;※ 작성 시 탑승객 정보가 변경 됩니다.</p>
									<!-- placeholder에 회원정보 표시 -->
									<button onclick="$('html, body').stop().animate( { scrollTop : 1550 },1770 ); " style="visibility:hidden;">다음</button>
										
									<br>
									
									
								<% } else { %>
									
								<br><h5 style="color:black;font-size:17px;">Email &nbsp;&nbsp;<input name="userId" type="text" size="38" style="height:29px;" required/></h5>
									상세 정보가 올바른지 확인하세요!<br>여정을 이메일로 발송해 드리며, 예약 관련 중요한 변경 발생 시 알려드립니다.
									
									<!-- 로그인 아닐때는 화면 자체가 안돌아가므로 if문 -->
									<hr style="border-color:gray; float:left;width:650px; margin-top:2%;"><br><br><br>
									<p style="font-size:17px; margin-top:10px;">※ 탑승객 용 추가 정보<br><span style="font-size:13px; color:#9e888b;">- 여권 정보와 동일하게 입력해주세요</span></p>
									<h5 style="margin-top:30px;">Title&nbsp; <select name="title"><option>Ms</option><option>Mrs</option><option>Mr</option></select>
									&nbsp;&nbsp;&nbsp; Full name&nbsp; 
									
									<input type="text" name="name" style="height:27px;" size="18" required/></h5>
									
									
									<h5>Phone &nbsp;&nbsp;<select name ="c_code"><option>+82 한국</option><option>+33 프랑스</option><option>+49 독일</option></select>&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="text" maxlength="15" name="tel" style="height:27px;" required/></h5>
									
									<h5>Post code / Address<br><br>
									<input name="address" type="text" id="address1"size="59" style="margin-top:-20px;height:27px;" required/></h5>
									
											
									
									
									
									
									
									<p style="margin-top:2%;color:gray;">※ 로그인을 하시면 자동으로 저장된 고객 정보가 입력됩니다.</p>
									
									<!-- placeholder에 회원정보 표시 -->	
									<br>
								<% } %>
									
									
									 
								<!-- RESERVATION은 여기서 저장 안하고 계속 넘기고 여기서는 FLIGHT만 조회하러 가기! (항공 번호만 REQUEST값 받으면 됨!) -->	
						<!-- 회원 비회원여부따라서 이메일 저장 등.. -->
						<% System.out.println("서블릿 전 정보"+r);//null?!%>		<!-- 해결!!! 객체 한번만 생성해서 1에있는 객체를 헤더에서 끌어올려서 전체 공유!!대박!!-->	
									
									
							
								
									</div>								
										
										
								
</div>
  <br><br><br>
<hr>
<br><br>
<div class="button-wrap" style="margin:0 auto;padding: 45px 0px 70px 0px; border: 1px solid #d5dce3; border-radius:10px; background-color:white; height:480px;width:800px;">
<h3>🗹 개인정보 이용 및 제공 동의</h3>
<textarea disabled style="margin-top: 3%; font-size:15px; padding:0px 12px 0px 12px;" rows="15" cols="90">

개인 정보 수집 및 사용에 관한 상세 정보

필수 항목: 칭호, 탑승객 이름, 생년월일(항공편에 따라 다름), 예약 연락처 이름(탑승객과 다른 경우), 휴대폰 번호, 이메일 주소, 신용 카드 또는 직불 카드 결제, 또는 다른 결제 수단을 선택한 경우 계좌 정보를 포함할 수 있는 우편번호 및 결제 정보.

선택 항목: 로열티 프로그램 및 멤버십 번호(선택한 운임 유형에 따라 다름), 내 계정에 가입하기로 선택한 경우: 회원 이름, 회원 이메일 주소 및 비밀번호.

돌핀에어는 선택하신 항공편 및 기타 서비스에 예약 서비스를 제공할 목적으로 이 개인 정보를 수집합니다.

돌핀에어는 고객님이 돌핀에어 서비스에 액세스하는 동안 및 돌핀에어 서비스에 액세스한 후 애프터서비스를 제공하고, 법적 의무를 충족하기 위해 또는 잠재적인 법적 청구와 관련하여 고객님의 개인 정보를 보유 및 사용합니다.

정보 통신망법(Information and Communications Network Act) 제 17-2조(법적 보호자의 동의 요구)에 따라 만 14세 미만 어린이의 예약에 대해 법적 보호자의 승인과 동의가 필요합니다. 만 14세 이상의 탑승객은 로그인 후 예약을 할 수 있습니다.

고객님은 상기 필수 개인 정보의 수집 및 사용에 동의하지 않을 권리가 있습니다. 그러나 동의하지 않을 경우, 돌핀에어 항공편 예약 및 기타 서비스를 이용할 수 없습니다.
</textarea>
<br><br>
	<p style="font-size:16px; font-style:normal;">
	<input type="checkbox" id="agree" name="agree" style="margin-top: -2%; width:2px; height:4px;" required/>&nbsp;&nbsp;&nbsp;&nbsp;위에 표시된 바와 같이 개인정보의 수집 및 이용에 동의하시겠습니까?</p>
  </div>

<br>



</div>
<hr>
<br>
<input type="button" id="maybe-button"  onclick="window.location.href='option2.jsp';" value="이전" style="float:left;border-radius :10px; color:gray;
	border-color:white; border-width:0.2px; width :165px; font-size:25px; height :50px;"/>
<input type="submit" id="maybe-button"  onclick="updateMember();" value="다음" style="float:right;border-radius :10px; color:#3d3d3d;
	border-color:white; border-width:0.2px; width :165px; font-size:25px; height :50px;"/>
     <!--onclick="reserve2();"-->
</div>
</form>
<style>#maybe-button:active{border:1px;}</style>



<style>h3{font-size:20px;}></style>

<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->

<link rel="stylesheet" href="../../design/css/reserve.css">
  <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>#maybe-button, .button-wrap h3{font-family: 'Jua', sans-serif; font-weight:0.3px;}</style>
<link rel="stylesheet" href="../../design/css/progress.css">
<%@include file ="../../common/footer.jsp" %>
