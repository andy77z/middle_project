<%@page import="soju.vo.AgencyVO"%>
<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="/soju/js/jquery-3.6.0.min.js"></script>
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
.notice1{
	margin: 0px auto;
	display: flex;
	flex-direction: column;
	width: 896px;
	padding: 0px 48px;
}

.notice2{
	padding: 0px;
	margin: 30px 0px 0px;
	list-style: none;
	min-height: 570px;
	border: 1px solid lightgray;
	border-radius: 8px;
}
.container *{
	/*border : 1px solid pink;*/
}
.container{
	/*border : 1px solid blue;*/
    min-height: 570px;
    border: 1px solid lightgray;
    border-radius: 8px;
	width : 700px;
	height : 700px;
	margin-top: 30px;
	margin-left: 30%;
}
h2{
    font-size: 1.5em;
    font-weight: 800;
    margin-left: 30%;
    margin-top: 50px;
}
.form-horizontal{
	padding-top: 40px;
}
#stitle{
	width: 300px;
}
.form-group input{
	margin-left: 100px;
	margin-bottom: 20px;
	margin-right: 5px; 
}
.form-group select{
	margin-left: 150px;
}
.form-group label{
	margin-left: 100px;
	margin-bottom: 20px;
	font-weight: bold;
}
.subbtn{
  padding: 7px 19px;
  border-radius: 2px;
  background-color: #4962B3;
  font-size: 12px;
  border: 1px solid #3e549a;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
  margin-left: 250px;
}
td button, #sbutton{
    background-color: #2C7CE6;
    border-width: 0px;
    border-color: #2C7CE6;
    border-style: solid;
    border-radius: 18px;
    color: white;
    text-align: center;
	width: 45px;
	height: 25px;
	font-size: 0.8em;
}
.table{
	margin: auto;
	text-align: center;
	border-collapse: collapse;
	border: 1px solid gray;
	padding: 5px;
}
#tbtitle{
	width: 300px;
	
}
#tbstart{
	width: 100px;
}
#tbend{
	width: 100px;
}
#ftr{
	font-weight: bold;
	height: 30px;
	font-size : 1.0em;
}
</style>
<%
	AgencyVO vo = (AgencyVO)session.getAttribute("loginUser");	
	String agcId = vo.getAgc_id();
%>

<script>
 $(function(){
	 sstart = "";
	 send =	""; 
	//조회 버튼 눌렀을 때
	$('#sbutton').on('click',function(){
		//조회할 날짜
 		 sstart = $('#ssdate').val();
 		 send = $('#sedate').val();
		 //alert(sstart);
		
		//id연동 해당일 일정목록 띄우기
		$.ajax({
			url : '/soju/scheduleSelect.do', 
			data : {"agcId" : "<%=agcId%>",
					"sstart" : sstart,
					"send" : send
					},
			type : 'get',
	  	  		success: function(res){
	  	  			str = "<table class='table' border='1'>";
	        	 	str += "<tr id='ftr'><td id='tbtitle'>일정제목</td><td id='tbstart'>시작일</td><td id='tbend'>종료일</td><td>분류</td><td>아티스트명</td><td>삭제</td></tr>";
	  	  			$.each(res, function(i, v){//i: 순서, v: 객체(isp파일의 vo)
		        	 	str += "<tr><td class='"+ v.cal_num +"'>"+ v.cal_title +"</td>";
		        	 	str += "<td>" + v.cal_start + "</td>";
		        	 	str += "<td>" + v.cal_end + "</td>";
		        	 	str += "<td>" + v.event_lgu + "</td>";
		        	 	str += "<td>" + v.art_name + "</td>";
		        	 	str += "<td><button type='button' id='delete'>삭제</button></td></tr>";
					})//each
		        	 	$('#result1').html(str);
	  	  		},//success
	  	  		error : function(xhr){
	  	  			alert("상태 : "+xhr.status);
	  	  		},
	  	  		dataType: 'json'
	  	})//ajax
		
    })//sbutton
    
    //삭제버튼 눌렀을 때
    $(document).on('click', "#delete", function(){
    	calNum = $(this).parent().siblings('td:eq(0)').attr('class');
    	
    	$.ajax({
			url : '/soju/deleteSchedule.do', 
			data : {"calNum" : calNum},
			type : 'get',		
			success: function(res){
    				alert("삭제성공");
			},//success
  	  		error : function(xhr){
  	  			alert("상태 : "+xhr.status);
  	  		},
  	  		dataType: 'json'
  		})//ajax
  	
  		$.ajax({
			url : '/soju/scheduleSelect.do', 
			data : {"agcId" : "<%=agcId%>",
					"sstart" : sstart,
					"send" : send
					},
			type : 'get',
	  	  		success: function(res){
	  	  			str = "<table class='table' border='1'>";
	        	 	str += "<tr><td id='tbtitle'>일정제목</td><td id='tbstart'>시작일</td><td id='tbend'>종료일</td><td>분류</td><td>아티스트명</td><td>삭제</td></tr>";
	  	  			$.each(res, function(i, v){//i: 순서, v: 객체(isp파일의 vo)
		        	 	str += "<tr><td class='"+ v.cal_num +"'>"+ v.cal_title +"</td>";
		        	 	str += "<td>" + v.cal_start + "</td>";
		        	 	str += "<td>" + v.cal_end + "</td>";
		        	 	str += "<td>" + v.event_lgu + "</td>";
		        	 	str += "<td>" + v.art_name + "</td>";
		        	 	str += "<td><button type='button' id='delete'>삭제</button></td></tr>";
					})//each
		        	 	$('#result1').html(str);
	  	  		},//success
	  	  		error : function(xhr){
	  	  			alert("상태 : "+xhr.status);
	  	  		},
	  	  		dataType: 'json'
	  	})//ajax
  	
    })
 })  
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
							<a href="<%= request.getContextPath() %>/jsp/main/mypage.jsp" target="main">
								<img class="my1" src="<%= request.getContextPath() %>/images/user.png" alt="my1" width="24" >
							</a>
							
							<div class="dropdown2">
								<button onclick="myFunction2()" class="dropbtn2">
									<img class="bell" src="<%= request.getContextPath() %>/images/bell.png" alt="bell" width="24" >
								</button>
								<div id="myDropdown2" class="dropdown-content2">
									<h5>알림게시판잇어야함</h5>
									
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
							
				</div><!-- header11 -->
			</header><!-- header1 -->
			
				<h2 class="stitle">일정 조회/삭제</h2>
			<div class="container">
  				<form class="form-horizontal" onsubmit="return false">
    				
    				<div class="form-group">
				      <label class="control-label col-sm-2" for="seldate">기간선택:</label><br>
				        <input type="date" class="form-control" id="ssdate" name="sel_start">
				        <input type="date" class="form-control" id="sedate" name="sel_end">
				        <button id="sbutton">조회</button>
				        <div id="result1">
				        </div>
				    </div>
    				
    			</form>
			</div>						
			
		</div>
	</div>

</body>
</html>