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
<!--
<div style="background-image: linear-gradient(#0c6896, #63afd6);margin-top:-20px;height:100px; width:100%;">
<h2 style="text-align:center;color:white;"><br>항공권 예약</h2>
</div>-->




<%	String Route_no = request.getParameter("choose"); 
//	HttpSession session2 = request.getSession();//현재 세션을 세션2로 제작
//	session2.setAttribute("Route_no", Route_no);
	r.setRoute_no(Route_no);//에러!!!!!!
	
			//?System.out.println(session2.getAttribute(PMR_no));

//	System.out.println(Route_no);//잘 넘어옴^^       세션 or
	System.out.println(r.getRoute_no());//reservation 객체 만들어서 세션으로 가져오고 잘 진행됨^^
//안되면 input 안보이게 하고 form으로 추가해서 넘겨줘도 오키%>

	<%
	r.setFrom(request.getParameter("from"));
	r.setTo(request.getParameter("To"));
	r.setDeparture(request.getParameter("departure"));
	r.setArrival2(request.getParameter("arrival"));
	%>
				
				<%//System.out.print("옵션에서 클래스"+r.getPclass());%>




	<div class="stepwizard">
    <div class="stepwizard-row">
        <div class="stepwizard-step">
            <button onclick="window.location.href='../../main/index.jsp';" 
            type="button" class="btn btn-circle" style="background-color:red; color:white; margin-left:22px;">◁</button>
            <p style="margin-left:18px;">Flight</p>
        </div> 
          <div class="stepwizard-step">
            <button onclick="window.location.href='option2.jsp';" 
             type="button" class="btn btn-circle" style="background-color:orange; color:white;margin-left:20px;">2</button>
            <p style="margin-left:16px; color:black; font-size:15px;">Option</p>
        </div>
          <div class="stepwizard-step">
            <button onclick="window.location.href='passenger3.jsp';"
             type="button" class="btn btn-circle" style="cursor:not-allowed;background-color:light-gray; color:white;">3</button>
            <p>Passenger</p>
        </div>
         <div class="stepwizard-step">
            <button type="button" onclick="window.location.href='<%= request.getContextPath() %>/Flight.go';" 
             class="btn btn-circle" style="cursor:not-allowed;background-color:light-gray; color:white;">4</button>
            <p>Payment</p>
        </div> 
 	
    </div>
</div>
	  <form method="post" action="<%= request.getContextPath() %>/views/detail/flight/passenger3.jsp">
<!-- name은 동일 value는 달라야함()라디오 겸/이 중 한번만 들어가서 값이 저장되어야 함! -->
	<div class="container" style="padding: 80px 0px 100px 0px;">
		<h2 style="text-align:center; font-size:35px;font-family: 'Jua', sans-serif; color:#0e3469;">✔️  여러가지 항공 옵션을 선택하세요</h2><br>
	 
	<!--<a style=" text-underline:none;position:absolute;font-size:27px; margin-top:-4%;margin-left:0%; color:black;
	" href="../../main/index.jsp">
 < &nbsp;</a>-->
<hr>	<br><br><br><br>




<div class="option" style="margin-top:-20px; margin-bottom:100px">

<div class="button-wrap" style="padding: 20px 0px 20px 0px;">
<h3>🧳 위탁 수화물 선택</h3>
<p>[ 탑승 직전 수화물을 추가시 별도 요금이 부과될 수 있습니다. ]</p>
    <input class="hidden radio-label" type="radio" name="accept-offers" id="yes-button1" value="수화물(x)"/>
    <label class="button-label" for="yes-button1">
      <h1 style="font-size:18px;">🗹 Back-packer</h1><!--<img style="width:10%;"src="/myWeb/views/main/images/balloons.jpg"/>-->
      <h5>자유 여행</h5>
    </label><!-- 이미지 너무 작아도 깨짐 -->
    
    <input class="hidden radio-label" type="radio" name="accept-offers" id="yes-button2" value="수화물(10kg)"/>
    <label class="button-label" for="yes-button2">
      <h1 style="font-size:18px;">🗹 10kg</h1>      <h5>가벼운 여행</h5>
    </label>
    
    <input class="hidden radio-label" type="radio" name="accept-offers" id="yes-button3" value="수화물(20kg)"/>
    <label class="button-label" for="yes-button3">
      <h1 style="font-size:18px;">🗹 20kg</h1>      <h5> 가장 추천하는 패키지</h5>
    </label>
    
    <input class="hidden radio-label" type="radio" name="accept-offers" id="yes-button4" value="수화물(30kg)"/><!-- 사용자가 어떤 밸류를 선택할지 결정! -->
    <label class="button-label" for="yes-button4">
      <h1 style="font-size:18px;">🗹 30kg</h1>      <h5> 철저한 여행준비</h5>
    </label>
  </div><br><p style="text-align:center;">※ 위탁 수하물은 탑승구로 가기 전에 체크인해야 하며, 항공기에 휴대하고 탑승할 수 없습니다.
  <br>추가 수하물 허용량을 구입하지 않은 경우 휴대 수하물 한도는 2개 품목, 총 중량 7kg입니다.</p>
  <br><br><br>
