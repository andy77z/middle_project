
<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So? Would You?</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<%
	int type = (Integer)session.getAttribute("type");
%>
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
<script>
	$(function(){
		$.ajax({
			/* url: '/team3/Homemain.do', */
			url: '<%= request.getContextPath() %>/Homemain.do',
			type:'get',
			success: function(res){
	            str = "";
	            $.each(res, function(i,v){
	               str += `<div class="homeArtist1">`;
	               str += `<a href="<%= request.getContextPath() %>/openArtist.do?art_num=\${v.art_num}">`
	               str += `<button class="homeArtist2">`;
	               str += `<div class="homeArtistPhoto1">`;
	               str += `<div class="homeArtistPhoto2" style="background-image: url('<%= request.getContextPath() %>/images/\${v.photo}');">`;
	               str += `</div>`;
	               str += `</div>`;
	               str += `<div class="homeArtistName1">`;
	               str += `<div class="homeArtistName2">\${v.name}</div>`;
	               str += `</div>`;
	               str += `</button></a>`;
	               str += `</div>`;
	            })
	            $('.homeArtistList').html(str);
	         },
			error: function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType: 'json'
		})
	})
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
body{
	width : 100%;
	height : 100%;
}
.root1{
	position: relative;
	height: 100%
}
a{
	color: inherit;
	text-decoration: none;
}
*, :after, :before{
	box-sizing: border-box;
}
button{
	padding: 0px;
	margin: 0px;
	appearance: none;
	background: none;
	border: none;
	cursor: pointer;
}
div{
	display: block;
}
img{
	vertical-align: middle;
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

.dropdown2 a:hover 
{background-color: none;}

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
.section0{
	margin: 0px auto;
	display: flex;
	flex-direction: column;
	width: 1136px;
	padding: 0px 48px;
}
.section1{
	margin-top: 40px;
}
.homeArtistList{
	position: relative;
	width: calc(100% + 16px);
	margin-left: -8px;
	margin-right: -8px;
}
.homeArtist1{
	margin: 0px 8px 16px;
	width: 248px;
	display: inline-block;
}
.homeArtist2{
	display: inline-block;
	text-align: center;
	background-color: white;
	width: 100%;
	height: 256px;
	border: none;
	border-radius: 100%;
	padding: 0px;
	overflow: hidden;
	position: relative;
	vertical-align: top;
	box-shadow: rgb(0 0 0 / 15%) 0px 2px 8px;
}
.homeArtistPhoto1{
	width: 100%;
	height: 186px;
	overflow: hidden;
}
.homeArtistPhoto2{
	width: 100%;
	height: 186px;
	background-color: #F5F7FA;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center bottom;
	border-radius: 0px;
}
.homeArtistName1{
	height: 70px;
	display: flex;
	flex-direction: column;
	-webkit-box-pack:center;
	justify-content: center;
	padding: 0px 18px;
}
.homeArtistName2{
	font-family: 'Do Hyeon', sans-serif;
	font-size: 30px;
	text-align: center;
	color : black;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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
<%
	switch(type){
	case 1:
%>
						<!-- 팬 회원 -->
						<a href="<%= request.getContextPath() %>/jsp/main/mypage.jsp">
							<img class="my1" src="<%= request.getContextPath() %>/images/user.png" alt="my1" width="24" >
						</a>
						
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
								  <a href="<%= request.getContextPath() %>/jsp/main/alarm.jsp">알림설정</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/notice.jsp">공지사항</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/qna.jsp">문의</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/tiket.jsp">이용권관리</a>
						  	</div>
						</div>
						
						
						<!-- 아티스트 -->
<%
		break;
	case 2:
%>						
						<a href="<%= request.getContextPath() %>/jsp/main/mypage.jsp">
							<img class="my1" src="<%= request.getContextPath() %>/images/user.png" alt="my1" width="24" >
						</a>
						
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
								  <a href="<%= request.getContextPath() %>/jsp/main/notice.jsp">공지사항</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/qna.jsp">문의</a>
						  	</div>
						</div>
						<!-- 소속사 -->
<%
		break;
	case 3:
%>						
						<a href="<%= request.getContextPath() %>/jsp/main/mypage.jsp">
							<img class="my1" src="<%= request.getContextPath() %>/images/user.png" alt="my1" width="24" >
						</a>

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
								  <a href="<%= request.getContextPath() %>/jsp/calendar/schedule.jsp" target="_self">일정관리</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/notice.jsp">공지사항</a>
								  <a href="<%= request.getContextPath() %>/jsp/main/qna.jsp">문의</a>
						  	</div>
						</div>
<%
		break;
	case 4:
%>
						<!-- 관리자 -->
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
<%
		break;
	}
%>		
			</div><!-- header11 -->
		</header><!-- header1 -->
		
		<div class="section0">
			<section class="section1">
				<div class="homeArtistList">
					
				</div>
			</section>
		</div>
		
	</div>
</div>
    
</body>
</html>