<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.hw.reservation.model.vo.*"%>

	<%@ include file="../../common/header.jsp" %>
<%//매핑 안된데서는 받아오기 어려움?!
//Reservation r = (Reservation)session2.getAttribute("reservation");//진행중 예약

Reservation reservation = (Reservation)session2.getAttribute("reserve");//완성된 예약
//System.out.print(//reservation.toString2()); %>

<%//Reservation reservation = (Reservation)session.getAttribute("reserve");
	//System.out.print(reservation.toString2()); 
	//고객 예약정보는 모두 list로 select 해서 가져와야함 
	//즉 고객 정보(따로 관리[비회원처럼 건수마다 예약되는 것이 아닌])에 reservation 정보 모두 삽입%>


<% ArrayList<Reservation> rlist = (ArrayList<Reservation>)request.getAttribute("reserve_list");
//System.out.println(request.getAttribute("reserve_list"));%>

<p style="background-image: url(/myWeb/views/main/images/BG3.jpg);height:120px; width:200%;"/>
			
			  

		<div id="colorlib-blog">
					<!-- <a href="<%= request.getContextPath() %>/views/detail/myTrip/myPage.jsp" style="font-size:22px;margin-top:-10%;margin-left:13%; color:gray;width:100%;"><<&nbsp; My Page</a>-->
					<!-- myTrip으로 이동 가능 -->
						
						
						<!--  -->
			<div class="container" style="margin-top:1%;background-color:#1b1e38; height:100%; border-radius:10px;"><!-- 컨테이너 크기!!!!!-->
				<div class="row" style="background-color:#e0e0e0; height:100%; border-radius:5px;"><!-- 100% 만큼 늘어남 -->
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box">
						<h2 style="margin-top:5%; margin-bottom:1%;">My Reservation</h2>
						<p style="font-size:14px; margin-bottom:-8px;">your exiting journey begins soon</p>
					</div>
				</div>
			<%if(reservation==null)  {%><h3 style="color:gray;margin-left:34.5%;"><br><br>😭 현재 예약 정보가 없습니다.<br><br></h3><%} else{%>


					<div class="blog-entry aside-stretch-right">
						<div class="row"><br>
							<div class="col-md-12 animate-box">
								<a class="blog-post">
									<!--<span class="img" style="background-image: url(/myWeb/views/main/images/blog-1.jpg); margin-bottom:200px;"></span>-->
									
									<div class="desc"><!-- test -->
									<br><br>
																		
									
									<% int count=1; %>
									<!-- 해야할 것: 사용자가 자기에 해당하는 정보만 불러와야 함 전체 리스트에서 사용자랑 맞는 리스트만 가져오기!!! -->
									<!-- 여기서가 아니라 조회시 걸러서 가져오면 됨! -->
									<h4>
									<% //System.out.print(m.getUserId()); %>
									<% //if(m.getUserId() == reservation.getEmail()) %>
									<%for(Reservation a : rlist) {%><!-- 전체 예약 조회 특정 회원의! -->
									<div id="whole">
									<div id="image" style="height:396.6px;width:300px; border-radius:5px;
									postion:absolute; margin-top:0px; margin-left:-12.6%; margin-bottom:-43.2%;background-image: url(/myWeb/views/main/images/reserve<%=count%>.jpg);"></div>
									<div id="content<%= count %>" style="margin-left:14%;width:800px;padding:30px 30px 30px 30px; background-color:white; border-radius:5px;">
									Iternery no.<%= count %><br><br>
									PMR.no : <%= a.getPMR_no() %><br>
									<%= a.getEmail() %><br><br>
									[※탑승객 정보]<br>
									<%= a.getTitle() %>
									<%= a.getName() %><br>
									<%= a.getC_code() %>)
									<%= a.getPhone() %>
									<%-- a.getAddress() --%><br><br>
									
									Route.no : <%= a.getRoute_no() %>&nbsp; 
									From, <%= a.getFrom() %>
									To, <%= a.getTo() %><br>
									Depart at : <%= a.getDeparture() %> 🛪
									&nbsp;&nbsp;
									Arrive at : <%= a.getArrival2() %>
									
									<%-- a.getArrival() --%><br>
									
									Class : <%= a.getPclass() %>
									Seat : <%= a.getSeat() %>
									<br>
									[option]
									<%= a.getMeal() %><br>
									<%= a.getLuggage() %>
									<br><br>
									예약 일시 : <%= a.getReserveDate() %><% count+=1; %>
										<div style="float:right;margin-top:15px;">		
									<button id="edit<%=count %>" style="background-color:#3c1b61;color:white; border:none; border-radius:4px;height:30px;">Edit / Add</button>
									<button onclick="alert('카드 전표\nowner: <%=a.getOwner() %>\ncard.no: <%=a.getCard_no() %>\ndate: <%=a.getReserveDate()%>');"
									style="height:30px;border-radius:4px; border:none;background-color:#323f54;color:white;height:30px;">Receipt</button>
									<button id="delete" style="height:30px;color:black;border-radius:4px;"
									onclick="alert('관리자에게 취소 요청을 했습니다.');style.color='white';disabled='true'; document.getElementById('edit<%=count %>').style.visibility='hidden';document.getElementById('content<%=count-1 %>').style.color='lightgray'; ">Delete</button>
									
										<!--<span class="cat">Activities</span>-->
										<!--<button style="color:gray;height:30px;"
										onclick="alert('탑승 30시간전부터 가능합니다.')">Check-in</button>
									--></div>
									<%-- a.toString2() --%><!--예약 날짜리얼:--><%--reservation.getReserveDate2() --%>
									<br><br>
									
														
	<script>
	function pay(){

	}</script>		
		
									</div></div><br><br><br><br><br><br>
									<%} %>
									</h4>
										<!-- <span class="date">Feb 22, 2020 </span>-->
										<h3></h3>
									</div>
								</a>
							</div>
