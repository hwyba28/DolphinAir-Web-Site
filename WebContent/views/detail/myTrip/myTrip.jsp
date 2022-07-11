<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.hw.member.model.vo.Member" %>
<%
	Member m = (Member)session.getAttribute("member");
//MemberInsertServlet mis = new MemberInsertServlet();
//int count = //mis.count;
%>
<!DOCTYPE HTML>
<html>
	<head>
	
	
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css2?family=Lexend+Peta&family=Roboto+Mono:ital,wght@1,300&display=swap" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto+Mono:wght@300&display=swap" rel="stylesheet">
	
	
	
	
	
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.js"></script>
        <!-- Compiled and minified CSS -->
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
        <script src="../../desgin/js/xvalidation.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#joinForm").xvalidation({
                    theme: "materialize"
                });
                $("#joinForm").submit(function (evt) {
                    evt.preventDefault();
                    evt.stopPropagation();
                    if ($("#joinForm").data().xvalidation.methods.validate()) {
                        alert("Do something");
                    }
                    return false;
                });
            });
        </script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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


        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSS -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
        <link rel="stylesheet" href="/myWeb/views/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/myWeb/views/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="/myWeb/views/assets/css/form-elements.css">
        <link rel="stylesheet" href="/myWeb/views/assets/css/style.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicon and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/myWeb/views/assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/myWeb/views/assets/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/myWeb/views/assets/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="/myWeb/views/assets/ico/apple-touch-icon-57-precomposed.png">

    </head>
<!-- Modal --><!-- 유효성 검사 완벽하게 재 제작 -->
<div class="modal fade" id="elegantModalForm2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-left: -1%;" 
  aria-hidden="true" >
  <div class="modal-dialog" role="document"style="margin-top:7.7%;">
    <!--Content-->
    <div class="modal-content form-elegant">
    		<form role="form" id="joinForm" action="${pageContext.request.contextPath}/mInsert2.me" method="post" style="backgroun-color:gray;" class="login-form" novalidate>
    
      <!--Header-->
      <div class="modal-header text-center">
        <h3 class="modal-title w-100 dark-grey-text font-weight-bold my-3" id="myModalLabel"><strong>Sign-up</strong></h3>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body mx-4" >
        <!--Body-->
        <div class="md-form mb-5">
          <input style="height:45px;" name ="userId" type="email" id="Form-email" placeholder="ID" class="form-control validate" required/>
         
        </div>
<br>
        <div class="md-form pb-5">
<input name = "userPwd" type="password" id="Form-pass" class="form-control validate error" 
                      pattern="(?=.*\d)(?=.*[a-z]).{8,}" style="border: 1px solid #e0e0e0;border-radious:10px" required/>
<br>
        <div id="message" >
          			<p id="warn" class="invalid">&nbsp;&nbsp;&nbsp;8자리 이상의 영문 소문자와 숫자를 모두 넣어주세요</p>
          		   </div>
          		   
          		   
          		      <input name = "userPwd" type="password" id="Form-pass22" class="form-control validate error" 
                      pattern="(?=.*\d)(?=.*[a-z]).{8,}" style="background-color:white; border: 1px solid #e0e0e0;border-radious:10px"required/>
                      <br><!-- id="Form-pass1" 이상함 -> 다른 속성 못 먹게 막아놓음 -->
                   <div id="message2" >
          			<p id="warn2" class="invalid2">&nbsp;&nbsp;&nbsp;비밀번호가 일치하지 않습니다.</p>
          		   </div>
          		   
          		   
          		   
              &nbsp;<input type="checkbox" id="check1" name="checkbox" value="check" required/>&nbsp;&nbsp;<span style="font-size:15px">개인정보 수집, 이용 및 보관에 동의하겠습니다.</span>

        </div>
         
                   

        <div class="text-center mb-3">
          <input type="submit" value="회원 가입" id="joinForm" name="enroll" onclick="insertMember();" class="btn blue-gradient btn-block btn-rounded z-depth-1a"
          style="font-size:19px; margin-top:15px;margin-bottom:5px;color:black; font-family: 'Noto Sans KR', sans-serif;"/>
        </div>
        
      </div>
      </form>      
    </div>
  </div>
