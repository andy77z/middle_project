<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="kr">
<head>
  <title>회원가입 페이지</title>
  <meta charset="utf-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <script>
  $(function(){
	  
	  //id입력 시 정규식검증
	  $('#id').on('keyup', function(){
	  	idval = $('#id').val().trim();
	  	
	  	idreg = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/
	  	
	  	if(!(idreg.test(idval))){
	  		$(this).css('border', '1px solid red');
	  		//중복검사버튼 비활성
	  		$('#idbtn').prop('disabled', true);
	  	}else{
	  		$(this).css('border', '1px solid blue');
	  		//중복검사버튼 활성
	  		$('#idbtn').prop('disabled', false);
	  	}
	})
	
	 //아이디 중복검사
  	$('#idbtn').on('click',function(){
  		idval = $('#id').val().trim();
  		
  		if(idval.length < 1){
  			alert("ID를 입력하세요");
  			return false;
  		}
  		 		
  		//서버로 전송하기
  		$.ajax({
  			url : '/soju/checkId.do',
  			data : {"id" : idval},
  			type : 'get',
  			success : function(res){
  				 // console.log(JSON.parse(res));
  				$('#spanid').html(res.sw).css('color','green');
  			},
  			error : function(xhr){
  				alert("상태:"+xhr.status);//404,500,200
  			},
  			dataType : 'json'
  			
  		})
  		
  		
  	})
	  
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
	  

		 //닉네임 중복검사
	  	$('#nbtn').on('click',function(){
	  		//nickval = $('#nick').val().trim();
	  		
	  		if(nickval.length < 1){
	  			alert("닉네임을 입력하세요");
	  			return false;
	  		}
	  		 		
	  		//서버로 전송하기
	  		$.ajax({
	  			url : '/soju/checkNick.do',
	  			data : {"nick" : nickval},
	  			type : 'get',
	  			success : function(res){
	  				 // console.log(JSON.parse(res));
	  				$('#spannick').html(res.sw).css('color','green');
	  			},
	  			error : function(xhr){
	  				alert("상태:"+xhr.status);//404,500,200
	  			},
	  			dataType : 'json'
	  			
	  		})
	  		
	  		
	  	})
		  
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
		 		$('#chpass').html("비밀번호가 일치하지 않습니다").css('color','red');
			}else{
				$('button:submit').prop('disabled', false);
				$('#chpass').empty();
			}
		 
	  });
	 
	 	
  
  	//가입-저장하기
  	$('#subbtn').on('click',function(){
  		  	
  		$.ajax({
  	  		url : '/soju/insert.do',
  	  		data : {"id" : idval,
  	  				"name" : nameval,
  	  				"nick" : nickval,
  	  				"mail" : mailval,
  	  				"pass" : passval
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
<style>
*, :after, :before {
    box-sizing: border-box;
}
div {
    display: block;
}
.a2{
	position: relative;
}
.a3{
	border: 1px solid lightgray;
	border-radius: 8px;
	padding: 0px 48px;
	width: 480px;
	margin: 104px auto;
}
.a4{
	margin-bottom: 26px;
	text-align: center;
}
.a5{
	text-align: center;
	margin-top: 56px;
}
.loginname{
	font-size: 32px;
	font-weight: bold;
	line-height: 1.4;
	margin-top: 6px;
}
.form-control{
	display: block;
	width: 100%;
	height: 40px;
	padding: 14px;
	border: 1px solid lightgray;
	background-color: white;
	font-size: 16px;
	border-radius: 4px;
	word-break: break-all;
}
.bbttnn{
	margin-top: 24px;
}
.seccess{
	margin: 0px;
	margin-bottom: 5px;
	appearance: none;
	background: none #2C7CE6;
	outline: none;
	border-radius: 4px;
	border: 1px solid #2C7CE6;
	color: white;
	display: inline-block;
	font-size: 17px;
	font-weight: 700;
	width: 100%;
	height: 52px;
	line-height: 50px;
	padding: 0px 12px;
	text-align: center;
	margin-bottom: 50px;
	cursor:pointer;
}

.checkid{
	
	background-color: #2C7CE6;
	color: white;
	border: 1px solid lightgray;
	height: 2.3em;
	text-align: center;
	cursor:pointer;
	width: auto;
}

.checknick{
	
	background-color: #2C7CE6;
	color: white;
	border: 1px solid lightgray;
	height: 2.3em;
	text-align: center;
	cursor:pointer;
	width: auto;
}
</style> 
</head>
<body>
<div class="a1">
	<div class="a2">
		<div class="a3">
			<div class="a4">
				<div class="a5">
 					<img class="imgg" src="<%= request.getContextPath() %>/images/logosample.png" alt="logo">
				
				</div>
				<div class="loginname">회원가입</div>
			</div>
			
			<form>
    			<div>
        			<input type="text" class="form-control" id="id" placeholder="ID" name="mem_id">
        			<button id="idbtn" type="button" class="checkid">ID 중복검사</button><span id="spanid"></span>
    			</div>
    			
    			<div style="margin-top: 15px;">
        			<input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="mem_pass">
    			</div>
    			
    			<div style="margin-top: 15px;">
        			<input type="password" class="form-control" id="pwd2" placeholder="비밀번호확인" name="mem_pass2">
    			</div>
    			
    			<div style="margin-top: 15px;">
        			<input type="text" class="form-control" id="name" placeholder="이름" name="mem_name">
    			</div>
    			
    			<div style="margin-top: 15px;">
        			<input type="text" class="form-control" id="nick" placeholder="닉네임" name="mem_nick">
        			<button id="nbtn" type="button" class="checknick">닉네임 중복검사</button><span id="spannick"></span>
    			</div>
    			<div style="margin-top: 15px;">
        			<input type="text" class="form-control" id="email" placeholder="Email" name="mem_mail">
    			</div>
    			
  			</form>
			<div class="bbttnn">        
        		<button id="subbtn" type="submit" class="seccess">작성완료</button>
    		</div>
		</div>
	</div>
</div>



</body>
</html>
    