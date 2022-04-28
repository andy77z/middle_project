<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So? Would You?</title>
<script>
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("more");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

function myFunction2() {
  document.getElementById("myDropdown2").classList.toggle("show2");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn2')) {
    var dropdowns = document.getElementsByClassName("bell");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show2')) {
        openDropdown.classList.remove('show2');
      }
    }
  }
}
</script>
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

.dropdown2 a:hover {background-color: none;}

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
.adminmember1{
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
	border: 1px solid lightgray;
	border-radius: 8px;
	height: 1500px;
	
}
.adminmember2{
	padding: 0px;
	margin: 0px;
}
li{
	display: inline;
	margin: 0px;
	padding: 0px;
}
.logout{
	height: 32px;
	border-radius: 18px;
	border: 1px solid #2C7CE6;
	background-color: white;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	color: #2C7CE6;
	padding: 0px 20px;
	cursor: pointer;
}
.adminmember2 a:link, .adminmember2 a:visited {
  background-color: #2C7CE6;
  color: white;
  padding: 4px 8px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.adminmember2 a:hover, .adminmember2 a:active {
  background-color: #649de6;
  color : white;
}
</style>
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
						<div class="dropdown2">
							<button class="logout">
								<a href="<%=request.getContextPath() %>/Logout.do" target="_top">로그아웃</a>
							</button>
						</div>
						
						<div class="dropdown2">
							<button onclick="myFunction2()" class="dropbtn2">
								<img class="bell" src="<%= request.getContextPath() %>/images/bell.png" alt="bell" width="24" >
							</button>
							<div id="myDropdown2" class="dropdown-content2">
								<h5 style="text-align: center;">긴급점검중...</h5>
							</div>
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
			
			<div class="adminmember1">
				<h2 class="adminmembername">회원관리</h2>
				<ul class="adminmember2">
					<li><a href="./memListAdmin.jsp" target="main2">회원목록</a></li>
					<li><a href="./ban.jsp" target="main2">신고목록</a></li>
					<li><a href="./agencyid.jsp" target="main2">소속사계정관리</a></li>
					<li><a href="./artistid.jsp" target="main2">아티스트계정관리</a></li>
				</ul>
				<iframe src="./memListAdmin.jsp" name="main2" scrolling="no" frameborder="0"></iframe>
				
			</div>								
			
		</div>
	</div>

</body>
</html>