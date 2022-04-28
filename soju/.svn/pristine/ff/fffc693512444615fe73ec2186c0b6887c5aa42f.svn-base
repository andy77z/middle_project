<%@page import="soju.vo.ManagerVO"%>
<%@page import="soju.vo.AgencyVO"%>
<%@page import="soju.vo.ArtistVO"%>
<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So? Would You?</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="<%= request.getContextPath() %>/js/notice/MyQna.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%
	int type = (Integer)session.getAttribute("type");

	String userId = "";
	String userName = "";
	String userNick = "";
	String userEmail = "";
	String userPhoto = "";
	
	switch(type){
	case 1:
		MemberVO mvo = (MemberVO)session.getAttribute("loginUser");
		userId = mvo.getMem_id();
		userName = mvo.getMem_name();
		userNick = mvo.getMem_nick();
		userEmail = mvo.getMem_mail();
		userPhoto = mvo.getMem_photo();
		break;
	case 2:
		ArtistVO avo = (ArtistVO)session.getAttribute("loginUser");
		userId = avo.getArt_id();
		userName = avo.getArt_name();
		userNick = avo.getArt_name();
		userEmail = avo.getArt_mail();
		userPhoto = avo.getArt_photo();
		break;
	case 3:
		AgencyVO gvo = (AgencyVO)session.getAttribute("loginUser");
		userId = gvo.getAgc_id();
		userName = gvo.getAgc_name();
		userNick = gvo.getAgc_name();
		userEmail = gvo.getAgc_mail();
		userPhoto = gvo.getAgc_photo();
		break;
	case 4:
		ManagerVO nvo = (ManagerVO)session.getAttribute("loginUser");
		userId = nvo.getMng_id();
		userName = nvo.getMng_name();
		userNick = nvo.getMng_name();
		userEmail = "관리자";
		break;
	}
%>

<script>
reply = { }
userId = '<%= userId %>'

$(function(){
	MyQnAList(userId);
	
	//이벤트 수행
	  $('.list').on('click', '.action', function(){
		  idx = $(this).attr('idx');
		  name = $(this).attr('name');
		  //alert(name + ", " + idx);
		  
		  
	  	  if(name=="reply"){
		  //alert(idx + "번째 글에 댓글을 등록합니다.");
		  
		  text = $(this).prev().val();
		  console.log(text);
		  
		  //text
		  reply.bonum = idx;
		  reply.cont = text;
		  
		  //console.log(text);
		  //console.log(idx);
		  
		  //서버로 전송 $.ajax({})
		  replyInsert(this); //댓글저장 - 등록버튼객체 
		  
	      }else if(name=="list"){
		  //alert(idx + "번째의 내용과 댓글을 출력합니다.");
		  
		  
		  replyList(this);
		  
		  }//if끝
		  
	  })//이벤트수행 끝
	  
})//전체 function 끝

</script>

<style>
  body{
  	margin : 10px;
  }

  .panel-heading{
  	padding : 15px;
  }
  .panel-default>.panel-heading {
    color: #333;
    background-color: white;
    border-color: lightgray;
    color: inherit;
	text-decoration: none;
}
  .panel-title a{
	color: inherit;
	text-decoration: none;
  }
  .p1{
  	width : 80%;
  	padding : 5px;
  	margin : 3px;
  	float : left;
  }
  .p2{
  	width : 17%;
  	padding : 5px;
  	margin : 2px;
  	float : right;
  }
  .p3{
  	clear : both;
  }
  .p4{
  	
  }
  input[name=reply]{
  	height : 46px;
  	vertical-align: top;
  }
  .subsub{
  	font-weight: bold;
  }
  .subdate{
  	color: rightgray;
  	font-size: 0.8em;
  }
  .pager{
  	width : 100px;
  	float : left;
  	margin : 5px;
  	margin-left: 5%;
  }
  .repl{
  	border : 1px solid gray;
  	background: #f1f2fa;
  	margin : 1px;
  	padding : 5px;
  }
  #modifyform{
  	display: none;
  }
  label{
  	display : inline-block;
  	width: 60px;
  	height: 30px;
  }
  wd{
 	text-align: right;
  }
  #writeMadal, #modifyModal{
  	display: none;
  }
  #write{
  	margin-left: 700px;
  	margin-bottom: 10px;
  }
  .titlename{
	font-size: 20px;
	font-weight: bold;
	line-height: 50px;
	color: #4f4f4f;
	margin-left: 10px;
}
</style>

</head>
<body>
<h2 class="titlename">내가 쓴 문의</h2> 

<div class="list">



</div>


</body>
</html>