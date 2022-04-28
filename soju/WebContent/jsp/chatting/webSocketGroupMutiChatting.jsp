<%@page import="soju.vo.ManagerVO"%>
<%@page import="soju.vo.AgencyVO"%>
<%@page import="soju.vo.ArtistVO"%>
<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
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
<style type="text/css">
	#chatArea {
		border : 1px solid gray;
 		display: none;	 
		padding: 5px;   
		width : 400px;
		min-height: 570px;
		margin: 0px auto;
		background-color: rgb(245, 247, 250);
		margin-top: 100px;
		border-radius:12px 0px 12px 12px ;
	}
	#connectArea {
		padding: 5px; 
		width : 380px;
		margin: 0px auto;
	}
	
	#messageTextArea{
		height:380px; 
		width : 360px;
		resize: none;
		border: none;
		outline: none;
		overflow: hidden;
		margin-left: 20px;
		margin-top: 10px;
		background-color: rgb(245, 247, 250);
	}
	
	#chatRoom{
		display: none;
		padding: 5px; 
		width : 330px;
		margin: 0px auto;
		margin-top: 170px;
  		margin-left: 10px;
	}
	
	#chatRoom select {
		width : 325px;
		
	}
	
	table{
		margin: 0px auto;
	}
	.no{
		display: none;
	}
	.title{
		margin-left: 20px;
		display: inline-block;
		width: 100px;
		color: #025184;
	}
	#endchat{
		float: right;
		margin-top: 23px;
		margin-right: 20px;
	}
	.messa{
		resize: none;
		border: none;
		outline: none;
		overflow: hidden;
		margin-left: 25px;	
		width: 90%;
		min-height: 50px;
 	    margin-top: 8px;
	}
	#but{
		height: 30pt;
		float: left;
		margin-right: 10px;
		margin-top: 15px;
		margin-left: 5px;
	}
	#endchat, #but{
		background-color: #C8D9E4;
	 	border: none;
	 	padding: 8px;
	 	border-radius: 5px;
	 	font-weight: bold;
	 	color: #2D3337;
	 	cursor: pointer;
	}
	#chatRoomMemList{
		background-color: rgb(245, 247, 250);
	}
/* 	#box{ */
/* 	 	margin-top: 50px; */
/* 	} */
	
	#box{
	    width:100%;
	    height:100%;
	}
	 
</style>
<script>
	
</script>
</head>
<body>
	<div id="box">
		<table>
		<tr>
			<td style="vertical-align: top;">
				<div id="chatArea">
				    <!-- 메시지 표시 영역 -->
				    <h3 class="title">Message</h3>
				    <input type="button" id="endchat" value="접속종료" onclick="closing()">
				    <hr>
				    <textarea id="messageTextArea" readonly="readonly" ></textarea><br>
				    <!-- 송신 메시지 텍스트박스 -->
				    <form>
				    	<div>
							<hr>
							<div style="float: left; width: 82%;">
							<textarea class="messa" id="messageText" placeholder="채팅입력.."></textarea>
							</div>
<!-- 						<input type="text" id="messageText" size="40">	 onkeydown="sendMessage()" -->
					    <!-- 송신 버튼 -->
					    	<input type="button" id="but" value="전송" onclick="sendMessage()">
						</div>
				    </form>
			    </div>
			</td>
			<td>
				<div id="chatRoom">
			    	<span id="chatRoomName" style="font-weight: bold; font-size: 20px; color: #025184;"></span>&nbsp;  
			    	<span style="font-weight: bold; color: #222A2F;">채팅방 멤버 목록</span><br>
			    	<select id="chatRoomMemList" size="19" style="padding:10px;"></select><br>
					<input type="text" id="newRoomName" class="no"> 
					<input type="button" value="채팅방만들기" onclick="createRoom()" class="no"><br><br>
