<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
<button onclick="cancelPay()">환불하기</button>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
<script>
  function cancelPay() {
    jQuery.ajax({
      /* ... 중략 ... */
    }).done(function(result) { // 환불 성공시 로직 
      alert("환불 성공");
    }).fail(function(error) { // 환불 실패시 로직
      alert("환불 실패");
    });
  }
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<button onclick="cancelPay()">환불하기</button>
