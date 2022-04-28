<%@page import="soju.vo.ArtistVO"%>
<%@page import="soju.vo.AgencyVO"%>
<%@page import="soju.vo.ManagerVO"%>
<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kr">
<head>
  <title>회원정보 수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style>
*{
/*border : 1px solid blue;*/
}
.container{
	/*border : 1px solid blue;*/
	max-width : 680px;
	margin-top: 10px;
}
.container h2{
	margin-left: 80px;
    padding: 30px;
    display: block;
    width: 400px;
}
.container input{
	width: 200px;
	
}
.form-group input,.form-group label,.form-group button{
	margin-left: 150px;
	margin-top: -5px;
}

#chpass{
	margin-left: 150px;
}

.pw2{
	width: 120px;
}

  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
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
	String idval = userId;
	
%>

  <script>
  $(function(){
	name = $('.myid', opener.document).attr('name');
	arr = $('.myid', opener.document).text().split('(');
	mail = arr[2].substring(0,arr[1].length-1);
	nick = $('.mynickname', opener.document).text();
	
	$('#name').val(name);
	$('#nick').val(nick);
	$('#email').val(mail);
	
	//이름 입력
	$('#name').on('keyup', function(){
	  	
		nameval = $('#name').val().trim();
		
		namereg = /^[가-힣]{2,5}$/
		
		
			if(!(namereg.test(nameval))){
				$(this).css('border', '1px solid red');
				$('button:submit').prop('disabled', true);
				//return false;
			}else{
				
				$(this).css('border', '1px solid blue');
				$('button:submit').prop('disabled', false);
				//return false;
			}
	});
	
	  //닉네임 입력
	  $('#nick').on('keyup', function(){
		  	
			nickval = $('#nick').val().trim();
			
			nickreg = /^[가-힣a-zA-Z0-9]{2,11}$/
			
			
				if(!(nickreg.test(nickval))){
					$(this).css('border', '1px solid red');
					$('button:submit').prop('disabled', true);
					//return false;
				}else{
					
					$(this).css('border', '1px solid blue');
					$('button:submit').prop('disabled', false);
					//return false;
				}
		});


		  
	//이메일 입력
	  $('#email').on('keyup', function(){
		  mailval = $('#email').val().trim(); 
		  mailreg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		  
		  if(!(mailreg.test(mailval))){
			  
				$(this).css('border', '1px solid red');
				$('button:submit').prop('disabled', true);
				//return false;
			}else{
				
				$(this).css('border', '1px solid blue');
				$('button:submit').prop('disabled', false);
				//return false;
			}
	  
	  });
	  
	  //비밀번호 입력
	  $('#pwd').on('keyup', function(){
		  passval = $('#pwd').val().trim();
	  });
	 //비밀번호 확인 입력
	  $('#pwd2').on('keyup', function(){
		  passval2 = $('#pwd2').val().trim();
		  if(passval != passval2){
		 		$('button:submit').prop('disabled', true);
		 		$('#chpass').html("불일치").css('color','red');
			}else{
				$('button:submit').prop('disabled', false);
				$('#chpass').empty();
			}
		 
	  });
	 
	 //프로필 사진 선택 시
  		$("#profile").change(function(e){
    		alert($('input[type=file]')[0].files[0].name); //파일이름
 			photoname = $('input[type=file]')[0].files[0].name;
    		
 
 
	 })	
  
  	//가입-저장하기
  	$('#subbtn').on('click',function(){
  		  	
  		$.ajax({
  	  		url : '/soju/insert.do',
  	  		data : {"id" : idval,
  	  				"name" : nameval,
  	  				"nick" : nickval,
  	  				"mail" : mailval,
  	  				"pass" : passval,
  	  				"photo": photoval
  	  				},
  	  		type : 'post',
  	  		success: function(res){
  	  			alert(res.sw);
  	  			window.close();
  	  		},
  	  		error : function(xhr){
  	  			alert("상태 : "+xhr.status);
  	  		},
  	  		dataType: 'json'
  	})
  	
  	
  		
  	})
  	
  })

  </script>
  
</head>
<body>

<div class="container">
 <h2><img src="<%= request.getContextPath() %>/images/logosample.png" alt="So? Would You?">정보수정</h2>
  <form class="form-horizontal" onsubmit="return false">
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">이름:</label>
        <input type="text" class="form-control" id="name" placeholder="Enter name" name="mem_name" disabled="disabled">
    </div>
    
    <div class="form-group ">
      <label class="control-label col-sm-2" for="nick">닉네임:</label>
        <input type="text" class="form-control" id="nick" placeholder="Enter nickName" name="mem_nick" disabled="disabled">
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">이메일:</label>
        <input type="text" class="form-control" id="email" placeholder="Enter email" name="mem_mail">
     
    </div>
    
    <div class="form-group mdata">
      <label class="control-label col-sm-2" for="pwd">비밀번호:</label>
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="mem_pass">
     
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd2" id="pw2">비밀번호확인:</label>
        <input type="password" class="form-control" id="pwd2" placeholder="Enter password" name="mem_pass2">
        <span id="chpass"></span>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="profile">프로필사진:</label>
        <input type="file" class="form-control" id="profile" placeholder="select file" name="mem_photo">
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button id="subbtn" type="submit" class="btn btn-primary btn-lg">Submit</button>
      </div>
    </div>
    
  </form>
</div>

</body>
</html>
    