<br><br><br><br><br><br>


						<span class="cat" style="font-size:16px;">※ If you want to cancel your journey, please <a href="../../main/contact.jsp" style="color:white;text-decoration: underline;">contact us</a>💁</span>

						</div>
					</div>
			
					
					
			<!--	
					
					<div style="padding: 8px 8px 8px 14px;height:440px; width:500px; float:right; background-color:#fcfcfc;margin-top:-480px;">
					<h3 style="color:black;"> Detailed information</h3>
					<button style="background-color:white;color:black; border-color:#e2e2e0;">Edit / Add</button>
					<button style="background-color:white;color:black; border-color:#e0e0e0;">Check-in</button>
					
					</div>
					
				-->	
					
					
					
		
					
					
					
					<br><br><br><br><br><br>
						<div style="margin-top:-170px;margin-left:12.5px;margin-bottom:26px;height:175px; width:1115px; background-color:#fcfcfc; padding: 15.5px 13px 7px 20px;">
						<!-- 이렇게 연관되어있는 애는 절댓값위치로 %로 높이주면 스크롤바 2개 생김 margin-으로만 주기! 간격은 pixel-->
<p>
※ &nbsp;구매하신 e-티켓은 실물항공권이 아닌 전자항공권입니다.<br>

구매하신 e-티켓의 세부정보는 고객님께서 예약 시 입력하신 e-mail 주소로 송부됩니다. (전화로 신청 시 Fax 로 받아보실 수 있습니다.)<br>

e-mail 이나 Fax 로 받으신 e-티켓 확인증(예약/발권 확인서) 를 인쇄하신 후 공항 탑승수속 카운터에 제시하시면 좌석배정 및 탑승권발급을 받으실 수 있습니다.<br>

e-티켓 확인증(예약/발권 확인서) 은 출입국 신고와 세관 통과 시 제시 요구를 받으실 수 있으니, 여행이 완료되는 시점까지 전 여정 기간 소지하여 주시기 바랍니다.<br>
전화 : 제주항공 고객센터 1599-1500 (해외에서 이용 시 : +82-1599-0000)
<br>
운영시간 : 매일 08:00 ~ 19:00
	</p>					
							</div>
					<%} %>
				</div>
			</div>
		</div>


<%@include file ="../../common/footer.jsp" %>
 