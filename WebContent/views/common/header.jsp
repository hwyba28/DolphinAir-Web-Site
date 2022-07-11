<!-- 이왕이면 로그인 nav랑 헤더-메뉴랑 분리시키기 -->
<%	HttpSession session2 = request.getSession();//현재 세션과 추가로 세션2객체 제작 %>
<!-- duplicate local variable session-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hw.member.model.vo.Member,com.hw.reservation.model.vo.Reservation,java.util.*
    ,com.hw.flight.model.vo.*"%><%--import="com.kh.jsp.member.controller.MemberInsertServlet"--%>

<!-- 항상 주의 할것 SERVLET 내용 요청해서 끌어올때 그 페이지에 해당하는 내용이 서블릿과 연결되어있지 않으면 페이지 404 오류 나므로(소스를 가져올 수 없으니)
무조건 해당하는 페이지 위로만 넣어주기 -->

<%
	Member m = (Member)session.getAttribute("member");//오브젝트 통째로 가져옴
//MemberInsertServlet mis = new MemberInsertServlet();
//int count = //mis.count;
//session2.setAttribute("reservation", new Reservation());//비어있는 객체 제작?!

		
		
		//Reservation reserve = new Reservation();//제작 한번만 해야 초기화 안됨?!
//session2.setAttribute("reservation",reserve);
//	Reservation r = (Reservation)session2.getAttribute("reservation");//????얘는 세션에서 가져온 값/로그인시 세션정함(서블릿에서 데려올때)
											//현재 비어있는 예약 객체?!

//Reservation r = (Reservation)session2.getAttribute("reservation");
//전체에다가 넣으면 예약중이지 않을때에 가져올게 없으므로, 예약 시작 되는 위쪽에다가만 넣기!
//Reservation reservation = (Reservation)session.getAttribute("reserve");
//System.out.print(reservation.toString2());




//index / 1~5
%>
															<!-- 
															Reservation r = (Reservation)session2.getAttribute("reservation");
															
															--모든 헤더에 넣으면 안되고, 매핑되고 그 세션 정보를 가져올 수 있는 순서 부터 위에 넣어줘야함!!!
															--r은 예약부터 사용 가능
															
															Reservation reservation = (Reservation)session.getAttribute("reserve");
															--reservation은 예약 완료 되는 시점부터 사용 가능(매핑)
															--System.out.print(reservation.toString2());
															-->



<!-- 			HttpSession session = request.getSession();//로그인 상태유지!!!!!!!!!!
			session.setAttribute("member", m); -->







<!DOCTYPE HTML>
<html>
	<head>
	
	
	<style>
	
	
	/*
			#joinForm small{visibility:hidden;}
			#joinForm i{visibility:hidden; position:absolute; top:-45px; left:520px; font-size:22px;}
			.icon{position:relative;top:0px;}
			
			
			.md-form.mb-5.success input {border-width:2px;border-color:#2ecc71;}
			.md-form.pb-3.error input{border-width:2px; border-color:#e74c3c;}
			
			.icon.success i{visibility:visible}
			.icon.error i{visibility:}/*클래스 선택자 공백없이 붙여서*/

			
			</style>
	
			
	
	
	
	
	
	
	
	
	
	
	
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- 모달 스타일 -->
		<style type="text/css">
        .form-elegant .font-small {
    font-size: 14px; }

.form-elegant .z-depth-1a {
    -webkit-box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25);
    box-shadow: 0 2px 5px 0 rgba(55, 161, 255, 0.26), 0 4px 12px 0 rgba(121, 155, 254, 0.25); }

.form-elegant .z-depth-1-half,
.form-elegant .btn:hover {
    -webkit-box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15);
    box-shadow: 0 5px 11px 0 rgba(85, 182, 255, 0.28), 0 4px 15px 0 rgba(36, 133, 255, 0.15); }

.form-elegant .modal-header {
    border-bottom: none; }