<hr>

<div class="button-wrap"  style="padding: 120px 0px 120px 0px;">
<h3>💺 좌석 선택</h3> 선호하는 좌석이 있으신가요? 이용 가능 좌석이 충분한 지금 구매하세요! 어떤 좌석이든 상관없는 경우, 체크인 시 추가 비용 없이 무작위 배정됩니다.<br><br>
    <input class="hidden radio-label" type="radio" name="accept-offers2" id="yes-button5" value="지정(X)"/>
    <label class="button-label" for="yes-button5"><img src="/myWeb/views/main/images/seat1.png"/><!-- JPG에서 다른 확장자로 바꿧다 다시하니 됨!인식X -->
      <h1>Random seat</h1>
    </label>
    
    <input class="hidden radio-label" type="radio" name="accept-offers2" id="yes-button6" value="A21"/><!-- 나중 따로 좌석 DB등 처리 -->
    <label class="button-label" for="yes-button6"><img style="width:80%;" src="/myWeb/views/main/images/seat4.jpg"/>
      <h1>일반 좌석</h1>
    </label>
    
    <input class="hidden radio-label" type="radio" name="accept-offers2" id="yes-button7" value="F14"/>
    <label class="button-label" for="yes-button7"><img src="/myWeb/views/main/images/seat2.jpg"/>
      <h1>엑스트라 레그룸</h1>
    </label>
  </div>
  <hr>
<br><br><br><br>
<div class="button-wrap" style="padding: 20px 0px 20px 0px;">
<h3>🍜 기내식 선택</h3>
<p>저희 항공사에서는 IATA(International Air Transport Association) 기준에 의거하여 종교 및 병/의학적인 사유, 연령 등의 제한으로 인해
일반적인 기내식을 먹지 못하는<br>손님들을 대상으로 특별 기내식을 사전 주문 받습니다. 특별 기내식을 주문하려면 고객센터에 항공기 출발 24~48시간 전에 전화하여 신청하면 됩니다</p>
    <input class="hidden radio-label" type="radio" name="accept-offers3" id="yes-button8" value="기내식(x)"/>
    <label class="button-label" for="yes-button8">
      <h1>#. &nbsp;기내식을 선택하지 않겠습니다</h1>
    </label><h6 style="margin-top:0.4%;">체크인 전까지 추가 구매가 가능합니다.</h6>
    
    <input class="hidden radio-label" type="radio" name="accept-offers3" id="yes-button9" value="기내식(등갈비)"/>
    <label class="button-label" for="yes-button9"><img src="/myWeb/views/main/images/등갈비2.png"/>
      <h1>A. 등갈비</h1>
    </label>
    
    <input class="hidden radio-label" type="radio" name="accept-offers3" id="yes-button10" value="기내식(와인과치즈)"/>
    <label class="button-label" for="yes-button10"><!-- value 띄어쓰기 나중에 해결하기 --><img style="width:97%"src="/myWeb/views/main/images/와인치즈2.jpg"/>
      <h1>B. 와인과 치즈</h1>
    </label>
    
    <input class="hidden radio-label" type="radio" name="accept-offers3" id="yes-button11" value="기내식(샐러드)"/>
    <label class="button-label" for="yes-button11"><img src="/myWeb/views/main/images/샐러드2.jpg"/>
      <h1>C. 샐러드</h1>
    </label>
  </div>


</div>

<hr>
<br>

<input type="submit" id="maybe-button" value="다음" style="float:right;border-radius :10px; color:#3d3d3d;
	border-color:white; border-width:0.2px; width :165px; font-size:25px; height :50px;"/>
     <!--onclick="reserve2();"-->
</div>

</form>


<style h3{font-size:20px;}></style>
<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->

<link rel="stylesheet" href="../../design/css/reserve.css">
  <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<style>#maybe-button, .button-wrap h3{font-family: 'Jua', sans-serif; font-weight:0.3px;}</style>
<link rel="stylesheet" href="../../design/css/progress.css">

<%@include file ="../../common/footer.jsp" %>
