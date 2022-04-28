/**
 * 
 */

function listAllPay(){
	
	$.ajax({
		url : '/soju/AdminListAllPay.do',
		type : 'get',
		success : function(res){
		
			code = '';
			code += '<table>';
	        code += '<tr>';
			code += '<td>결제번호</td>';	 
		    code += '<td>아티스트명</td>';     
		    code += '<td>결제가격</td>';     
		    code += '<td>결제일</td>';     
		    code += '<td>환불여부</td>';
		    code += '<td>회원번호</td>';
		    code += '<td>소속사번호</td>';
		    code += '</tr>';
	    	$.each(res, function(i, v){
	    	
	    	code += '<tr>';
			code += '<td class="adm_tkNum">'+v.pay_num+'</td>';	 
		    code += '<td class="adm_memNum">'+v.pay_name+'</td>';     
		    code += '<td class="adm_artNum">'+v.pay_price+'</td>';     
		    code += '<td class="adm_tkStart">'+v.pay_date+'</td>';     
		    if(v.refund=="Y"){
		    	code += '<td class="adm_tkState">환불완료</td>';	
		    }else if(v.refund=="N"){
		    	code += '<td class="adm_tkState">해당없음</td>';
		    }
		    code += '<td class="adm_memNum">'+v.mem_num+'</td>';
		    code += '<td class="adm_agcNum">'+v.agc_num+'</td>';
		    code += '</tr>';
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