.modal-dialog .form-elegant .btn .fab {
    color: #2196f3!important; }

.form-elegant .modal-body, .form-elegant .modal-footer {
    font-weight: 400; }
    </style>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>🐬Dolphin Air</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/myWeb/views/design/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/myWeb/views/design/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/myWeb/views/design/css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/myWeb/views/design/css/magnific-popup\\\\\\\\\\\\.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="/myWeb/views/design/css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="/myWeb/views/design/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/myWeb/views/design/css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="/myWeb/views/design/css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="/myWeb/views/design/fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="/myWeb/views/design/css/style.css">

	<!-- Modernizr JS -->
	<script src="/myWeb/views/design/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="/myWeb/views/design/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body >
	
	<!-- Modal -->

<%//if(count==0) {%> <script>
/*jQuery(function(){
   jQuery('#auto').click();
});*/
</script>

<%//}%>
<div class="modal fade" id="elegantModalForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" style="margin-top: 4%;" onkeydown="javascript:onEnterLogin();"><!-- onkeydown 효용 범위 -->
  <div class="modal-dialog" role="document" >
    <!--Content-->
    <div class="modal-content form-elegant">
      <!--Header-->
      <div class="modal-header text-center">
        <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel"><strong>Log-in</strong></h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body mx-4" >
      		<form id="loginForm" action="${pageContext.request.contextPath}/login.me" method="post" >
        <!--Body-->
        <div class="md-form mb-5">
             <label data-error="wrong" data-success="right" for="Form-email1">이메일</label>
          <input type="email" name="userId" id="txtEmail" class="form-control validate" autofocus="" /><!-- 어드민?? 다른페이지 예정/ required 잠시 생략 -->
          
         <!--<input type="email" name="userId" id="email1" style="width:100%; height:40px;">
		 <div id="error_mail" class="result-email result-check"></div>-->
        </div>

        <div class="md-form pb-3" style="margin-top:10px;">
                      <label data-error="wrong" data-success="right" for="Form-pass1">비밀번호</label>

          <input name="userPwd"  type="password" id="Form-pass1" class="form-control validate" required/>
          <p class="font-small blue-text d-flex justify-content-end">Forgot <a href="#" class="blue-text ml-1">
              Password?</a></p>
        </div>

        <div class="text-center mb-3">
          <input type="submit" onclick='checkEmail();login();' value="로그인" class="btn blue-gradient btn-block btn-rounded z-depth-1a"/>
        </div>
    <!--   <input type="test" id="loginError"></input> -->
       </form>

      </div>
      <!--Footer-->
      <div class="modal-footer mx-5 pt-3 mb-1">
        <p class="font-small grey-text d-flex justify-content-end">아직 회원이 아니신가요? <a href="" class="blue-text ml-1 btn-default btn-rounded" data-toggle="modal" data-target="#elegantModalForm2">
            &nbsp;Sign-up&nbsp;</a></p>
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="elegantModalForm2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-left: -1%;" 
  aria-hidden="true" >
  <div class="modal-dialog" role="document" style="margin-top:65px;">
    <!--Content-->
    <div class="modal-content form-elegant">
    		<form id="joinForm" class="controller" action="${pageContext.request.contextPath}/mInsert.me" method="post" name="join">
    
      <!--Header-->
      <div class="modal-header text-center">
        <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel"><strong>Sign-up</strong></h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body mx-4">
        <!--Body-->
        
        	<div class ="form-group">
        
        <div class="md-form mb-5 success">
             <label data-error="wrong" data-success="right" for="Form-email1">이메일</label>
          <input type="email" name="userId" id="txtEmail" class="form-control validate" autofocus=""
           pattern = "/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/" required/>
         <!-- id="Form-email1" 도 우선 변경 -> 다른 속성 못 먹게 막아놓음 -->
        </div></div>



        <div class="md-form pb-3 error">
                      <label data-error="wrong" data-success="right" for="Form-pass">비밀번호</label>
                      <input name = "userPwd" type="password" id="Form-pass" class="form-control validate error" 
                      pattern="(?=.*\d)(?=.*[a-z]).{8,}" required/>
                      <br><!-- id="Form-pass1" 이상함 -> 다른 속성 못 먹게 막아놓음 -->
                   <div id="message" >
          			<p id="warn" class="invalid1">&nbsp;&nbsp;&nbsp;8자리 이상의 영문 소문자와 숫자를 모두 넣어주세요</p>
          		   </div>
          		   
          		       <label data-error="wrong" data-success="right" for="Form-pass22">비밀번호 확인</label>
                      <input name = "userPwd" type="password" id="Form-pass22" class="form-control validate error" 
                      pattern="(?=.*\d)(?=.*[a-z]).{8,}" required/>
                      <br><!-- id="Form-pass1" 이상함 -> 다른 속성 못 먹게 막아놓음 -->
                   <div id="message2" >
          			<p id="warn2" class="invalid2">&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.</p>
          		   </div>
          		   
              &nbsp;<input type="checkbox" id="check1" name="checkbox" value="check" required/>&nbsp;&nbsp;개인정보 수집, 이용 및 보관에 동의하겠습니다.</p></input>

        </div>


<!--  <div class ="form-group"> 있으면 required등 찾지를 못함-->
        <div class="text-center mb-3"><!--name="enroll"--> 
          <input type="submit" onclick="checkEmail();checkPwd();insertMember();" value="회원가입"  class="btn blue-gradient btn-block btn-rounded z-depth-1a"/>
          <!--onclick="if(!Document.getElementById('check1').checked){alert('You must agree to the terms first.');return false}"--> 
        </div>
   
      </div>
      </form>      
    </div>
  </div>
</div>








	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="/myWeb/views/main/index.jsp">Dolphin Air</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1" id="menu-header">
							<ul>
								<li class="active"><a href="/myWeb/views/main/index.jsp">Home</a></li>
								<li><a href="/myWeb/views/main/about.jsp">About</a></li>
								<li><a href="/myWeb/views/main/blog.jsp">Blog</a></li>

								<li class="has-dropdown">
									<a href="/myWeb/views/main/contact.jsp">Help</a>
									<ul class="dropdown">
									<li><a href="/myWeb/selectList.no">Notices</a></li><!-- 바로 서블릿 연결 필요 -->
									<li><a href="/myWeb/selectList.bo">Q & A</a></li>
									<!--  <li><a href="/myWeb/selectList.fo">flightList</a></li> -->

									<li><a href="/myWeb/views/main/contact.jsp">Contact us</a></li>
									
									</ul>
								</li>
<!--#eeffe8-->


	<%if ( m == null ) { %>

								<li><a href="/myWeb/views/detail/myTrip/myTrip.jsp" style="color:white;">my trip</a></li>
		<% } else { %>

								<li><a href="/myWeb/views/detail/myTrip/myPage.jsp" style="color:white;">my trip</a></li>

	<% } %>



	<%if ( m == null ) { %>
								<li><a id="auto" href="" style="color:white;" data-toggle="modal" data-target="#elegantModalForm" >Login / Register</a></li>

		<% } else { %>
										<li><button onclick='logout()' style="background-color:#00ff0000; color:white; border-style:none;">Logout</button></li>
		
	<% } %>

								<!--
								<li class="has-dropdown">
									<a href="tours.html">Tours</a>
									<ul class="dropdown">
										<li><a href="#">Destination</a></li>
										<li><a href="#">Cruises</a></li>
										<li><a href="#">Hotels</a></li>
										<li><a href="#">Booking</a></li>
									</ul>
								</li>
								
								<li><a href="hotels.html">Hotels</a></li>
								<li><a href="services.html">Services</a></li>-->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>




















<script type="text/javascript">
//회원가입과 마이페이지(비밀번호 수정)에서 사용예정
//에러남 - 이메일 유효성 확인/현재 존재하는 이메일 여부 확인(중복체크)/비밀번호 조건걸기








</script>

	








	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	
	<script>//필수 키 모음
	function onEnterLogin(){

		var keyCode = window.event.keyCode;

		

		if (keyCode == 13) { //엔터키 이면<조건 안누르면 다 눌림-어떤 버튼이든>

			//loginForm.submit();

		}
	} //onEnterLogin()
	
	
		function login(){
			$('#loginForm').submit();
		}
		
		function insertMember() {
			$("#joinForm").submit();
		}
		
		
		function logout(){
			location.href="/myWeb/logout.me";
		}
	
		function changeInfo(){
			location.href="/myWeb/views/member/memberUpdateForm.jsp";
		}
	
	</script>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">
		$('#userId').on('shown.bs.modal', '#elegantModalForm', function () {
		    $('input:visible:enabled:first', this).focus();
		})//실패 - 페이지 로드 되자마자 로그인 뜨게 실패
	</script>
	
	<!--
	<br clear="both">
	<br>
	
	<div class="wrap">
		<div class="nav">
			<div class="menu" onclick="goHome()">HOME</div>
			<div class="menu" onclick="goNotice()">공지사항</div>
			<div class="menu" onclick="goBoard()">게시판</div>
			<div class="menu" onclick="goThumbnail()">사진 게시판</div>
		</div>
	</div>
	
	-->
	
	<script>
		/*function goHome(){
			location.href="/myWeb/index.jsp";
		}
		function goNotice(){
			location.href="/myWeb/selectList.no";
		}
		function goBoard(){
			location.href="/myWeb/selectList.bo";
		}
		function goThumbnail(){
			location.href="/myWeb/selectList.tn";
		}*/
	</script>
	
	
<script>
var myInput = document.getElementById("Form-pass");
var letter = document.getElementById("warn");//변수 중복 안되게/sublimetext - text


myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

myInput.onkeyup = function() {

  var lowerCaseLetters = /[a-z]/g;
  var numbers = /[0-9]/g;
  var count = 0;



  
  if(myInput.value.match(lowerCaseLetters)) {  
      count+=1;
  } else {
    count-=1
  }
  
 
  // Validate numbers
  if(myInput.value.match(numbers)) {  
          count+=1;

  } else {
        count-=1

  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    count+=1;
  } else {
    count-=1
  }

  if(count==3){
    letter.classList.remove("invalid1");
    letter.classList.add("valid1");
 document.getElementById("warn").innerHTML = "&nbsp;&nbsp;&nbsp;사용가능한 비밀번호 입니다!";  }else{
document.getElementById("warn").innerHTML = "&nbsp;&nbsp;&nbsp;8자리 이상의 영문 소문자와 숫자를 모두 넣어주세요";
     letter.classList.remove("valid1");
    letter.classList.add("invalid1");
  }
}
</script>



<script>
var myInput = document.getElementById("Form-pass");
var myInput2 = document.getElementById("Form-pass22");

var letter2 = document.getElementById("warn2");


myInput2.onfocus = function() {
  document.getElementById("message2").style.display = "block";
}

myInput2.onblur = function() {
  document.getElementById("message2").style.display = "none";
}

myInput2.onkeyup = function() {

  if(myInput.value==myInput2.value){//value주의!!
	  letter2.classList.remove("invalid2");
	    letter2.classList.add("valid2");
 	document.getElementById("warn2").innerHTML = "&nbsp;&nbsp;&nbsp;비밀번호가 일치합니다";  }
  else{
		document.getElementById("warn2").innerHTML = "&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다";
	     letter2.classList.remove("valid2");
	     letter2.classList.add("invalid2");
  		}
}
</script>


<style>
/* Style all input fields */

/* The message box is shown when the user clicks on the password field */
#message {
  display:none;
  background:white;
  position: relative;
  padding: 0px;
  margin-top: -10px;
  maring-left:10px;
    color:red;
  
}

