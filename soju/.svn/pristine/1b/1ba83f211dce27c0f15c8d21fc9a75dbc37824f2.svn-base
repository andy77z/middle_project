
//아티스트 정보호출 
function getArtist(){
   $.ajax({
      url : '/soju/getArtist2.do',
      data : {"art_num":art_num},
      type : 'post',
      success : function(res) {
         art_name = res.art_name;
         $('#chatRoomName').text(art_name);
//    	$('#chatbox').attr('class', res.art_name)
      },
      error : function (xhr) {
//         alert(xhr.status)
      },
      dataType : 'json'
   })
}

//채팅 추가하기
function insertChat() {
	
	$.ajax({
		
		url : "/soju/InsertChat.do",
		type : "post",
		data : {
			"art_name" : art_name,
			"mem_nick" : mem_nick,  
			"chat_cont" : cont,
			"photo" : user_profile
		},
		success : function(res) {
//			alert(res.sw)
			
			//입력 후 textarea에 입력내용 지우기
			$('.messa').val("");
			if(idx == 2){
				chatList();
			}else if (idx == 1){
				chatListArt();
			}
			
			
		},
		error : function(xhr) {
//			alert(xhr.status)
		},
		dataType : 'json'
	})
	
}
//채팅 추가하기
function insertChatArt() {
	
	$.ajax({
		
		url : "/soju/InsertChat.do",
		type : "post",
		data : {
			"art_name" : art_name,
			"mem_nick" : mem_nick,  
			"chat_cont" : cont,
			"photo" : user_profile
		},
		success : function(res) {
//			alert(res.sw)
			
			//입력 후 textarea에 입력내용 지우기
			$('.messa').val("");
			
			chatListArt();
			
			
		},
		error : function(xhr) {
//			alert(xhr.status)
		},
		dataType : 'json'
	})
	
}

//채팅 출력하기
function chatList() {
	$('.pchat').empty();
	$.ajax({

		url : "/soju/ChatList.do",
		type : "post",
		data : {"art_name" : art_name},
		success : function(res) {
			str="";

				$.each(res, function(i, v) {
					
					if(v.mem_nick == mem_nick ){// 멤버 아이디가 지금 접속중인 내 아이디와 같을 때
							//<!-- 메시지 (나) -->
							str += `<div class="sender">`;
							//<!-- 채팅 프로필 사진  -->
							str += `<div class="myprofile" style="width: 80px; display: inline-block;">`;
							str += `<div class="profile">`;
							str += `<img id="picture" src="/soju/profile.do?fileName=${v.photo}"><br>`;
							str += `</div>`;
							str += `<p class="time">${v.chat_time}</p>`;//<!-- 시간 -->
							str += `</div>`;
							str += `<div style="line-height:200%"><br></div>`;
							str += `<div class="smessage" >`;
							str += `<div class="snick">${v.mem_nick}</div>`;//<!-- 내 닉네임 -->
							str += `${v.chat_cont}`;//<!-- 채팅 내용 -->
							str += ``;
							str += `</div>`;
							str += `</div>`;
					}else { 
						//<!-- 메시지 (상대방) -->
						str += `<div class="resiver">`;
						//<!-- 채팅 프로필 사진  -->
						str += `<div class="chatprofile" style="width: 80px; display: inline-block;">`;
						str += `<div class="profile">`;
						str += `<img id="picture" src="/soju/profile.do?fileName=${v.photo}"><br>`;
						str += `</div>`;
						str += `<p class="time">${v.chat_time}</p>`;//<!-- 시간 -->
						str += `</div>`;
						str += `<div class="message" >`;
						str += `<div class="resnick">${v.mem_nick}</div>`;//<!-- 상대방 닉네임 -->
						str += `${v.chat_cont}`;
						str += `</div>`;
						str += `</div>`;
					}
				})
			$('.pchat').html(str);
			$(".pchat").scrollTop($(".pchat")[0].scrollHeight);

			$('.'+art_name).show();
		},
		error : function(xhr) {
			alert(xhr.status);
		},
		dataType : 'json'
	})
}

//채팅 출력하기
function chatListArt() {
	
	$.ajax({

		url : "/soju/ChatList.do",
		type : "post",
		data : {"art_name" : art_name},
		success : function(res) {
			str="";

				$.each(res, function(i, v) {
					if(v.mem_nick == mem_nick){// 멤버 아이디가 지금 접속중인 내 아이디와 같을 때
							//<!-- 메시지 (나) -->
							str += `<div class="sender">`;
							//<!-- 채팅 프로필 사진  -->
							str += `<div class="myprofile" style="width: 80px; display: inline-block;">`;
							str += `<div class="profile">`;
							str += `<img id="picture" src="/soju/profile.do?fileName=${v.photo}"><br>`;
							str += `</div>`;
							str += `<p class="time">${v.chat_time}</p>`;//<!-- 시간 -->
							str += `</div>`;
							str += `<div style="line-height:200%"><br></div>`;
							str += `<div class="smessage" >`;
							str += `<div class="snick">${v.mem_nick}</div>`;//<!-- 내 닉네임 -->
							str += `${v.chat_cont}`;//<!-- 채팅 내용 -->
							str += ``;
							str += `</div>`;
							str += `</div>`;
					}else if(v.mem_nick == v.art_name) { //연예인
						//<!-- 메시지 (상대방) -->
						str += `<div class="resiver">`;
						//<!-- 채팅 프로필 사진  -->
						str += `<div class="chatprofile" style="width: 80px; display: inline-block;">`;
						str += `<div class="profile">`;
						str += `<img id="picture" src="/soju/profile.do?fileName=${v.photo}"><br>`;
						str += `</div>`;
						str += `<p class="time">${v.chat_time}</p>`;//<!-- 시간 -->
						str += `</div>`;
						str += `<div class="message" >`;
						str += `<div class="resnick">${v.mem_nick}</div>`;//<!-- 상대방 닉네임 -->
						str += `${v.chat_cont}`;
						str += `</div>`;
						str += `</div>`;
					}
				})
			$('.pchat').html(str);
			$(".pchat").scrollTop($(".pchat")[0].scrollHeight);

			$('.'+art_name).show();
		},
		error : function(xhr) {
//			alert(xhr.status);
		},
		dataType : 'json'
	})
}



	// 채팅 자동삭제
function deleteChat() {
	$.ajax({
		url : "/soju/DeleteChat.do",
		type : "get",
		success : function(res) {
//			alert(res.sw)
		},
		error : function(xhr) {
//			alert(xhr.status);
		},
		dataType : 'json'
	})
	
}


 