/**
 * 
 */

function listAllTicket(){
	
	$.ajax({
		url : '/soju/AdminListAllTicket.do',
		type : 'get',
		success : function(res){
		
			code = '';
			code += '<table>';
	        code += '<tr>';
			code += '<td>티켓번호</td>';	 
		    code += '<td>회원아이디</td>';     
		    code += '<td>아티스트명</td>';     
		    code += '<td>시작일</td>';     
		    code += '<td>종료일</td>';
		    code += '<td>상태</td>';
		    code += '<td>결제번호</td>';
		    code += '</tr>';
	    	$.each(res, function(i, v){
	    	if(v.tic_state!="O"){
	    	code += '<tr>';
			code += '<td class="adm_tkNum">'+v.tic_num+'</td>';	 
		    code += '<td class="adm_memId">'+v.mem_id+'</td>';     
		    code += '<td class="adm_artName">'+v.art_name+'</td>';     
		    code += '<td class="adm_tkStart">'+v.tic_sdate+'</td>';     
		    code += '<td class="adm_tkEnd">'+v.tic_edate+'</td>';
		  
		    if(v.tic_state=="Y"){
		    	code += '<td class="adm_tkState">사용중</td>';	
		    }else if(v.tic_state=="N"){
		    	code += '<td class="adm_tkState">미사용</td>';
		    }
		    code += '<td class="adm_payNum">'+v.pay_num+'</td>';
		    code += '</tr>';
	    	}
		 });
			code += '</table>';     
		    $(".admintiket1").html(code); 
		
		},
		error : function(xhr){
			alert("상태: " + xhr.status);
		},
		dataType : 'json'
				
	});
};	