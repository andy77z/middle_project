/**
 * 
 */
function checkTicket(){
	
	$.ajax({
		url : '/soju/checkTicket.do',
		type : 'get',
		data : {"memNum" : memNum,"artNum" : artNum}, 
		success : function(res){
	    console.log(res)
		if(res==null){
		returnValue = confirm('이용권이 필요합니다.구매하시겠습니까?');
		//없을 시 결제여부 확인 후 결제창으로 보내기
		if(returnValue==true){
			
			//결제창에 상품명 출력
			$.ajax({
				url : '/soju/ArtInfo.do',
				type : 'get',
				data : {"artNum" : artNum}, 
				success : function(res){
			    
//				code = '<p>상품명 : '+res.art_name+'BLACKPINK TICKET</p>';
//				code += '<p>결제금액 : 3,500</p>';
//				code += '<p class="payChoice">결제방법 선택</p>';
//				code += '<img src="/soju/profile.do?fileName=카카오페이.jpg" onclick="kakaoPay()">';
//				code += '<img src="/soju/profile.do?fileName=payco.png" onclick="payco()">';
//				code += '<img src="/soju/profile.do?fileName=toss.png" onclick="tosspay()">';
				
				 window.open("/soju/jsp/payApi/pay.jsp","_blank","width=550 height=600");
				 
//				 $('.payDiv').html(code);
//				 
//				 a.document.getElementById('pName').innerHTML=res.art_name;
				 
				},
				error : function(xhr){
					alert("상태: " + xhr.status);
				},
				dataType : 'json'
			
				
			});
			
//			window.open("../payApi/pay.jsp","_blank","width=550 height=600");
		}else{
			 window.history.back();
		}
		
		}else{
			location.href = '/soju/jsp/chatting/webSocketGroupMutiChatting.jsp';
		}
			
		},
		error : function(xhr){
			alert("상태: " + xhr.status);
		},
		dataType : 'json'
	
		
	});
	
 };	
 
 function buyTicket(){
		
		$.ajax({
			url : '/soju/buyTicket.do',
			type : 'post',
			data : {"memNum" : memNum,"artNum" : artNum}, 
			success : function(res){
		    
			if(res==null){
				alert(returnValue);
				
			}	
				
			},
			error : function(xhr){
				alert("상태: " + xhr.status);
			},
			dataType : 'json'
		
			
		});
		
	 };	