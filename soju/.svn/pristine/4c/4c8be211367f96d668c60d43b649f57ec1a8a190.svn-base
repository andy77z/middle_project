<%@page import="soju.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="<%= request.getContextPath() %>/js/myTicket/checkTicket.js"></script>

 <%
     MemberVO mvo = (MemberVO)session.getAttribute("loginUser"); 
     int memNum = mvo.getMem_num(); 
     int artnum = (Integer)session.getAttribute("art_num");
 %>

<style>

	img{

	  cursor: pointer;
	  border-radius: 5px;
	  margin-left: 4.2%;
    margin-top: 5%;
	}

 div { 
 border:1px solid white;; 
 width: 50%;
height: 300px;
 background: #1282ff;
 border-radius: 10px;
 } 
p{
background:#622off;
border: 1px solid white;
border-radius: 5px;
/* font-weight: bold; */
color: white;
}
.payChoice{
text-align: center;
}
</style>

<script>
memNum = <%= memNum %>;
artNum = <%= artnum %>;
payNum = 0;
function kakaoPay(){
    var IMP = window.IMP; 
    IMP.init('imp33642210'); 
    IMP.request_pay({
    	pg : "kakaopay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : 3500,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
        	
        	$.ajax({
    			url : '/soju/insertPay.do',
    			type : 'post',
    			data : {"memNum" : memNum,"artNum" : artNum}, 
    			success : function(res){
    				payNum = res;
    				$.ajax({
    	    			url : '/soju/insertTicket.do',
    	    			type : 'post',
    	    			data : {"memNum" : memNum,"artNum" : artNum,"payNum" : payNum}, 
    	    			success : function(res){
    	    		    
    	    				var msg = '결제가 완료되었습니다.';
    	    	            alert(msg);
    	    	            window.close();
    	    	            opener.location.href = '/soju/jsp/chatting/webSocketGroupMutiChatting.jsp';
    	    				
    	    			},
    	    			error : function(xhr){
    	    				alert("상태: " + xhr.status);
    	    			},
    	    			dataType : 'json'
    	    		});
    			},
    			error : function(xhr){
    				alert("상태: " + xhr.status);
    			},
    			dataType : 'json'
    		});
            
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            opener.location.href = '/soju/jsp/feed/feed0.jsp';
            window.close();
        }
    });
  
}
function payco(){
    var IMP = window.IMP; 
    IMP.init('imp33642210'); 
    IMP.request_pay({
    	pg : "payco", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : 1,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            location.href='https://www.naver.com/';
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
}

function tosspay(){
    var IMP = window.IMP; 
    IMP.init('imp33642210'); 
    IMP.request_pay({
    	pg : "tosspay", 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : 1,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            location.href='https://www.naver.com/';
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
}

/* function inicis(){
    var IMP = window.IMP; 
    IMP.init('imp33642210'); 
    IMP.request_pay({
    	pg : 'html5_inicis', 
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '결제',
        amount : 1,
        buyer_email : '구매자 이메일',
        buyer_name : '구매자 이름',
        buyer_tel : '구매자 번호',
        buyer_addr : '구매자 주소',
        buyer_postcode : '구매자 주소',
        m_redirect_url : 'redirect url'
    }, function(rsp) {
//     	var result = '';
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
//             msg += '고유ID : ' + rsp.imp_uid;
// 	        msg += '상점 거래ID : ' + rsp.merchant_uid;
// 	        msg += '결제 금액 : ' + rsp.paid_amount;
// 	        msg += '카드 승인번호 : ' + rsp.apply_num;
// 	        result ='0';
            location.href='https://www.naver.com/';
        } else {
            var msg = '결제에 실패하였습니다.';
            rsp.error_msg;
            
        }
    });
} */
    </script>
</head>
    
    <body>
    	
       <div class="payDiv" border='1'>
       <p>상품명 : <span id="pName"></span>TICKET</p>
       <p>결제금액 : 3,500</p>
       <p class="payChoice">결제방법 선택</p>
    	<img src="/soju/images/카카오페이.jpg" onclick="kakaoPay()">
    	<img src="/soju/images/payco.png" onclick="payco()">
    	<img src="/soju/images/toss.png" onclick="tosspay()">
    	
    	</div>
<!--     	<img src="../images/star.png" onclick="inicis()"> -->
    </body>
    </html>