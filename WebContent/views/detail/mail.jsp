<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="a" action="mailSend.jsp" method="post">
<label>업체명</label><input type="text" name="company">
<label>담당자</label><input type="text" name="name">
<label>연락처</label><input type="text" name="number">
<label>이메일</label><input type="text" name="email">
<label>제목</label><input type="text" name="subject">
<label>내용</label><input type="text" name="content">
<input type="button" value="메일발송" onclick="check()">
<input type="hidden" name="to" value="abcd@naver.com"> // 여기에 자신의 이메일 계정
<input type="hidden" name="from" value="abcd@naver.com">// 여기에 자신의 이메일 계정
</form>
<script> 
 function check() {
    document.a.submit();
}
</script>


출처: https://hunit.tistory.com/306 [Ara Blog]
</body>
</html>