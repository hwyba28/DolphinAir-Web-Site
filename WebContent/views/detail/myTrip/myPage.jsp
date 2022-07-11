<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../../common/header.jsp" %>

<p style="background-image: url(/myWeb/views/main/images/22.jpg);height:120px; width:200%;"/>
			
			  


		<div id="colorlib-blog" style="margin-top:-5%;">
			<div class="container" id="left">
			
				<div class="row">
					<div class="col-md-6 col-md-offset-3 text-center colorlib-heading animate-box" style="margin-left:-17%;">
					<!--  <a href="myReservation.jsp" style="font-size:22px;position:absolute;left:160%;top:22%; color:#eba0eb;width:100%;">>> my Reservation</a>-->
<!-- select 해서 보여줘야 하는 화면은 무조건 servlet으로 이동해서 db 기능 들어가야 함! -->
	<!-- 그냥 이동하면 안되고 form으로 userId정보 들어가야 함!! -->
					<%-- System.out.print("뭐냐?"+m.getUserId()); --%><!-- 현재 update servlet에서 관리함?! 상관없낭?!-->
					
					<form action="<%= request.getContextPath() %>/MemberReserve.co" method="post">
					<input type="hidden" name="userId" value=<%= m.getUserId() %>><!-- value(값)와 name(변수명)으로전달함!!!!! -->
					<input type="submit" style="border:none; background-color:white;
					font-size:22px;position:absolute;left:160%;top:22%; color:#eba0eb;width:100%;" value=">> my Reservation">
					
					</form>	
					
					
					
					
					
						 <!-- #f59de2 -->
						<h2 style="font-size:30px;">My Page</h2>
						<hr style="margin-left:33%;width:205%;">
					</div>
				</div>
				
				
				<style>h5{font-size:15px;line-height : -1px;}input[type=text] {
																 padding: 5px;
																 /*text-align: center;*/
																 margin: 3px;
																 line-height:10px;
																}
				</style>
				
				
				<div class="blog-flex" style="background-color:#fafafa; margin-top:0%; ">	
									
				
		<div style="height:60px; width:204%; background-color:#e0e0e0;">								
		<h4 style="color:black; margin-left:3%; margin-top:2%; height:5%;">Edit profile</h4>
		</div>				
		<form id="updateForm" action="/myWeb/mUpdate.me" method="post">

									<div class="desc" style="margin-left:10%;">
									<p style="color:black; font-size:17px;">
	<br>							<h5 style="color:black;font-size:17px;">Email :&nbsp;&nbsp;&nbsp;<%= m.getUserId() %>&nbsp;<span style="margin-left:3%; font-size:15px;color:gray;">*Email can not be edited</span></h5>
									<h5>New Password&nbsp;&nbsp;&nbsp; <input name="userPwd" type="password"></h5>
									<h5>Password_confirm&nbsp;&nbsp;&nbsp; <input name="userPwd" type="password"></h5>
									<p style="font-size:12px;">* 비밀번호 변경을 원하실 경우에만 입력해주세요</p>
									<!-- 비밀번호가 null값이면 현재 비밀번호로 저장되게 or 업데이트 실행x -->
									<hr style="border-color:gray; float:left;width:650px; margin-top:2%;"><br>

									<h5 style="font-size:15px;margin-top:4%;margin-bottom:2%;"></h5>
									※ 탑승객용<br><span style="font-size:12px; color:#9e888b;">- 여권 정보와 동일하게 입력해주세요</span><br>
									
		
									
									<h5 style="margin-top:14px;">Title&nbsp;
									<%if(m.getTitle() == null) {%>
									
									<select name="title"><option>---</option><option>👧Ms</option><option>👩Mrs</option><option>👨Mr</option></select>
										<%}else{ %>
	
										<select name="title"><option>---</option><option selected>👧Ms</option><option>👩Mrs</option><option>👨Mr</option></select>
	<%} %><!-- 원래는 jquery jstl로 수정된 값 가져와야 함! 나중 수정 -->
									
									&nbsp;&nbsp;&nbsp; Full name&nbsp;
									<%if ( m.getUserName() == null ) { %>
									<input type="text" name="name" style="height:27px;" size="18">
									<!--&nbsp;&nbsp;&nbsp;Last name&nbsp; <input type="text" style="height:27px;" size="10">--></h5>
									<% } else { %> 	<input type="text" name="name" style="height:27px;" size="18" placeholder="<%=m.getUserName()%>"><%}%>
									<%if(m.getC_code() == null) {%>
									<h5>Phone &nbsp;&nbsp;<select name ="c_code"><option>국가 코드</option><option>+82 한국</option><option>+33 프랑스</option><option>+49 독일</option></select>&nbsp;&nbsp;&nbsp;&nbsp;
									<%}else{ %>
																		<h5>Phone &nbsp;&nbsp;<select name ="c_code"><option>국가 코드</option><option selected>+82 한국</option><option>+33 프랑스</option><option>+49 독일</option></select>&nbsp;&nbsp;&nbsp;&nbsp;
									<%} %>
																		<%if ( m.getPhone() == null ) { %>
									
									<input type="text" maxlength="15" name="tel" style="height:27px;"></h5>
									<% } else { %> 									<input type="text" maxlength="15" name="tel" placeholder="<%=m.getPhone()%>"
									style="height:27px;"></h5> <%}%>
									
									<h5>Post code / Address<br>
									<%if ( m.getAddress() == null ) { %>
									<input name="address" type="text" id="address1"size="59" style="height:27px;"></h5>	
								<% } else { %> 	<input type="text" id="address1" size="59" style="height:27px;" name="address" placeholder="<%=m.getAddress()%>">
									<%}%>
									<br>

<br>

									<div style="display: flex;font-size:17px; margin-left:59.5%; color:black;  margin-bottom:30px;">
																	<input type="button" id="updateBtn" onclick="updateMember();"  value="Edit" style="padding: 5px 62px 5px 62px;">&nbsp;&nbsp;
																	<input type="reset" style="padding: 5px 53px 5px 53px;">
									</div>
									</div>								



																	
																		</form>
									
									</p>

									</div>
									
									
									<br><br><br><br>
									<div class="blog-flex" style="background-color:white; margin-top:0%; ">	
		<h4 style="margin-left:20px; margin-top:20px;">Delete Account <p style="font-size:13px; color:gray; margin-top:9px;">*Are you sure to delete account?</p></h4>			
									<br>
									
									</p>
										<!--<br>							<button id="deleteBtn" onclick="deleteMember();" style="margin-left:-195px;margin-top:90px; font-size:17px; color:black; width:250px; height:40px; margin-bottom:30px;">Yes, I want to Delete.</button>-->
										<br>							<button id="deleteBtn" onclick="deleteConfirm();" style="margin-left:-195px;margin-top:90px; font-size:17px; color:black; width:250px; height:40px; margin-bottom:30px;">Yes, I want to Delete.</button>

									</div>
									
															
				</div>
				
				
				
				
				
				</div>
				
			</div>
		</div>
		
		
			<script>function updateMember() {
				$("#updateForm").submit();}
			
			
			function deleteMember() {
				location.href = "/myWeb/mDelete.me";
			}
			
			
			function deleteConfirm() {
				var test = confirm('🥺정말로 탈퇴하시겠습니까?');
				location.href = "/myWeb/mDelete.me";
				if(test==true) deleteMember();
				else document.location.href = '/myWeb/views/detail/myTrip/myPage.jsp';
				
			}
			
			</script>
			
			
			
			
			
			
			
			
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@include file ="../../common/footer.jsp" %>
 