#message p {
  padding: 1px 1px;
  font-size: 13px;
    maring-left:10px;
  
}

#message2 {
  display:none;
  background:white;
  position: relative;
  padding: 0px;
  margin-top: -10px;
  maring-left:10px;
    color:red;
  
}

#message2 p {
  padding: 1px 1px;
  font-size: 13px;
    maring-left:10px;
  
}

/* Add a green text color and a checkmark when the requirements are right */
.valid1 {
  color: green;
}

.valid1:before {
  position: relative;
  left: 5px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid1 {
  color: red;
}

.invalid1:before {
  position: relative;
  left: 5px;
  content: "✖";
}

.valid2 {
  color: green;
}

.valid2:before {
  position: relative;
  left: 5px;
  content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid2 {
  color: red;
}

.invalid2:before {
  position: relative;
  left: 5px;
  content: "✖";
}
</style>
<!-- 비밀번호 패턴만 지정해주면 기본 부트 스트랩 템플릿으로 유효성 검사 가능 -->
	<script>
/*    function checkEmail() {
        var email = document.getElementById('txtEmail');
        var filter = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!filter.test(email.value)) {
            alert('사용 가능한 이메일 형식으로 써주세요');
            email.focus;
            return false;
        }
    };*/
    /*
    function checkPwd(){
    	var pwd = docuent.getElementById('Form-pass');
    	var filter = (?=.*\d)(?=.*[a-z]).{8,};
    	if(!filter.test(pwd.value)){
    		alert('사용가능한 비밀번호 형식을 재 확인 해주세요');
    		pwd.focus;
    		return false;
    	}
    }*/
</script>

<script>/*
$(function(){
	  var sBtn = $("ul > li > a");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
	  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
	   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
	   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
	  })
	 })
*/	</script>