<%@page import="soju.vo.ManagerVO"%>
<%@page import="soju.vo.ArtistVO"%>
<%@page import="soju.vo.AgencyVO"%>
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
  
<style>
label{
  	display : inline-block;
  	width: 40px;
  	height: 40px;
}
.form1{
	margin-left: 20px;
}
.titlename{
	font-size: 20px;
	font-weight: bold;
	line-height: 50px;
	color: #4f4f4f;
	margin-left: 20px;
}
#send{
	margin-left: 685px;
	background: white;
	border: 1px solid #969696;
}
.intxt{
	border: 1px solid #969696;
}
</style>

<script>
$(function(){
	  //글쓰기 후 전송 클릭
	  $('#send').on('click', function(){
		  //[한꺼번에 가져온다!]
		  fdata = $('.form1').serializeArray();
		  console.log(fdata);
		  
		  //서버로 전송
		  MyQnAWrite();
	  })
})
</script>

</head>
<body>
<h2 class="titlename">1:1문의하기 </h2>

<form class="form1">
	
	<input type="hidden" value="<%= userId %>" name="dq_id">
	
	<label>제목</label>
	<input class="intxt" type="text" style="width: 91.8%;" name="dq_title">
	<br>	
				
	<label>내용</label><br>
	<textarea class="intxt" name="dq_cont" rows="10" cols="105"></textarea>
	<br><br>	
	<input type="button" value="문의하기" id="send">
	<br>
</form>


</body>
</html>