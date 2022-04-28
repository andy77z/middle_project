/**
 * 
 */

function myTicketList(){
	
	$.ajax({
		url : '/soju/listTicket.do',
		type : 'get',
		data : {"memNum" : memNum}, 
		success : function(res){
			
			code = '';
			code += '<table>';
			code += '<tr class="maintr">';
	        code += '<td class="none"></td>'; 
	        code += '<td class="td_artist">아티스트</td>'; 
	        code += '<td class="td_price">이용권 가격</td>'; 
	        code += '<td class="td_start">시작일</td>'; 
	        code += '<td class="td_end">종료일</td>'; 
	        code += '<td class="td_state">사용여부</td>'; 
	        code += '</tr>';
			$.each(res, function(i, v){
			today = new Date();
			adate = new Date(v.tk_sdate);
			dayafter = today.getTime() - adate.getTime();
			dayafter = Math.ceil(dayafter / (1000*60*60*24));
			if(v.tk_state!="O"){
			code += '<tr>';	 
			code += '<td class="'+v.tk_num+'"><img class="ticketImg" alt="이용권.png" src="/soju/images/ticket.png"></td>';	 
			code += '<td class="tk_artistName">'+v.art_Name+'</td>';     
		    code += '<td class="tk_price">3,500원</td>';     
		    code += '<td class="tk_start">'+v.tk_sdate+'</td>';     
		    code += '<td class="tk_end">'+v.tk_edate+'</td>';
		    if(v.tk_state=="Y" || dayafter >= 7){
		    	code += '<td class="tk_state">사용중</td>';	
		    }else if(v.tk_state=="N" && dayafter < 7){
		    	code += '<td class="tk_state">미사용';
		    	code += '<button class="buyTicketBtn btn-info" type="button">환불하기</button></td>';
		    }
		    code += '</tr>';     
			};
		    });
			code += '</table>';     
		    $(".buyTicketDiv").html(code); 
		},
		error : function(xhr){
			alert("상태: " + xhr.status);
		},
		dataType : 'json'
	});
};	

function updateTicket(){
	
	$.ajax({
		url : '/soju/updateTicket.do',
		type : 'get',
		data : {"ticNum" : ticNum}, 
		success : function(res){
			alert("환불완료");
			window.location.reload();
		},
		error : function(xhr){
			alert("상태: " + xhr.status);
		},
		dataType : 'json'
	});
	
};
		