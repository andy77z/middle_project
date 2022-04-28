<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/css/artistFrame.css"> --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="<%= request.getContextPath() %>/js/myTicket/ticketList.js"></script>
  <%
     MemberVO mvo = (MemberVO)session.getAttribute("loginUser"); 
     int memNum = mvo.getMem_num(); 
 %>
 <style>
/*   body *{ */
/*   border : 2px solid blue; */
/*   } */
   .ticketImg{
  
  }
  
  .ticketInfo{
    float: left;
    width: 50%;
    height: 100px;
  }
  
.ticketPrice{
 float : left;
}   

 .buyTicketBtn{ 
 	width: 90%; 
         height: 25% ;
     border-radius: 5px; 
 } 

 
  

 
/* 티켓  td 틀 */

.maintr td{
  border: 2px solid gray;
   background: #2C7CE6;
  color: white;
  font-weight: bold;

  }   
  
 .none{

 } 
  
td{
text-align: center;
width: 10%;
border: 2px solid lightgray;
height: 50px;
 }

.td_artist{

}
 
.td_info{
width: 30%;
} 

.td_price{

}

.td_buy{

}
 </style>
 <script>
 memNum = <%= memNum %>;
//  memNum = 2;
 ticNum = 0;
$(function(){
// 	alert(memNum);
	myTicketList();
	
	
	$(document).on("click", ".buyTicketBtn", function(){
		
		 ticNum = $(this).parent().siblings('td:eq(0)').attr('class');
// 		 alert(ticNum);
		 updateTicket();
		 
	});
	
	
});
   
 </script>
 
</head>
<body>

     <div class="buyTicketDiv">

     
     </div>

</body>
</html>