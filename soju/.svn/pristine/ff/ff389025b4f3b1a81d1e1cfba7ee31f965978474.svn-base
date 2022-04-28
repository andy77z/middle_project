/**
 * 
 */

function myPaymentList(){
	
	$.ajax({
		url : '/soju/listPayment.do',
		type : 'get',
		data : {"memNum" : memNum}, 
		success : function(res){
			
			code = '';
			code += '<table>';
			code += '<tr class="maintr">'; 
			code += '<td class="td_artist">아티스트</td>'; 
			code += '<td class="td_payNum">결제번호</td>'; 
			code += '<td class="td_price">가격</td>'; 
			code += '<td class="td_payDate">결제일</td>'; 
			code += '<td class="td_refund">환불여부</td>'; 
			code += '</tr>'; 
			$.each(res, function(i, v){
			code += '<tr>';	 
			code += '<td class="pm_artist">'+v.pay_name+'</td>';	 
			code += '<td class="pm_payNum">'+v.pay_num+'</td>';     
		    code += '<td class="pm_price">'+v.pay_price+'</td>';     
		    code += '<td class="pm_start">'+v.pay_date+'</td>';     
		   if(v.refund=="Y"){
		       code += '<td class="pm_refundState">완료</td>';	
		    }else if(v.refund=="N"){
		    	code += '<td class="pm_refundState"></td>';
		    }
		    code += '</tr>';     
		    
		    });
			code += '</table>';     
		    $(".paymentDiv").html(code); 
		},
		error : function(xhr){
			alert("상태: " + xhr.status);
		},
		dataType : 'json'
	});
};	