<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../../common/header.jsp" %>
	
	<%//매핑 안된데서는 받아오기 어려움?!
Reservation r = (Reservation)session2.getAttribute("reservation");//진행중 예약

Reservation reservation = (Reservation)session2.getAttribute("reserve");//완성된 예약
System.out.print(reservation.toString2()); %>
	
	 
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
<p style="background-image: linear-gradient(to right,#001e47, #59b4e3);height:105px; width:100%;"/>
<!--
<div style="background-image: linear-gradient(#0c6896, #63afd6);margin-top:-20px;height:100px; width:100%;">
<h2 style="text-align:center;color:white;"><br>항공권 예약</h2>
</div>-->



	<% 
//	Reservation reservation = (Reservation)session.getAttribute("reserve");
//	System.out.print(reservation.toString2());
	//카드번호 나중 암호화
	
	//session 객체 이름?!
		/*
	
		String owner = request.getParameter("owner");
		String card_no = request.getParameter("card_no");
		String mm = request.getParameter("mm");
		String yy = request.getParameter("yy");
		String cvc = request.getParameter("cvc");
	
	r.setOwner(owner);
	r.setCard_no(card_no);	
	r.setMm(mm);
	r.setYy(yy);
	r.setCvc(cvc);*/ // 현재 서블릿으로 보내서 필요x
	
	//System.out.print(r);// !!!! 예약시간/예약번호 제외 완전한 예약 객체 형성 
	%>
	
	
	<div class="container" style="padding: 80px 0px 100px 0px;height:100%;">
<br>
		<h1 style="text-align:center;  font-family: 'Jua', sans-serif; color:#0e3469;">🎉 예약 및 결제가 완료 되었습니다.</h1>
	 
	
<hr>	<br><br><br><br><br>
<h3 style="text-align:center; font-family: 'Jua', sans-serif; color:darkblue;">✔️ 예약 정보 확인하러 가기<br><hr style="width:30%;"/></h3>
<br><br>													<!--(r과 차이!) 이때까지  저축된 데에서 온 정보! 여기서 픽하면 내용이 달라짐(그때그때 업데이트 되므로 시점 중요!) -->
	<p style="text-align:center;">! PMR.NO (탑승객 예약 번호) : <%= reservation.getPMR_no() %><br># 이후 비회원 예약조회에 이용됩니다.</p>
	
	
	<%if(m==null) {%><!-- 나중에는 얘도 서블릿으로 바꿔서 userId 끌고 가야 나의 예약 메뉴 이용할수 있음 얘는 대신에 마이페이지는 비활성화 -->
<input type="button" id="maybe-button"  onclick="window.location.href='../myTrip/myTrip.jsp'" value="나의 예약 " style="position:absolute;margin-top:5px; margin-left:488px;border-radius :10px; color:#3d3d3d;
	border-color:white; border-width:0.2px; width :210px; font-size:25px; height :60px;font-family: 'Jua', sans-serif;"/>
<%} else {%>
<form id="reserve" action="<%= request.getContextPath() %>/MemberReserve.co" method="post">
<input type="hidden" value="<%=m.getUserId() %>" name="userId" /><!-- name : value 두가지가 input type 핵심!!! -->

<input type="button" onclick="submit();" id="maybe-button" value="&nbsp;나의 예약 " style="position:absolute;margin-top:5px; left:694px;border-radius :10px; color:#3d3d3d;
	border-color:white; border-width:0.2px; width :210px; font-size:25px; height :60px;font-family: 'Jua', sans-serif;"/>	 
</form>	<%}%>
<br><br>
<br>
<br>
<script>function login(){
	$('#reserve').submit();
}</script>
     <!--onclick="reserve2();"-->
</div>
<link rel="stylesheet" href="../../design/css/reserve.css">
<link rel="stylesheet" href="../../design/css/card.css">

<script type="text/javascript" src="../design/js/bootstrap.js"></script>
<!--<link rel="stylesheet" href="../design/css/bootstrap.css">-->
<link rel="stylesheet" href="../../design/css/progress.css">

<%@include file ="../../common/footer.jsp" %>
