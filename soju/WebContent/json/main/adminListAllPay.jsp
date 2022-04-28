<%@page import="soju.vo.PayVO"%>
<%@page import="soju.vo.TicketVO"%>
<%@page import="java.util.List"%>
<%@page import="soju.vo.TicketListAllVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<PayVO> list = (List<PayVO>)request.getAttribute("listAllPay");
%>

[
<%
	int i =0;
	for(PayVO vo : list){
		if(i > 0) out.print(",");

%>
{
			    "pay_num" : "<%= vo.getPay_num() %>",
				"pay_name" : "<%= vo.getPay_name() %>",
				"pay_price" : "<%= vo.getPay_price() %>",
				"pay_date" : "<%= vo.getPay_date() %>",
				"refund" : "<%= vo.getRefund() %>",
				"mem_num" : "<%= vo.getMem_num() %>",
				"agc_num" : "<%= vo.getAgc_num() %>"
		}
		
<%
i++;
	}
%>
]