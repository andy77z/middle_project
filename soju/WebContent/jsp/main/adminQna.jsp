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
.adminqna1{
	margin: 0px auto;
	display: flex;
	flex-direction: column;
	width: 896px;
	padding: 0px 48px;
}
.adminqnaname{
	display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

iframe{
	padding: 0px;
	margin: 30px 0px 0px;
	list-style: none;
	min-height: 570px;
	border: 1px solid lightgray;
	border-radius: 8px;
	height: 1000px;
}
.adminqnamenu{
	margin: 0px;
	padding: 0px;
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

.adminqnamenu a:link, .adminqnamenu a:visited {
  background-color: #2C7CE6;
  color: white;
  padding: 4px 8px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

.adminqnamenu a:hover, .adminqnamenu a:active {
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
			
			<div class="adminqna1">
				<h2 class="adminqnaname">문의</h2>
				<ul class="adminqnamenu">
					<li><a href="<%= request.getContextPath() %>/jsp/notice/noticeMain.jsp" target="iff">공지사항</a></li>
					<li><a href="<%= request.getContextPath() %>/jsp/notice/jaju.jsp" target="iff">자주묻는질문</a></li>
					<li><a href="<%= request.getContextPath() %>/jsp/notice/adminQna.jsp" target="iff">1:1문의 답변대기</a></li>
					<li><a href="<%= request.getContextPath() %>/jsp/notice/adminQna2.jsp" target="iff">1:1문의 답변완료</a></li>
				</ul>
				<iframe src="<%= request.getContextPath() %>/jsp/notice/noticeMain.jsp" name="iff" scrolling="no" frameborder="0"></iframe>
			</div>								
			
		</div>
	</div>

</body>
</html>