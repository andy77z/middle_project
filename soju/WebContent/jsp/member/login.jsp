<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="kr">
<head>
  <title>So? Would You?</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>
  <script>
  $(function(){

  	//로그인하기
  	$('#libtn').on('click',function(){
  		
  		idval = $('#id').val().trim();
  		passval = $('#pwd').val().trim();
  		
  		$.ajax({
  	  		url : '/soju/login.do',
  	  		data : {"id" : idval,
  	  				"pass" : passval
  	  				},
  	  		type : 'post',
  	  		success: function(res){
  	  			if(res.sw=="성공"){
	  	  			opener.location.href="<%=request.getContextPath()%>/jsp/main/loginMain.jsp";
	  	  			window.close();
  	  			}
//   	  			else{
//   	  			alert("로그인 정보가 올바르지 않습니다.\n다시 로그인해주세요.");
//   	  			}
  	  		},
  	  		error : function(xhr){
//   	  			alert("상태 : "+xhr.statustext);
  	  		alert("로그인 정보가 올바르지 않습니다.\n다시 로그인해주세요.");
  	  			
  	  		},
  	  		dataType: 'json'
  		})
  	})
  	
  	//아이디/비번찾기
  	$('#findbtn').on('click', function(){
  		//location.href = "/soju/member/findId.jsp";
  		window.open("<%=request.getContextPath()%>/jsp/member/findMember.jsp","_blank","width=550 height=600");
  		

  		
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
.form-control, .form-control{
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
.btnlogin, .btnidpw{
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
	cursor:pointer;
}
.btnidpw{
	margin-bottom: 50px;
	cursor:pointer;
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
				<div class="loginname">로그인</div>
			</div>
			<form>
    			<div>
        			<input type="text" class="form-control" id="id" placeholder="소우주 ID" name="mem_id">
    			</div>
    
    			<div style="margin-top: 8px;">
        			<input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="mem_pass">
        		<br>
    			</div>
  			</form>
			<div class="bbttnn">        
        		<button id="libtn" type="submit" class="btnlogin">로그인</button>
        		<button id="findbtn" type="button" class="btnidpw">ID/비밀번호 찾기</button>
    		</div>
		</div>
	</div>
</div>

  
</body>
</html>
    