<!-- 			    	채팅방 목록<br> -->
			    	<select id="chatRoomList" class="no" size="10"></select><br>
			    	<input type="button" value="채팅방 입장" onclick="chatRoomIn()" class="no"><br><br>
			    	<input type="button" value="채팅방 나가기" onclick="chatRoomOut()" class="no">
			    </div>
			</td>
		</tr>
		</table>
	    <br>
	    <div id="connectArea">
	    	<!-- 접속자 입력 텍스트박스 -->
		    <input type="hidden" id="userId" value="<%= userNick %>">
		    <!-- 접속 버튼 -->
		    <input type="hidden" value="접속하기" onclick="connectting()">
	    </div>
    </div>
    <br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br>
    
    <script type="text/javascript">
		art_num = "<%= artnum %>";
		art_name = "";
		
		getArtist();
    
    	var webSocket = null; // 웹소켓 변수 선언
        var messageTextArea = document.getElementById("messageTextArea");
    	var messageText = document.getElementById("messageText");
    	var userText = document.getElementById("userId");
		
    	connectting();
    	
    	function connectting(){
    		if(userText.value.trim()==""){
    			alert("접속자 ID를 입력하세요");
    			userText.focus();
    			return;
    		}
				//웹소켓 초기화
				webSocket = new WebSocket("ws://192.168.42.42:8099/soju/websocktGroupMultiChat.do");
// 				webSocket = new WebSocket("ws://localhost:80/soju/websocktGroupMultiChat.do");
				
	    	// 처음 접속 성공하면 
				webSocket.onopen = function onOpen(event){
					document.getElementById("connectArea").style.display = "none";
					
					document.getElementById("chatRoom").style.display = "block";
					document.getElementById("chatArea").style.display = "block";
					// webSocket.send(userText.value);
					
					webSocket.send( createMessage("connect", "전체", userText.value) );
					webSocket.send( createMessage("create", art_name, null) );
					webSocket.send( createMessage("change", art_name, null) );
					
				}
	        
				//메시지가 오면 messageTextArea요소에 메시지를 추가한다.
				webSocket.onmessage = function processMessge(message){
					//Json 풀기
					var jsonData = JSON.parse(message.data);
					if(jsonData.message != null) {
							messageTextArea.value += jsonData.message + "\n"
							messageTextArea.scrollTop = 9999999;
					};
						
					// 채팅방 목록 출력하기
// 					if(jsonData.roomList != null){
// 						var jsonRoomList = JSON.parse(jsonData.roomList);
// 						var selElement = document.getElementById("chatRoomList");
// 						var strHtml = "";
// 						for(var i=0; i<jsonRoomList.length; i++){
// 							strHtml += "<option value='" + jsonRoomList[i] + "'>" + jsonRoomList[i] + "</option>";
// 						}
// 						selElement.innerHTML = strHtml;
// 					}
					
// 					if(jsonData.roomName != null){
// 						document.getElementById("chatRoomName").innerHTML = jsonData.roomName;
// 					}
	            
					// 채팅방 멤버 목록 출력하기
					if(jsonData.roomMemList != null){
						var jsonRoomMemList = JSON.parse(jsonData.roomMemList);
						var selElement = document.getElementById("chatRoomMemList");
						var strHtml = "";
						for(var i=0; i<jsonRoomMemList.length; i++){
							strHtml += "<option value='" + jsonRoomMemList[i] + "'>" + jsonRoomMemList[i] + "</option>";
						}
						selElement.innerHTML = strHtml;
					}
				}
	        
				webSocket.onerror = function showErrorMsg(event) {
					alert("오류 : " + event.data);
				}
			
				webSocket.onclose = function(event){
					messageTextArea.value = "";
					messageText.value = "";
					userText.value = "";
					document.getElementById("connectArea").style.display = "block";
					document.getElementById("chatRoom").style.display = "none";
					document.getElementById("chatArea").style.display = "none";
				}
    	}
    
    	// 메시지 구조  {"command" : "명령종류", "room" : "채팅방이름", "message" : "메시지" }
    	// 명령 종류 : "create" - 채팅방 만들기, "change" - 채팅방 이동, "message" - 메시지 전송, "connect" - 처음 접속 
    	
    	
			//메시지 보내기
			function sendMessage(){
				if(messageText.value.trim()==""){
					messageText.focus();
					return;
				}
				var room = document.getElementById("chatRoomName").innerHTML.trim();
				
				//webSocket.send('{"room" : "' + "전체" + '", "message" : "' + messageText.value + '"}' );
				webSocket.send( createMessage("message", room, messageText.value) );
				messageText.value = ""; 
			}
    	
    	// 채팅방 만들기
    	function createRoom(){
    		var newRoom = document.getElementById("newRoomName");
    		if(newRoom.value==""){
    			alert("생성할 채팅방을 입력한 후 사용하세요.")
    			newRoom.focus();
    			return;
    		}
    		webSocket.send( createMessage("create", newRoom.value, null) );
    		newRoom.value = ""; 
    	}
    	
    	// 채팅방 이동
    	function chatRoomIn(){
    		var selectRoom = document.getElementById("chatRoomList")
    		if(selectRoom.selectedIndex==-1 || selectRoom.value==""){
    			alert("이동할 채팅방을 선택한 후 사용하세요.");
    			return;
    		}
    		webSocket.send( createMessage("change", selectRoom.value, null) );
    	}
    	
    	// 채팅방 나가기  ==> 즉, '전체' 채팅방으로 이동
    	function chatRoomOut(){
    		webSocket.send( createMessage("change", "전체", null) );
    	}
    	
    	// 전송할 메시지를 작성하는 함수
    	function createMessage(command, room, message){
    		return '{"command" : "' + command + '", "room" : "' + room + '", "message" : "' + message + '"}'
    	}
        
			function closing(){
				webSocket.close();
				location.href = '<%= request.getContextPath() %>/jsp/feed/feed0.jsp?';
			}
			
			window.onbeforeunload = function(){
				closing();
			}
			
		//엔터치면 전송버튼 눌리는 코드 
		$(".messa").keyup(function(event) {
		    if (event.keyCode === 13) {
	                $('#but').click();
	           
		    }
		})


    </script>
</body>
</html>