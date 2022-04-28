<%@page import="java.util.List"%>
<%@page import="soju.vo.TicketListAllVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<TicketListAllVO> list = (List<TicketListAllVO>)request.getAttribute("listAllTicket");
%>

[
<%
	int i =0;
	for(TicketListAllVO vo : list){
		if(i > 0) out.print(",");

%>
{
			    "tic_num" : "<%= vo.getTic_num() %>",
				"mem_id" : "<%= vo.getMem_id() %>",
				"art_name" : "<%= vo.getArt_name() %>",
				"tic_sdate" : "<%= vo.getTic_sdate() %>",
				"tic_edate" : "<%= vo.getTic_edate() %>",
				"tic_state" : "<%= vo.getTic_state() %>",
				"pay_num" : "<%= vo.getPay_num() %>"
		}
		
<%
i++;
	}
%>
]