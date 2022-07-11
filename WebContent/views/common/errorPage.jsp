

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  errorPage="errorPage.jsp"%>
<%@ page isErrorPage="true" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style> body{/*background-color:#cccccc;*/}h3{color:#474747;}p{color:gray;}</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Error</title>
</head>
<body>
<div style="width:400px; top:40%;margin:0 auto; padding:50px 20px; background:#fff;">
<h3>
	<img src = "/myWeb/views/main/images/error.png" style="width:300px; height:auto;"><br>
	요청 처리 과정에서 에러가 발생하였습니다.<br>
	전송 값을 확인해 보시고, 이상이 없을 시,<br>
	부서 담당자에게 연락하시기 바랍니다.</h3>
	<p>
	에러 타입 : <%= exception.getClass().getName() %><br>
	에러 메세지 : <%= exception.getMessage() %>
	</p>
</div>
</body>
</html>
