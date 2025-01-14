<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="<%= request.getContextPath() %>/js/admin/listAllTicket.js"></script>
<title>So? Would You?</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

body{
	width : 100%;
	height : 100%;
}
.root{
	position: relative;
	height: 100%
}
*, :after, :before{
	box-sizing: border-box;
}
div {
    display: block;
}
a{
	color: inherit;
	text-decoration: none;
}
img {
    vertical-align: middle;
}
button{
	padding: 0px;
	margin: 0px;
	appearance: none;
	background: none;
	border: none;
	cursor: pointer;
}
.header1{
	display: block;
	width: 100%;
	height: 75px;
}
.header11{
	position: fixed;
	display: flex;
	align-items: center;
	width: inherit;
	height: inherit;
	top: 0px;
	left: 0px;
	background-color: white;
	border-bottom: 1px solid lightgray;
	z-index: 1000;
	padding: 0px 32px 0px 26px; 
}
.header111{
	margin-right: auto;
	display: flex;
	align-items: center;
}
.mainlogo{
	margin-left: 16px;
	padding: 6px;
}
.header112{
	margin-left: auto;
	display: flex;
}
.header1122{
	position: relateve;
	margin: 0px 25px;
}


.bell{
	margin: 0px 25px;
}

.dropbtn2 {
  background-color: white;
  color: black;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropbtn2:hover, .dropbtn2:focus {
  background-color: none;
}

.dropdown2 {
  float: right;
  position: relative;
  display: inline-block;
}

.dropdown-content2 {
  display: none;
  position: absolute;
  background-color: white;
  min-width: 120px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  right: 0;
  z-index: 1;
  border-radius: 8px;
}

.dropdown-content2 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown2 a:hover {background-color: #ddd;}

.show2 {display: block;}

.dropbtn {
  color: black;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  right: 0;
  background-color: white;
  min-width: 120px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  border-radius: 8px;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: none;}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: none;
}
.admintiket1{
	margin: 0px auto;
	display: flex;
	flex-direction: column;
	width: 896px;
	padding: 0px 48px;
}
iframe{
	padding: 0px;
	margin: 30px 0px 0px;
	list-style: none;
	min-height: 570px;
	border: 1px solid lightgray;
	border-radius: 8px;
}
.admintiket2{
	padding: 0px;
	margin: 0px;
}
li{
	display: inline;
	margin: 0px;
	padding: 0px;
}
</style>

<script type="text/javascript">
$(function(){
	listAllTicket();
});

</script>

</head>
<body>
	<div id="root">
		<div class="root1">
		
			<header class="header1">
				<div class="header11">
					<div class="header111">
						<a href="<%= request.getContextPath() %>/jsp/main/loginMain.jsp" class="mainlogo">
							<img src="<%= request.getContextPath() %>/images/logosample.png" alt="So? Would You?">
						</a>
					</div>
							
							<div class="dropdown">
		  						<button class="dropbtn">
		  							<img class="more" src="<%= request.getContextPath() %>/images/down-arrow.png" alt="more" width="24" >
		  						</button>
		  						<div class="dropdown-content">
									  <a href="<%= request.getContextPath() %>/jsp/main/adminMember.jsp" target="_self">회원관리</a>
									  <a href="<%= request.getContextPath() %>/jsp/main/adminTiket.jsp" target="_self">결제관리</a>
									  <a href="<%= request.getContextPath() %>/jsp/main/adminQna.jsp" target="_self">고객지원</a>
							  	</div>
							</div>
							
				</div><!-- header11 -->
			</header><!-- header1 -->
			<h2 class="admintiketname">결제관리</h2>
			<ul class="admintiket2">
	       <li><a href="/soju/jsp/ticket/adminListAllTicket.jsp" target="main">이용권목록</a></li>
	        <li><a href="/soju/jsp/ticket/adminListAllPay.jsp" target="main">결제목록</a></li>
	        </ul> 
	        <iframe src="/soju/jsp/ticket/adminListAllTicket.jsp" name="main" scrolling="yes" frameborder="0">
										
			</iframe>
		</div>
	</div>

</body>
</html>