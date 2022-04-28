<%@page import="soju.vo.ManagerVO"%>
<%@page import="soju.vo.AgencyVO"%>
<%@page import="soju.vo.ArtistVO"%>
<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/chatting/chatting.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/js/chatting/chatting.js"></script>

<%

	int type = (Integer)session.getAttribute("type");
	int artnum = (Integer)session.getAttribute("art_num");
	
	
	
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
function proc1(t){
	//event.preventDefault();
	
	
	if($('.amenu a').hasClass('fcolor')){
		
		$('.amenu a').removeClass('fcolor');
	}
	$(t).addClass('fcolor');
	
	name = $(t).attr('name');
	if(name=="feed"){
		location.href = '<%= request.getContextPath() %>/jsp/feed/feed0.jsp?art_num=<%= artnum %>&cate_name=' + name;
	}else if(name=="artist"){
		location.href = '<%= request.getContextPath() %>/jsp/artist/artist.jsp?art_num=<%= artnum %>&cate_name=' + name;
	}else if(name=="media"){
		location.href = '<%= request.getContextPath() %>/jsp/media/mediaMain.jsp?art_num=<%= artnum %>&cate_name=' + name;
	}else if(name=="chatting"){
		
	}
}
</script>
<script>

art_num = "<%= artnum %>";
art_name = "";
user_profile = "<%= userPhoto %>";
mem_nick = "<%= userNick%>";
//아티스트 이름이랑 내 이름은 임의로 지정..
$(function () {
	
	getArtist();
	
	deleteChat();	//데이터 자동삭제 지금시간에서 10분전꺼 사라짐	

// 	chatList();


		//insert
		$('#but').on('click', function() {
// 			art_name = $('.'+idx).attr('class')
			cont = $('.messa').val();
			cont = cont.replace(/\r/g, "").replace(/\n/g, "<br>");
			
			insertChat();
		})
		
		//엔터치면 전송버튼 눌리게
		$(".messa").keyup(function(event) {
		    if (event.keyCode === 13) {
		        $("#but").click();
		    }
		})
		
		//나가기 버튼 누르면 채팅창 숨김   >>> 원래 화면으로 돌아가기로 변경하기!
		$('#end').on('click', function () {
			
			
			location.href = '<%= request.getContextPath() %>/jsp/feed/feed0.jsp';
		})
	
$('#art').on('click', function () {
	idx = 1;
	chatListArt();
})

$('#all').on('click', function () {
	idx = 2;
	chatList();
})




})

</script>
<body>

<!-- <input type="button" value="채팅하기" id="start" idx=""> -->
<input type="button" value="나가기" id="end" >

<div class=""  id="chatbox">
	<h3 class="title" class="title">Message</h3>
	<div class="container title more">
	  <div class="dropdown">
	    <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">더보기
	    <span class="caret"></span></button>
	    <ul class="dropdown-menu">
	      <input type="button" value="전체대화 보기" id="all"></input>
	      <input type="button" value="아티스트 글만 보기 " id="art"></input>
	    </ul>
	  </div>
	</div>
	<hr>
	<div class="pchat">		

	</div>
	<!-- 메시지 보내기 -->
		<form>
			<div>
				<hr>
				<div style="float: left; width: 82%;">
				<textarea class="messa" placeholder="채팅입력.."></textarea>
				</div>
				<input type="button" id="but" value="전송">
			</div>
		</form>

</div>

</body>
</html>