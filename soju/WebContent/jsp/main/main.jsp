<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So? Would You?</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script>
function proc2(){
	   window.open("<%= request.getContextPath() %>/jsp/member/member.jsp","_blank","width=700 height=1000");
	   
	}
function proc3(){
	   window.open("<%= request.getContextPath() %>/jsp/member/login.jsp","_blank","width=550 height=800");
	   
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
	               str += `<button class="homeArtist2" onclick="proc3()">`;
	               str += `<div class="homeArtistPhoto1">`;
	               str += `<div class="homeArtistPhoto2" style="background-image: url('<%= request.getContextPath() %>/images/\${v.photo}');">`;
	               str += `</div>`;
	               str += `</div>`;
	               str += `<div class="homeArtistName1">`;
	               str += `<div class="homeArtistName2">\${v.name}</div>`;
	               str += `</div>`;
	               str += `</button>`;
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
.root{
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
div{
	display: block;
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
.header1-1{
	display: block;
	width: 100%;
	height: 75px;
}
.header1-2{
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
.header1-3{
	margin-right: auto;
	display: flex;
	align-items: center;
}
.mainlogo{
	margin-left: 16px;
	padding: 6px;
}
.header2-1{
	margin-left: auto;
	display: flex;
}
.join, .login{
	display: inline-block;
	background-color: #2C7CE6;
	border-width: 0px;
	border-color: #2C7CE6;
	border-style: solid;
	border-radius: 18px;
	color: white;
	padding: 0px 20px;
	font-size: 14px;
	height: 32px;
	text-align: center;
	cursor: pointer;
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
</style>
</head>
<body>
<div id="root">
	<div class="root">
	
		<header class="header1-1">
			<div class="header1-2">
				<div class="header1-3">
					<a href="<%= request.getContextPath() %>/jsp/main/main.jsp" class="mainlogo">
						<img src="<%= request.getContextPath() %>/images/logosample.png" alt="So? Would You?">
					</a>
				</div><!-- header111 -->
				<div class="header2-1">
					<div class="header2-2">
						<button type="button" class="join" onclick="proc2()">회원가입</button>
						
						<button type="button" class="login" onclick="proc3()">로그인</button>
					</div><!-- header1121 -->
				</div><!-- header112 -->
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