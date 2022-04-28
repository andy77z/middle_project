<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/myTicket/checkTicket.js"></script>
  <%
     MemberVO mvo = (MemberVO)session.getAttribute("loginUser"); 
     int memNum = mvo.getMem_num(); 
     int artnum = (Integer)session.getAttribute("art_num");
 %>
  
  <script type="text/javascript">
 
  memNum = <%= memNum %>;
  artNum = <%= artnum %>;
	$(function(){
// 	alert(artNum);
    //이용권 여부 확인하기		
	checkTicket();
	
	
});
   
 </script>
  
  
</head>
<body>

</body>
</html>