</div>
    <body style="/*background: url(myWeb/form-3/assets/img/bg.jpg) left top repeat;*/">
    <div style="position:absolute;z-index:-1000;overflow:hidden;min-width:100%;min-height:100%; width:auto; height:140%;">
	<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" >
      <source src="/myWeb/views/main/images/video3.mp4" ></video>
      </div>
        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                	
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><a href="/myWeb/views/main/index.jsp">🐬 </a>Your Trip will begin</h1>
                            <div class="description">
                            	<p>
	                            	회원 가입 또는 비회원 로그인 후에 나의 여행을 확인할 수 있습니다.
                            	</p>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
	                        	<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>Login to our site</h3>
	                            		<p>고유 아이디와 비밀번호로 로그인해주세요</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-lock"></i>
	                        		</div>
	                            </div>
	                              <div class="form-bottom">
	                    <form id="loginForm2" action="${pageContext.request.contextPath}/login2.me" method="post" >
				                    	<div class="form-group">
				                        	<input type="text" name="userId" placeholder="Username..." class="form-username form-control" id="form-username">
				                        </div>
				                        <div class="form-group">
				                        	<input type="password" name="userPwd" placeholder="Password..." class="form-password form-control" id="form-password">
				                        </div>
				                        <button type="submit" onclick="login()" class="btn">로그인</button>
				                    </form>
			                    </div>
			            
		                    </div>
		                
		                	<div class="social-login">
	                        	<h3>or login with</h3>
	                        	<div class="social-login-buttons">
		                        	<a class="btn btn-link-2" href="#">
		                        		<i class="fa fa-facebook"></i> Facebook
		                        	</a>
		                        	<a class="btn btn-link-2" href="#">
		                        		<i class="fa fa-twitter"></i> Twitter
		                        	</a>
		                        	<a class="btn btn-link-2" href="#">
		                        		<i class="fa fa-google-plus"></i> Google Plus
		                        	</a>
	                        	</div>
	                        </div>
	                        
                        </div>
                        
                        <div class="col-sm-1 middle-border"></div>
                        <div class="col-sm-1"></div>
                        	
                        <div class="col-sm-5">
                        	
                        	<div class="form-box">
                        		<div class="form-top">
	                        		<div class="form-top-left">
	                        			<h3>비회원 예약 조회</h3>
	                            		<p>예약시 전달받은 예약 정보를 작성해주세요</p>
	                        		</div>
	                        		<div class="form-top-right">
	                        			<i class="fa fa-pencil"></i>
	                        		</div>
	                            </div>
				                    <div class="form-bottom">
	                    <form id="loginForm2" action="${pageContext.request.contextPath}/login2.me" method="post" >
				                    
				                      <div class="form-group">
				                        	<input type="text" name="userId" placeholder="Email" class="form-email form-control" id="form-email">
				                        </div>
				                        <div class="form-group">
				                        	<input type="text" name="userPwd" placeholder="Reservation number" class="form-email form-control" id="form-email">
				                        </div>
				                        
				                        <button type="submit" onclick='login()' class="btn">Retrieve</button>
				                        			                 </form>
				                        
			                    </div>
			                    
                        	</div>
                        	<br>
                        	 	<div class="social-login">
	                        	<div class="social-login-buttons">
	                        	<h5 style="color:white;">돌핀에어를 더욱 편리하게 이용하려면<a href="" style="color:white; margin-top:5px;backgroun-color:none; border-color:white; font-size:20px;" data-toggle="modal" data-target="#elegantModalForm2">
            &nbsp;Sign-up &nbsp;</a>해주세요
	          
		                        </h5>
	                        	</div>
	                        </div>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>
<br>
<br>
        <!-- Footer -->
        <footer style="margin-top:10px;">
        	<div class="container">
        		<div class="row">
        			
        			<div class="col-sm-8 col-sm-offset-2">
        				<p>Made by Anli Zaimi at <a href="http://azmind.com" target="_blank"><strong>AZMIND</strong></a> 
        					having a lot of fun. <i class="fa fa-smile-o"></i></p>
        			</div>
        			
        		</div>
        	</div>
        </footer>

        <!-- Javascript -->
        <script src="/myWeb/views/assets/js/jquery-1.11.1.min.js"></script>
        <script src="/myWeb/views/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="/myWeb/views/assets/js/jquery.backstretch.min.js"></script>
        <script src="/myWeb/views/assets/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="/myWeb/views/assets/js/placeholder.js"></script>
        <![endif]-->
    
    

	
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.4.1.min.js"></script>
	
	<script>
	function onEnterLogin(){

		var keyCode = window.event.keyCode;

		

		if (keyCode == 13) { //엔터키 이면<조건 안누르면 다 눌림-어떤 버튼이든>

			loginForm2.submit();

		}
	} //onEnterLogin()


	
	
		function login(){
			$('#loginForm2').submit();
		}
		
		function insertMember() {
			$("#joinForm").submit();
		}
		
		
		function logout(){
			location.href="/myWeb/logout.me";
		}
	
	
		
		
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
    </body>

</html>